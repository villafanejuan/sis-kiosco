<?php
require_once __DIR__ . '/../app/bootstrap.php';
checkSession();

// Determinar permisos y filtro
// Determinar permisos y filtro
$isAdmin = checkAdmin();
$userId = $_SESSION['user_id'];
$userRole = strtolower($_SESSION['role'] ?? '');
$isKiosquero = ($userRole === 'kiosquero');
$userFilter = null;

$whereClause = "";
$params = [];

// Admin y Cajero (Auditor) pueden ver todo y filtrar
if ($isAdmin || $userRole === 'cajero') {
    // Verificar si hay filtro en URL
    if (isset($_GET['user_filter']) && $_GET['user_filter'] !== 'all') {
        $userFilter = intval($_GET['user_filter']);
        $whereClause = "WHERE usuario_id = ?";
        $params = [$userFilter];
    }

    // Obtener lista de usuarios para el filtro
    $stmt = $pdo->query("SELECT id, nombre, username, role FROM usuarios ORDER BY nombre");
    $users = $stmt->fetchAll();
} else {
    // Kiosquero: Solo puede ver SUS ventas
    $userFilter = $userId;
    $whereClause = "WHERE usuario_id = ?";
    $params = [$userFilter];
    // No cargamos la lista de usuarios porque no pueden filtrar
    $users = [];
}

// Helper para construir cláusulas WHERE compuestas
function buildWhere($baseWhere, $extraCondition)
{
    if (empty($baseWhere)) {
        return "WHERE " . $extraCondition;
    }
    return $baseWhere . " AND " . $extraCondition;
}

// 1. Estadísticas generales
$sql = "SELECT COUNT(*) as total_ventas, COALESCE(SUM(total), 0) as ingresos_totales FROM ventas $whereClause";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$stats = $stmt->fetch();

// 2. Ventas por día (últimos 5 días)
$dateCondition = "fecha >= DATE_SUB(CURDATE(), INTERVAL 5 DAY)";
$sql = "SELECT DATE(fecha) as fecha, COUNT(*) as cantidad, SUM(total) as total 
        FROM ventas 
        " . buildWhere($whereClause, $dateCondition) . "
        GROUP BY DATE(fecha) 
        ORDER BY fecha DESC";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$ventas_semanales = $stmt->fetchAll();

// 3. Productos más vendidos
// Note: This needs joining ventas to filter by user
$sql = "SELECT p.nombre, SUM(vd.cantidad) as total_vendido 
        FROM venta_detalles vd 
        JOIN productos p ON vd.producto_id = p.id 
        JOIN ventas v ON vd.venta_id = v.id
        $whereClause
        GROUP BY p.id, p.nombre 
        ORDER BY total_vendido DESC 
        LIMIT 5";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$productos_mas_vendidos = $stmt->fetchAll();

