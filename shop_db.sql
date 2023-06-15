-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jan 2023 pada 16.45
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `price`, `quantity`, `image`) VALUES
(67, 4, 'Demon Slayer (Jap Ver) Vol. 23', 130000, 1, 'Demon Slayer (Jap Ver) Vol 23.jpg'),
(76, 10, 'Demon Slayer (Jap Ver) Vol. 23', 130000, 1, 'Demon Slayer (Jap Ver) Vol 23.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(18, 8, 'stanley', '0812', 'stanleysen2902@gmail.com', 'credit card', 'Jl.jl caringin, jawa barat, indonesia, kota bandung, babakan ciparay - 40223', ', Demon Slayer (Jap Ver) Vol. 23 (1) ', 130000, '20-Jan-2023', 'Selesai'),
(19, 10, 'bryan', '08123', 'bryan@gmail.com', 'credit card', 'Jl.jl sudirman , jawa barat, indonesia, bandung, babakan ciparay - 4002', ', Demon Slayer (Jap Ver) Vol. 23 (1) , Horimiya Vol. 16 (1) ', 205000, '20-Jan-2023', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`) VALUES
(4, 'Demon Slayer (Jap Ver) Vol. 23', 130000, 'Demon Slayer (Jap Ver) Vol 23.jpg'),
(5, 'Horimiya Vol. 16', 75000, 'Horimiya Vol 16.jpg'),
(6, 'Naruto 4 Hokage (Jap Ver)', 125000, 'Naruto 4 Hokage (Jap Ver).jpg'),
(7, 'The Promised Neverland Vol. 16', 60000, 'The Promised Neverland Vol 16.jpg'),
(8, 'Database Design - All In One', 600000, 'Database Design - All In One.jpg'),
(9, 'Fundamentals of Database Systems', 700000, 'Fundamentals of Database Systems.jpg'),
(10, 'Kapitalisme : The Satanic Ideology', 120000, 'cover-buku-kapitalisme.jpg'),
(11, 'History of Modern Architecture', 200000, 'history_of_modern_architecture.jpg'),
(12, 'Perspektif Pendidikan Dalam Bingkai Ilmu dan Tokoh', 99000, 'Buku-Perspektif-Pendidikan-dalam-Bingkai_Kurniawan-Convert-depan.jpg'),
(13, 'Principles of Database Management', 450000, 'images.jpg'),
(14, 'Buku Pintar Pramuka', 55000, '[08-11-2019]buku_pintar_pramuka.jpg'),
(15, 'MockingJay', 115000, 'Mockingjay.jfif'),
(16, 'The Death Cure', 200000, 'The_Death_Cure.jpg'),
(17, 'The Chronicles of Narnia', 89000, 'The Chronicles of Narnia_The Lion, The Witch and The Wardrobe.jpg'),
(18, 'Calm', 98000, '9780241309018.jpg'),
(19, 'Cara Ampuh Menjadi Pribadi Yang Angguh', 220000, 'cara-ampuh-menjadi-pribadi-yang-tangguh-jatuh-itu-perlu-awalnya-sakit-kemud-243.jpg'),
(20, 'Sebuah Seni Untuk Bersikap Bodo Amat', 100000, 'cb6f57972a3407ce68d43573e736b653.jpeg.jpg'),
(21, 'Sepi ', 50000, 'elex_media_komputindo_buku_sepi_full01_khy7phe3.jpg'),
(22, 'Obat Obat Penting', 55000, '119339_f.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(8, 'user', 'user@gmail.com', 'ee11cbb19052e40b07aac0ca060c23ee', 'user'),
(9, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(10, 'kevin', 'kevin@gmail.com', 'd2e7a2105d0fb461fe6f2858cc33942f', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
