# Sistema de Kiosco Profesional v2.0

Sistema completo de gestión para kioscos con arquitectura MVC, control de caja, gestión de stock, ventas, reportes y auditoría completa.

## 🚀 Características Principales

### ✅ Sistema de Roles y Permisos
- **Administrador**: Control total del sistema
- **Kiosquero**: Ventas, caja, reportes básicos
- **Cajero**: Solo ventas

### 💰 Módulo de Caja Profesional
- Apertura/cierre de turnos
- Arqueo automático con cálculo de diferencias
- Movimientos manuales (ingresos/egresos)
- Historial completo de turnos

### 📦 Gestión de Stock Avanzada
- Alertas de stock bajo configurables
- Historial de movimientos
- Gestión de proveedores
- Registro de mermas
- Control de costos y márgenes

### 🛒 Ventas Optimizadas
- Interfaz rápida para punto de venta
- Búsqueda por código de barras
- Ventas en espera
- Generación automática de tickets
- Cancelación con devolución de stock

### 📊 Reportes Completos
- Ventas por día/hora/empleado
- Productos más vendidos
- Stock crítico
- Flujo de caja
- Ganancias y márgenes

### 🔒 Seguridad Avanzada
- Protección CSRF
- Protección contra fuerza bruta
- Encriptación de datos sensibles
- Auditoría completa de acciones
- Sesiones seguras

## 📋 Requisitos

- PHP 7.4 o superior
- MySQL 5.7 o superior
- Apache con mod_rewrite
- Extensiones PHP: PDO, OpenSSL, JSON

## 🔧 Instalación

### 1. Clonar/Copiar archivos
```bash
# Copiar todos los archivos a tu directorio de XAMPP
# Ejemplo: C:\xampp\htdocs\sis-kiosco\
```

### 2. Configurar base de datos

#### Opción A: Ejecutar script de migración (Recomendado)
```bash
php database/migrations/migrate.php
```

#### Opción B: Importar manualmente
1. Abrir phpMyAdmin
2. Crear base de datos `kiosco_db`
3. Importar `db.sql`
4. Importar `database/migrations/002_upgrade_to_professional.sql`

### 3. Configurar variables de entorno

Copiar `.env.example` a `.env` y configurar:

```env
ENVIRONMENT=development

DB_HOST=localhost
DB_NAME=kiosco_db
DB_USER=root
DB_PASS=

APP_NAME="Sistema Kiosco Profesional"
APP_URL=http://localhost/sis-kiosco/public
```

### 4. Configurar permisos (Linux/Mac)
```bash
chmod -R 755 storage/
chmod -R 755 database/backups/
chmod -R 755 public/uploads/
```

### 5. Acceder al sistema
```
URL: http://localhost/sis-kiosco/public/
Usuario: admin
Contraseña: password
```

## 📁 Estructura del Proyecto

```
sis-kiosco/
├── app/
│   ├── Core/              # Clases core (Database, Security, Logger, etc.)
│   ├── Models/            # Modelos de datos
│   ├── Controllers/       # Controladores
│   └── bootstrap.php      # Inicialización
├── config/
│   └── app.php           # Configuración principal
├── database/
│   ├── migrations/       # Scripts de migración
│   └── backups/          # Backups automáticos
├── public/               # Punto de entrada público
│   ├── index.php        # Login
│   ├── dashboard.php    # Dashboard
│   ├── sales.php        # Ventas
│   ├── cash.php         # Caja
│   ├── products.php     # Productos
│   └── reports.php      # Reportes
├── storage/
│   ├── logs/            # Logs del sistema
│   └── cache/           # Caché
├── .env                 # Variables de entorno
└── README.md
```

## 🎯 Uso Rápido

### Abrir Turno de Caja
1. Ir a **Caja** → **Abrir Turno**
2. Ingresar monto inicial
3. Confirmar apertura

### Realizar una Venta
1. Ir a **Ventas** → **Nueva Venta**
2. Buscar productos
3. Agregar al carrito
4. Completar venta
5. Ingresar monto recibido

### Cerrar Turno
1. Ir a **Caja** → **Cerrar Turno**
2. Contar efectivo en caja
3. Completar arqueo
4. Confirmar cierre

## 🔐 Seguridad

### Cambiar Contraseña de Admin
1. Iniciar sesión como admin
2. Ir a **Perfil**
3. Cambiar contraseña
4. Guardar cambios

### Crear Nuevos Usuarios
1. Ir a **Usuarios** → **Agregar Usuario**
2. Completar formulario
3. Seleccionar rol
4. Guardar

## 📊 Reportes Disponibles

- **Ventas por Día**: Resumen diario de ventas
- **Ventas por Empleado**: Performance individual
- **Productos Más Vendidos**: Top productos
- **Stock Crítico**: Productos con stock bajo
- **Flujo de Caja**: Movimientos de caja
- **Ganancias**: Análisis de márgenes
- **Exportación**: Descarga de detalle de ventas en Excel y PDF

### Exportar Reportes
Desde la sección de Reportes, puedes descargar el detalle completo de ventas:
1. Ir a **Reportes**
2. Desplazarse hacia abajo hasta "Detalle de Ventas"
3. (Opcional) Filtrar por **Usuario** (Admin/Cajero) o por **Período** (Hoy, Semana, Mes, etc.)
4. Click en **Exportar Excel** o **Exportar PDF**
   - El archivo descargado incluirá una fila al final con el **Total General**.

## 🛠️ Mantenimiento

### Backups Automáticos
Los backups se generan automáticamente cada día a las 2 AM (configurar cron).

### Backups Manuales
1. Ir a **Sistema** → **Backups**
2. Click en **Crear Backup**
3. Descargar archivo generado

### Limpieza de Logs
Los logs se limpian automáticamente después de 30 días.

## 🐛 Solución de Problemas

### Error de Conexión a BD
- Verificar credenciales en `.env`
- Verificar que MySQL esté corriendo
- Verificar que la base de datos exista

### Error 404 en URLs
- Verificar que mod_rewrite esté habilitado
- Verificar archivo `.htaccess` en public/

### Sesión Expirada
- Verificar configuración de sesión en php.ini
- Aumentar `session.gc_maxlifetime`

## 📝 Logs

Los logs se guardan en `storage/logs/`:
- `app_YYYY-MM-DD.log`: Log general
- `error_YYYY-MM-DD.log`: Errores
- `info_YYYY-MM-DD.log`: Información
- `warning_YYYY-MM-DD.log`: Advertencias

## 🔄 Actualización

Para actualizar el sistema:
1. Hacer backup completo
2. Copiar nuevos archivos
3. Ejecutar migraciones nuevas
4. Limpiar caché

## 📞 Soporte

Para soporte técnico:
- Revisar logs en `storage/logs/`
- Verificar documentación en `implementation_plan.md`
- Consultar especificaciones técnicas en `especificaciones_tecnicas.md`

## 📜 Licencia

Sistema propietario para uso interno.

## 🎉 Características Futuras

- [ ] Integración con facturación electrónica
- [ ] App móvil para consultas
- [ ] Reportes con gráficos interactivos
- [ ] Exportación a Excel/PDF
- [ ] Sistema de promociones
- [ ] Programa de fidelización de clientes
- [ ] Multi-tienda
- [ ] API REST

---

**Versión**: 2.0 Professional  
**Última actualización**: Diciembre 2025
