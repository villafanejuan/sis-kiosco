-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2025 a las 00:26:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kiosco_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Bebidas', 'Refrescos, jugos, agua'),
(2, 'Snacks', 'Chips, golosinas, chocolates'),
(3, 'Lácteos', 'Leche, yogur, quesos'),
(4, 'Panadería', 'Pan, facturas, medialunas'),
(5, 'nueva CAT', 'categoria de PRUEBA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `puntos` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `success` tinyint(1) DEFAULT 0,
  `attempted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `username`, `ip_address`, `user_agent`, `success`, `attempted_at`) VALUES
(1, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 00:01:12'),
(2, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 00:04:57'),
(3, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 00:05:02'),
(4, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 00:05:41'),
(5, 'admin2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 00:06:24'),
(6, 'admin2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 00:06:39'),
(7, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 00:06:57'),
(8, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 00:30:10'),
(9, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 00:49:37'),
(10, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 00:49:42'),
(11, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:03:09'),
(12, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:05:13'),
(13, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:06:13'),
(14, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:07:50'),
(15, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:12:25'),
(16, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:15:18'),
(17, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:18:18'),
(18, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:23:40'),
(19, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:25:31'),
(20, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:30:50'),
(21, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:32:13'),
(22, 'caja', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:32:58'),
(23, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:33:49'),
(24, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:37:18'),
(25, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:38:24'),
(26, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:49:22'),
(27, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 01:59:04'),
(28, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:04:21'),
(29, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:05:44'),
(30, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:07:24'),
(31, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 02:12:12'),
(32, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:12:17'),
(33, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:18:15'),
(34, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:19:46'),
(35, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:20:00'),
(36, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:24:58'),
(37, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:27:38'),
(38, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:28:52'),
(39, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-12 02:30:44'),
(40, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:30:49'),
(41, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:32:13'),
(42, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:32:39'),
(43, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:35:00'),
(44, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 02:36:14'),
(45, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 20:50:48'),
(46, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 20:53:50'),
(47, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 20:54:32'),
(48, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-12 23:56:43'),
(49, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 00:09:04'),
(50, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 00:12:07'),
(51, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 00:17:12'),
(52, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 01:11:19'),
(53, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 01:13:47'),
(54, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 02:57:34'),
(55, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 03:18:12'),
(56, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 03:22:27'),
(57, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:17:37'),
(58, 'naza', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:27:39'),
(59, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:45:25'),
(60, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-13 22:56:58'),
(61, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:57:02'),
(62, 'naza', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:57:26'),
(63, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:57:43'),
(64, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-13 22:57:59'),
(65, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:58:03'),
(66, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:58:11'),
(67, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:58:20'),
(68, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-13 22:58:36'),
(69, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:03:46'),
(70, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:16:41'),
(71, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:18:48'),
(72, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:20:28'),
(73, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-14 03:20:49'),
(74, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:20:55'),
(75, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:21:30'),
(76, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:21:57'),
(77, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:23:35'),
(78, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:25:37'),
(79, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:34:52'),
(80, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:35:40'),
(81, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:41:50'),
(82, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:48:04'),
(83, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:48:20'),
(84, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:51:21'),
(85, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:52:58'),
(86, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 03:59:30'),
(87, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 04:00:30'),
(88, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 04:00:58'),
(89, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 04:07:25'),
(90, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:00:48'),
(91, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:01:47'),
(92, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:02:01'),
(93, 'juanjo', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:08:42'),
(94, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:08:55'),
(95, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:09:19'),
(96, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:17:21'),
(97, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:17:57'),
(98, 'nuevouser', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:44:52'),
(99, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 0, '2025-12-14 22:45:01'),
(100, 'admin', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 1, '2025-12-14 22:45:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_caja`
--

CREATE TABLE `movimientos_caja` (
  `id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `tipo` enum('ingreso','egreso','venta','inicial') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimientos_caja`
--

INSERT INTO `movimientos_caja` (`id`, `turno_id`, `tipo`, `monto`, `descripcion`, `venta_id`, `fecha`, `usuario_id`, `created_at`) VALUES
(1, 1, 'inicial', 100000.00, 'Apertura de turno', NULL, '2025-12-11 22:20:14', 6, '2025-12-12 01:20:14'),
(2, 5, 'inicial', 10000.00, 'Apertura de turno', NULL, '0000-00-00 00:00:00', 9, '2025-12-12 02:23:07'),
(3, 5, 'venta', 600.00, 'Venta #10', 10, '0000-00-00 00:00:00', 9, '2025-12-12 02:23:44'),
(4, 6, 'inicial', 30000.00, 'Apertura de turno', NULL, '0000-00-00 00:00:00', 9, '2025-12-12 02:32:51'),
(5, 6, 'venta', 1110.00, 'Venta #11', 11, '0000-00-00 00:00:00', 9, '2025-12-12 02:33:24'),
(6, 6, 'ingreso', 10.00, 'proveedor', NULL, '0000-00-00 00:00:00', 9, '2025-12-12 02:34:11'),
(7, 6, 'egreso', 20.00, 'proveedores', NULL, '0000-00-00 00:00:00', 9, '2025-12-12 02:34:30'),
(12, 19, 'inicial', 11.00, 'Apertura de turno', NULL, '2025-12-12 21:07:12', 6, '2025-12-13 00:07:12'),
(13, 19, 'egreso', 10.00, 'porque si', NULL, '2025-12-12 21:08:43', 6, '2025-12-13 00:08:43'),
(14, 20, 'inicial', 1000.00, 'Apertura de turno', NULL, '2025-12-12 21:09:13', 9, '2025-12-13 00:09:13'),
(15, 20, 'venta', 1050.00, 'Venta #14', 14, '2025-12-12 21:11:45', 9, '2025-12-13 00:11:45'),
(16, 21, 'inicial', 100.00, 'Apertura de turno', NULL, '2025-12-12 21:14:14', 6, '2025-12-13 00:14:14'),
(17, 21, 'venta', 120.00, 'Venta #16', 16, '2025-12-12 21:14:28', 6, '2025-12-13 00:14:28'),
(18, 21, 'venta', 120.00, 'Venta #17', 17, '2025-12-12 21:14:46', 6, '2025-12-13 00:14:46'),
(19, 21, 'venta', 100.00, 'Venta #18', 18, '2025-12-12 21:14:55', 6, '2025-12-13 00:14:55'),
(20, 21, 'venta', 100.00, 'Venta #19', 19, '2025-12-12 21:16:15', 6, '2025-12-13 00:16:15'),
(21, 22, 'inicial', 5000.00, 'Apertura de turno', NULL, '2025-12-12 21:24:30', 6, '2025-12-13 00:24:30'),
(22, 23, 'inicial', 1000.00, 'Apertura de turno', NULL, '2025-12-12 22:09:57', 6, '2025-12-13 01:09:57'),
(23, 23, 'venta', 220.00, 'Venta #20', 20, '2025-12-12 22:10:09', 6, '2025-12-13 01:10:09'),
(24, 24, 'inicial', 40.00, 'Apertura de turno', NULL, '2025-12-12 22:26:08', 9, '2025-12-13 01:26:08'),
(25, 25, 'inicial', 100.00, 'Apertura de turno', NULL, '2025-12-13 00:18:48', 9, '2025-12-13 03:18:48'),
(26, 26, 'inicial', 100.00, 'Apertura de turno', NULL, '2025-12-13 19:21:45', 6, '2025-12-13 22:21:45'),
(27, 27, 'inicial', 1.00, 'Apertura de turno', NULL, '2025-12-13 19:34:11', 12, '2025-12-13 22:34:11'),
(28, 28, 'inicial', 100.00, 'Apertura de turno', NULL, '2025-12-14 19:17:27', 9, '2025-12-14 22:17:27'),
(29, 28, 'venta', 2000.00, 'Venta #21', 21, '2025-12-14 19:17:41', 9, '2025-12-14 22:17:41'),
(30, 29, 'inicial', 1.00, 'Apertura de turno', NULL, '2025-12-14 19:18:09', 6, '2025-12-14 22:18:09'),
(31, 29, 'venta', 120.00, 'Venta #22', 22, '2025-12-14 19:18:26', 6, '2025-12-14 22:18:26'),
(32, 30, 'inicial', 1.00, 'Apertura de turno', NULL, '2025-12-14 19:27:02', 6, '2025-12-14 22:27:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `codigo_barra` varchar(50) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `codigo_barra`, `categoria_id`, `imagen`, `created_at`, `deleted_at`) VALUES
(1, 'Coca Cola 500ml', 'Refresco de cola', 150.00, 0, '123456', 1, NULL, '2025-09-25 18:19:08', NULL),
(2, 'Papas Lays', 'Chips de papa', 100.00, 8, '111111', 2, NULL, '2025-09-25 18:19:08', NULL),
(3, 'Leche La Serenísima', 'Leche entera 1L', 120.00, 8, '123123', 3, NULL, '2025-09-25 18:19:08', NULL),
(4, 'Pan Lactal', 'Pan blanco 500g', 80.00, 0, NULL, 4, NULL, '2025-09-25 18:19:08', NULL),
(5, 'Coca Cola Ligth 500ml', 'Refresco de cola ligth :D', 300.00, -1, NULL, 1, NULL, '2025-09-26 19:10:51', '2025-12-14 04:10:48'),
(6, 'PRODUCTO', 'UN PRODUCTO', 2000.00, 13, '321321', 5, NULL, '2025-09-27 00:40:23', NULL),
(7, 'vaso de agua', 'un vaso de agua', 1205.00, 5, NULL, 1, NULL, '2025-12-12 01:48:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `nivel` int(11) NOT NULL COMMENT '1=Admin, 2=Kiosquero, 3=Cajero',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `nivel`, `created_at`) VALUES
(1, 'Admin', 'Acceso total al sistema', 1, '2025-12-12 00:05:13'),
(2, 'Kiosquero', 'Solo puede realizar ventas', 2, '2025-12-12 00:05:13'),
(3, 'Cajero', 'Solo puede gestionar caja', 3, '2025-12-12 00:05:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos_caja`
--

CREATE TABLE `turnos_caja` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 1,
  `usuario_nombre` varchar(100) DEFAULT 'Admin',
  `usuario_id` int(11) NOT NULL,
  `fecha_apertura` datetime NOT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `monto_final` decimal(10,2) DEFAULT NULL,
  `monto_esperado` decimal(10,2) DEFAULT NULL,
  `diferencia` decimal(10,2) DEFAULT NULL,
  `estado` enum('abierto','cerrado') DEFAULT 'abierto',
  `notas_apertura` text DEFAULT NULL,
  `notas_cierre` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `turnos_caja`
--

INSERT INTO `turnos_caja` (`id`, `user_id`, `usuario_nombre`, `usuario_id`, `fecha_apertura`, `fecha_cierre`, `monto_inicial`, `monto_final`, `monto_esperado`, `diferencia`, `estado`, `notas_apertura`, `notas_cierre`, `created_at`) VALUES
(1, 1, 'Admin', 6, '2025-12-11 22:20:14', NULL, 100000.00, NULL, NULL, NULL, 'abierto', 'nuevo turno', NULL, '2025-12-12 01:20:14'),
(5, 9, 'juanjo villafañe', 9, '2025-12-11 23:23:07', '2025-12-11 23:31:43', 10000.00, 9000.00, 10600.00, -1600.00, 'cerrado', 'sadas', 'nuevo cierre', '2025-12-12 02:23:07'),
(6, 9, 'juanjo villafañe', 9, '2025-12-11 23:32:51', '2025-12-11 23:34:51', 30000.00, 31000.00, 31100.00, -100.00, 'cerrado', 'ddd', 'cierre hoy', '2025-12-12 02:32:51'),
(19, 6, 'admin', 6, '2025-12-12 21:07:12', '2025-12-12 21:08:49', 11.00, 2.00, 1.00, 1.00, 'cerrado', 'ddd', 'sdsd', '2025-12-13 00:07:12'),
(20, 9, 'juanjo villafañe', 9, '2025-12-12 21:09:13', '2025-12-12 21:11:58', 1000.00, 2000.00, 2050.00, -50.00, 'cerrado', 'dsd', '', '2025-12-13 00:09:13'),
(21, 6, 'admin', 6, '2025-12-12 21:14:14', '2025-12-12 21:16:46', 100.00, 5400.00, 540.00, 4860.00, 'cerrado', 'da', 'xD', '2025-12-13 00:14:14'),
(22, 6, 'admin', 6, '2025-12-12 21:24:30', '2025-12-12 21:48:36', 5000.00, 5000.00, 5000.00, 0.00, 'cerrado', 'khjkh', '', '2025-12-13 00:24:30'),
(23, 6, 'admin', 6, '2025-12-12 22:09:57', '2025-12-12 22:11:00', 1000.00, 1220.00, 1220.00, 0.00, 'cerrado', 'nueva caja', 'cierre caja', '2025-12-13 01:09:57'),
(24, 9, 'juanjo villafañe', 9, '2025-12-12 22:26:08', '2025-12-13 00:18:24', 40.00, 40.00, 40.00, 0.00, 'cerrado', '', '', '2025-12-13 01:26:08'),
(25, 9, 'juanjo villafañe', 9, '2025-12-13 00:18:47', '2025-12-14 00:21:14', 100.00, 100.00, 100.00, 0.00, 'cerrado', '', '', '2025-12-13 03:18:47'),
(26, 6, 'admin', 6, '2025-12-13 19:21:45', '2025-12-14 00:43:10', 100.00, 100.00, 100.00, 0.00, 'cerrado', '', '', '2025-12-13 22:21:45'),
(27, 12, 'nazareno fabian madero', 12, '2025-12-13 19:34:11', NULL, 1.00, NULL, NULL, NULL, 'abierto', '', NULL, '2025-12-13 22:34:11'),
(28, 9, 'juanjo villafañe', 9, '2025-12-14 19:17:26', '2025-12-14 19:17:52', 100.00, 2100.00, 2100.00, 0.00, 'cerrado', '', '', '2025-12-14 22:17:26'),
(29, 6, 'admin', 6, '2025-12-14 19:18:09', '2025-12-14 19:18:35', 1.00, 121.00, 121.00, 0.00, 'cerrado', '', '', '2025-12-14 22:18:09'),
(30, 6, 'admin', 6, '2025-12-14 19:27:02', '2025-12-14 20:07:48', 1.00, 1.00, 1.00, 0.00, 'cerrado', '', '', '2025-12-14 22:27:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','empleado') DEFAULT 'empleado',
  `role_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT 0,
  `locked_until` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `role`, `role_id`, `nombre`, `email`, `telefono`, `is_active`, `last_login`, `failed_attempts`, `locked_until`, `created_at`, `updated_at`) VALUES
(6, 'admin', '$argon2id$v=19$m=65536,t=4,p=3$aml2Mkt1d3liN2tnYzAvZQ$nxgcvF0kylnnWV+I7GqpBcK6kz86rM+UuR/BDJDlgdA', 'admin', 1, NULL, NULL, NULL, 1, '2025-12-14 22:45:06', 0, NULL, '2025-09-26 19:38:53', '2025-12-14 22:45:06'),
(9, 'nuevouser', '$argon2id$v=19$m=65536,t=4,p=3$TjhpZU9HeFlrQ1U2L1o0QQ$wG8onKCIVVWQs8lZ89MX2eCQTyPSzsvWc1KqYAsPpZE', 'empleado', 2, 'juanjo villafañe', 'jjj@gmail.com', NULL, 1, '2025-12-14 22:44:52', 0, NULL, '2025-12-12 01:23:31', '2025-12-14 22:44:52'),
(12, 'naza', '$argon2id$v=19$m=65536,t=4,p=3$bWVlMjdrbG9ZcDJwR1IxWQ$fSgCyWeftsp2jCwDhSdyjxOjGOnVVUy/BUBvZUxfOTA', 'empleado', 2, 'nazareno fabian madero', 'ebarile129@gmail.com', NULL, 1, '2025-12-13 22:57:26', 0, NULL, '2025-12-13 22:27:29', '2025-12-13 22:57:26'),
(13, 'juanjo', '$argon2id$v=19$m=65536,t=4,p=3$UW94cGV2MWFpUVdNaUJaTw$wJfBdTjRDLSdE2m4NkQfD1H10QwoIP3wvLOiIUPa7LE', 'empleado', 3, 'juanjo', 'juanjo@gmail.com', NULL, 1, '2025-12-14 22:08:42', 0, NULL, '2025-12-14 03:11:57', '2025-12-14 22:08:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `monto_pagado` decimal(10,2) DEFAULT 0.00,
  `cambio` decimal(10,2) DEFAULT 0.00,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `usuario_id`, `cliente_id`, `total`, `monto_pagado`, `cambio`, `fecha`) VALUES
(9, 9, NULL, 3300.00, 3500.00, 200.00, '2025-12-12 02:21:32'),
(10, 9, NULL, 600.00, 10000.00, 9400.00, '2025-12-12 02:23:44'),
(11, 9, NULL, 1110.00, 2000.00, 890.00, '2025-12-12 02:33:23'),
(12, 6, NULL, 250.00, 10000.00, 9750.00, '2025-12-12 20:52:02'),
(13, 9, NULL, 1050.00, 2000.00, 950.00, '2025-12-13 00:09:50'),
(14, 9, NULL, 1050.00, 2000.00, 950.00, '2025-12-13 00:11:44'),
(15, 6, NULL, 2000.00, 2000.00, 0.00, '2025-12-13 00:12:26'),
(16, 6, NULL, 120.00, 150.00, 30.00, '2025-12-13 00:14:28'),
(17, 6, NULL, 120.00, 150.00, 30.00, '2025-12-13 00:14:46'),
(18, 6, NULL, 100.00, 200.00, 100.00, '2025-12-13 00:14:55'),
(19, 6, NULL, 100.00, 130.00, 30.00, '2025-12-13 00:16:15'),
(20, 6, NULL, 220.00, 2000.00, 1780.00, '2025-12-13 01:10:09'),
(21, 9, NULL, 2000.00, 2000.00, 0.00, '2025-12-14 22:17:41'),
(22, 6, NULL, 120.00, 120.00, 0.00, '2025-12-14 22:18:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalles`
--

CREATE TABLE `venta_detalles` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta_detalles`
--

INSERT INTO `venta_detalles` (`id`, `venta_id`, `producto_id`, `cantidad`, `precio`, `subtotal`) VALUES
(1, 1, 1, 10, 150.00, 1500.00),
(2, 2, 1, 10, 150.00, 1500.00),
(3, 3, 5, 10, 300.00, 3000.00),
(4, 4, 5, 10, 300.00, 3000.00),
(5, 5, 5, 8, 300.00, 2400.00),
(6, 6, 5, 3, 300.00, 900.00),
(7, 7, 4, 10, 80.00, 800.00),
(8, 8, 4, 5, 80.00, 400.00),
(9, 9, 1, 22, 150.00, 3300.00),
(10, 10, 1, 4, 150.00, 600.00),
(11, 11, 3, 8, 120.00, 960.00),
(12, 11, 1, 1, 150.00, 150.00),
(13, 12, 1, 1, 150.00, 150.00),
(14, 12, 2, 1, 100.00, 100.00),
(15, 13, 1, 1, 150.00, 150.00),
(16, 13, 2, 9, 100.00, 900.00),
(17, 14, 1, 1, 150.00, 150.00),
(18, 14, 2, 9, 100.00, 900.00),
(19, 15, 6, 1, 2000.00, 2000.00),
(20, 16, 3, 1, 120.00, 120.00),
(21, 17, 3, 1, 120.00, 120.00),
(22, 18, 2, 1, 100.00, 100.00),
(23, 19, 2, 1, 100.00, 100.00),
(24, 20, 2, 1, 100.00, 100.00),
(25, 20, 3, 1, 120.00, 120.00),
(26, 21, 6, 1, 2000.00, 2000.00),
(27, 22, 3, 1, 120.00, 120.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_username_time` (`username`,`attempted_at`),
  ADD KEY `idx_ip_time` (`ip_address`,`attempted_at`);

--
-- Indices de la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_turno` (`turno_id`),
  ADD KEY `idx_tipo` (`tipo`),
  ADD KEY `idx_fecha` (`fecha`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_codigo_barra` (`codigo_barra`),
  ADD KEY `idx_categoria` (`categoria_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `turnos_caja`
--
ALTER TABLE `turnos_caja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_estado` (`estado`),
  ADD KEY `idx_fecha_apertura` (`fecha_apertura`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `idx_fecha` (`fecha`);

--
-- Indices de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `turnos_caja`
--
ALTER TABLE `turnos_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos_caja`
--
ALTER TABLE `movimientos_caja`
  ADD CONSTRAINT `movimientos_caja_ibfk_1` FOREIGN KEY (`turno_id`) REFERENCES `turnos_caja` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movimientos_caja_ibfk_2` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `movimientos_caja_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `turnos_caja`
--
ALTER TABLE `turnos_caja`
  ADD CONSTRAINT `turnos_caja_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `venta_detalles`
--
ALTER TABLE `venta_detalles`
  ADD CONSTRAINT `venta_detalles_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