// 4. Ventas por mes (últimos 5 meses)
$dateCondition = "fecha >= DATE_SUB(CURDATE(), INTERVAL 5 MONTH)";
$sql = "SELECT DATE_FORMAT(fecha, '%Y-%m') as mes, COUNT(*) as cantidad, SUM(total) as total 
        FROM ventas 
        " . buildWhere($whereClause, $dateCondition) . "
        GROUP BY DATE_FORMAT(fecha, '%Y-%m') 
        ORDER BY mes DESC";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$ventas_mensuales = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes - Sistema Kiosco</title>
    <script src="assets/js/tailwindcss.js"></script>
    <link href="assets/css/fontawesome.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <!-- Navegación -->
    <?php include __DIR__ . '/../includes/nav.php'; ?>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-4">
            <h1 class="text-3xl font-bold text-gray-800">
                <i class="fas fa-chart-pie text-purple-600 mr-2"></i>Reportes y Estadísticas
                <?php if (!$isAdmin): ?>
                    <span class="text-sm font-normal text-gray-500 block">Mis Ventas</span>
                <?php endif; ?>
            </h1>

            <?php if ($isAdmin || $userRole === 'cajero'): ?>
                <div class="bg-white p-2 rounded-lg shadow-sm border border-gray-200">
                    <form method="GET" class="flex items-center gap-2">
                        <label for="user_filter" class="text-sm font-medium text-gray-700">Ver reporte de:</label>
                        <select name="user_filter" id="user_filter" onchange="this.form.submit()"
                            class="border-gray-300 rounded-md shadow-sm focus:border-purple-500 focus:ring focus:ring-purple-200 focus:ring-opacity-50 text-sm py-1">
                            <option value="all" <?php echo (!isset($_GET['user_filter']) || $_GET['user_filter'] === 'all') ? 'selected' : ''; ?>>
                                📊 General (Todos)
                            </option>
                            <option value="<?php echo $_SESSION['user_id']; ?>" <?php echo (isset($_GET['user_filter']) && $_GET['user_filter'] == $_SESSION['user_id']) ? 'selected' : ''; ?>>
                                👤 Mi Usuario
                            </option>
                            <optgroup label="Usuarios">
                                <?php foreach ($users as $u): ?>
                                    <?php if ($u['id'] != $_SESSION['user_id']): ?>
                                        <option value="<?php echo $u['id']; ?>" <?php echo (isset($_GET['user_filter']) && $_GET['user_filter'] == $u['id']) ? 'selected' : ''; ?>>
                                            <?php echo htmlspecialchars($u['nombre'] ?? $u['username']); ?>
                                            (<?php echo ucfirst($u['role']); ?>)
                                        </option>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </optgroup>
                        </select>
                    </form>
                </div>
            <?php endif; ?>
        </div>


        <div class="flex flex-wrap justify-center gap-6 mb-8">
            <!-- Total Ventas -->
            <div
                class="w-full md:w-[calc(50%-1.5rem)] lg:w-[calc(25%-1.5rem)] bg-gradient-to-br from-blue-400 to-blue-600 text-white p-6 rounded-xl shadow-lg transform hover:scale-105 transition">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm opacity-90">Total Ventas</p>
                        <p class="text-4xl font-bold mt-2"><?php echo htmlspecialchars($stats['total_ventas']); ?></p>
                    </div>
                    <i class="fas fa-shopping-cart text-5xl opacity-30"></i>
                </div>
            </div>

            <!-- Ingresos Totales -->
            <div
                class="w-full md:w-[calc(50%-1.5rem)] lg:w-[calc(25%-1.5rem)] bg-gradient-to-br from-green-400 to-green-600 text-white p-6 rounded-xl shadow-lg transform hover:scale-105 transition">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm opacity-90">Ingresos Totales</p>
                        <p class="text-4xl font-bold mt-2">$<?php echo number_format($stats['ingresos_totales'], 2); ?>
                        </p>
                    </div>
                    <i class="fas fa-dollar-sign text-5xl opacity-30"></i>
                </div>
            </div>

            <!-- Promedio por Venta -->
            <div
                class="w-full md:w-[calc(50%-1.5rem)] lg:w-[calc(25%-1.5rem)] bg-gradient-to-br from-teal-400 to-teal-600 text-white p-6 rounded-xl shadow-lg transform hover:scale-105 transition">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-sm opacity-90">Promedio por Venta</p>
                        <p class="text-4xl font-bold mt-2">
                            $<?php echo $stats['total_ventas'] > 0 ? number_format($stats['ingresos_totales'] / $stats['total_ventas'], 2) : '0.00'; ?>
                        </p>
                    </div>
                    <i class="fas fa-chart-line text-5xl opacity-30"></i>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
            <div class="bg-white p-6 rounded-xl shadow-lg">
                <h3 class="text-xl font-semibold mb-4">Ventas de los Últimos 7 Días</h3>
                <div class="overflow-x-auto">
                    <table class="min-w-full table-auto">
                        <thead class="bg-gray-50">
                            <tr>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Fecha</th>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Cantidad</th>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Total</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <?php foreach ($ventas_semanales as $venta): ?>
                                <tr>
                                    <td class="px-4 py-2 whitespace-nowrap">
                                        <?php echo date('d/m/Y', strtotime($venta['fecha'])); ?>
                                    </td>
                                    <td class="px-4 py-2 whitespace-nowrap">
                                        <?php echo htmlspecialchars($venta['cantidad']); ?>
                                    </td>
                                    <td class="px-4 py-2 whitespace-nowrap">
                                        $<?php echo number_format($venta['total'], 2); ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-lg">
                <h3 class="text-xl font-semibold mb-4">Productos Más Vendidos</h3>
                <div class="overflow-x-auto">
                    <table class="min-w-full table-auto">
                        <thead class="bg-gray-50">
                            <tr>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Producto</th>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Cantidad Vendida</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <?php foreach ($productos_mas_vendidos as $prod): ?>
                                <tr>
                                    <td class="px-4 py-2 whitespace-nowrap"><?php echo htmlspecialchars($prod['nombre']); ?>
                                    </td>
                                    <td class="px-4 py-2 whitespace-nowrap">
                                        <?php echo htmlspecialchars($prod['total_vendido']); ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="bg-white p-6 rounded-xl shadow-lg">
            <h3 class="text-xl font-semibold mb-4">Ventas Mensuales (Últimos 6 Meses)</h3>
            <div class="overflow-x-auto">
                <table class="min-w-full table-auto">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Mes
                            </th>
                            <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Cantidad de Ventas</th>
                            <th class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Total
                            </th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <?php foreach ($ventas_mensuales as $venta): ?>
                            <tr>
                                <td class="px-4 py-2 whitespace-nowrap">
                                    <?php echo date('M Y', strtotime($venta['mes'] . '-01')); ?>
                                </td>
                                <td class="px-4 py-2 whitespace-nowrap"><?php echo htmlspecialchars($venta['cantidad']); ?>
                                </td>
                                <td class="px-4 py-2 whitespace-nowrap">$<?php echo number_format($venta['total'], 2); ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Scripts para Exportación -->
        <!-- (Added earlier) -->

        <?php
        // --- Lógica del Filtro de Período ---
        $period = $_GET['period'] ?? 'all';
        $periodWhere = "";

        switch ($period) {
            case 'today':
                $periodWhere = "DATE(v.fecha) = CURDATE()";
                break;
            case 'week':
                $periodWhere = "YEARWEEK(v.fecha, 1) = YEARWEEK(CURDATE(), 1)";
                break;
            case 'month':
                $periodWhere = "MONTH(v.fecha) = MONTH(CURDATE()) AND YEAR(v.fecha) = YEAR(CURDATE())";
                break;
            case 'year':
                $periodWhere = "YEAR(v.fecha) = YEAR(CURDATE())";
                break;
            case 'all':
            default:
                $periodWhere = "1=1"; // Sin filtro
                break;
        }

        $finalWhere = buildWhere($whereClause, $periodWhere);

        // Query para detalle de ventas con productos
        // Usamos LEFT JOIN para usuarios para evitar perder ventas si el usuario fue eliminado
        $sql_detalle = "SELECT v.id, v.fecha, COALESCE(u.nombre, u.username) as usuario, v.total, v.monto_pagado, v.cambio,
                    GROUP_CONCAT(CONCAT(p.nombre, ' (', vd.cantidad, ')') SEPARATOR ', ') as productos
                    FROM ventas v
                    LEFT JOIN usuarios u ON v.usuario_id = u.id
                    JOIN venta_detalles vd ON v.id = vd.venta_id
                    JOIN productos p ON vd.producto_id = p.id
                    $finalWhere
                    GROUP BY v.id
                    ORDER BY v.fecha DESC
                    LIMIT 2000";

        $stmt = $pdo->prepare($sql_detalle);
        $stmt->execute($params);
        $ventas_detalle = $stmt->fetchAll();

        // Calcular total de la lista mostrada
        $total_listado = array_reduce($ventas_detalle, function ($carry, $item) {
            return $carry + $item['total'];
        }, 0);
        ?>

        <!-- Detalle de Ventas (Nueva Sección) -->
        <div class="bg-white p-6 rounded-xl shadow-lg mt-8 mb-8">
            <div class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
                <h3 class="text-xl font-semibold text-gray-800">
                    <i class="fas fa-list-alt text-blue-600 mr-2"></i>Detalle de Ventas
                </h3>

                <!-- Filtro de Período -->
                <form method="GET" class="flex items-center gap-2">
                    <?php if (isset($_GET['user_filter'])): ?>
                        <input type="hidden" name="user_filter"
                            value="<?php echo htmlspecialchars($_GET['user_filter']); ?>">
                    <?php endif; ?>
                    <label for="period" class="text-sm font-medium text-gray-700">Período:</label>
                    <select name="period" id="period" onchange="this.form.submit()"
                        class="border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-200 text-sm py-1">
                        <option value="today" <?php echo $period === 'today' ? 'selected' : ''; ?>>📅 Hoy</option>
                        <option value="week" <?php echo $period === 'week' ? 'selected' : ''; ?>>📅 Esta Semana</option>
                        <option value="month" <?php echo $period === 'month' ? 'selected' : ''; ?>>📅 Este Mes</option>
                        <option value="year" <?php echo $period === 'year' ? 'selected' : ''; ?>>📅 Este Año</option>
                        <option value="all" <?php echo $period === 'all' ? 'selected' : ''; ?>>∞ Todo</option>
                    </select>
                </form>

                <div class="flex gap-2">
                    <button onclick="exportTableToExcel('sales_table', 'reporte_ventas_<?php echo $period; ?>')"
                        class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded inline-flex items-center transition">
                        <i class="fas fa-file-excel mr-2"></i>Exportar Excel
                    </button>
                    <button onclick="exportTableToPDF('reporte_ventas_<?php echo $period; ?>')"
                        class="bg-red-600 hover:bg-red-700 text-white font-bold py-2 px-4 rounded inline-flex items-center transition">
                        <i class="fas fa-file-pdf mr-2"></i>Exportar PDF
                    </button>
                </div>
            </div>

            <div class="overflow-hidden border border-gray-200 rounded-lg shadow-md">
                <div class="max-h-[600px] overflow-y-auto">
                    <table id="sales_table" class="min-w-full table-auto text-sm relative">
                        <thead class="bg-gray-50 sticky top-0 z-10 shadow-sm">
                            <tr>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    ID
                                </th>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Fecha
                                </th>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Usuario</th>
                                <th
                                    class="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Productos</th>
                                <th
                                    class="px-4 py-2 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                                    Total</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <?php foreach ($ventas_detalle as $v): ?>
                                <tr class="hover:bg-gray-50 transition">
                                    <td class="px-4 py-2 whitespace-nowrap font-medium text-gray-900">
                                        #<?php echo $v['id']; ?>
                                    </td>
                                    <td class="px-4 py-2 whitespace-nowrap">
                                        <?php echo date('d/m/Y H:i', strtotime($v['fecha'])); ?>
                                    </td>
                                    <td class="px-4 py-2 whitespace-nowrap">
                                        <span
                                            class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <?php echo empty($v['usuario']) ? 'bg-gray-100 text-gray-500' : 'bg-blue-100 text-blue-800'; ?>">
                                            <?php echo htmlspecialchars($v['usuario'] ?? 'Eliminado/Desconocido'); ?>
                                        </span>
                                    </td>
                                    <td class="px-4 py-2 text-gray-500 max-w-md truncate"
                                        title="<?php echo htmlspecialchars($v['productos'] ?? ''); ?>">
                                        <?php echo htmlspecialchars($v['productos'] ?? ''); ?>
                                    </td>
                                    <td class="px-4 py-2 whitespace-nowrap text-right font-bold text-gray-800">
                                        $<?php echo number_format($v['total'], 2); ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                        <tfoot class="bg-gray-100 font-bold">
                            <tr>
                                <td colspan="4" class="px-4 py-2 text-right text-gray-700 uppercase tracking-wider">
                                    Total
                                    General:</td>
                                <td class="px-4 py-2 text-right text-gray-900">
                                    $<?php echo number_format($total_listado ?? 0, 2); ?></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <?php if (count($ventas_detalle) >= 2000): ?>
                    <p class="text-xs text-center text-gray-500 mt-2">Mostrando las últimas 2000 ventas del período
                        seleccionado.
                    </p>
                <?php endif; ?>
            </div>
        </div> <!-- Close main div? No, check structure -->

    </div>

    <!-- Scripts para Exportación -->
    <script src="assets/js/xlsx.full.min.js"></script>
    <script src="assets/js/jspdf.umd.min.js"></script>
    <script src="assets/js/jspdf.plugin.autotable.min.js"></script>

    <script>
        function exportTableToExcel(tableId, filename = 'reporte') {
            const table = document.getElementById(tableId);
            const wb = XLSX.utils.table_to_book(table, { sheet: "Ventas" });
            XLSX.writeFile(wb, filename + "_" + new Date().toISOString().slice(0, 10) + ".xlsx");
        }

        function exportTableToPDF(filename = 'reporte_ventas') {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Header
            doc.setFontSize(18);
            doc.text("Reporte de Ventas", 14, 22);
            doc.setFontSize(11);
            doc.text("Generado: " + new Date().toLocaleDateString() + " " + new Date().toLocaleTimeString(), 14, 30);

            // Table
            doc.autoTable({
                html: '#sales_table',
                startY: 35,
                theme: 'striped',
                headStyles: { fillColor: [66, 139, 202] }
            });

            doc.save(filename + "_" + new Date().toISOString().slice(0, 10) + ".pdf");
        }
    </script>
</body>

</html>