-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk toko_nodejs
CREATE DATABASE IF NOT EXISTS `toko_nodejs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `toko_nodejs`;

-- membuang struktur untuk table toko_nodejs.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel toko_nodejs.products: ~10 rows (lebih kurang)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `price`) VALUES
	(1, 'Kopi Hitam', 15000.00),
	(2, 'Teh Manis', 5000.00),
	(3, 'Roti Bakar', 12000.00),
	(4, 'Nasi Goreng', 20000.00),
	(5, 'Mie Instan', 10000.00),
	(6, 'Ayam Goreng', 25000.00),
	(7, 'Es Jeruk', 7000.00),
	(8, 'Kentang Goreng', 15000.00),
	(9, 'Salad Buah', 18000.00),
	(10, 'Air Mineral', 4000.00);

-- membuang struktur untuk table toko_nodejs.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `status` enum('success','canceled') DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel toko_nodejs.purchases: ~1 rows (lebih kurang)
DELETE FROM `purchases`;
INSERT INTO `purchases` (`id`, `product_id`, `qty`, `status`, `created_at`) VALUES
	(1, 2, 2, 'canceled', '2026-01-05 09:14:26'),
	(2, 1, 1, 'canceled', '2026-01-05 11:53:14'),
	(3, 4, 1, 'success', '2026-01-05 12:00:32'),
	(4, 3, 1, 'success', '2026-01-05 12:00:39'),
	(5, 5, 1, 'success', '2026-01-05 12:00:46'),
	(6, 5, 1, 'success', '2026-01-05 12:00:52'),
	(7, 6, 1, 'success', '2026-01-05 12:00:59'),
	(8, 7, 1, 'success', '2026-01-05 12:01:08'),
	(9, 8, 2, 'success', '2026-01-05 12:01:19'),
	(10, 9, 2, 'success', '2026-01-05 12:01:24'),
	(11, 10, 2, 'success', '2026-01-05 12:01:28');

-- membuang struktur untuk table toko_nodejs.stocks
CREATE TABLE IF NOT EXISTS `stocks` (
  `product_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  KEY `product_id` (`product_id`),
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel toko_nodejs.stocks: ~10 rows (lebih kurang)
DELETE FROM `stocks`;
INSERT INTO `stocks` (`product_id`, `qty`) VALUES
	(1, 50),
	(2, 50),
	(3, 49),
	(4, 49),
	(5, 48),
	(6, 49),
	(7, 49),
	(8, 48),
	(9, 48),
	(10, 48);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
