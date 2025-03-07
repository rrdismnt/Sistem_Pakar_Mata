-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2024 at 11:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pakarmata`
--

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `gejala` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `gejala`) VALUES
(1, 'Pandangan kabur sepereti berkabut'),
(2, 'Pandangan ganda'),
(3, 'Warna di sekitar memudar'),
(4, 'Melihat kilatan cahaya (Fotopsis)'),
(5, 'Terdapat bintik hitam yang selalu bergerak/melayang'),
(6, 'Lapangan pandang yang menyempit'),
(7, 'Pandangan yang samar atau tidak fokus'),
(8, 'Kesulitan membedakan warna-warna yang bersebelahan'),
(9, 'Sensitif terhadap sorotan cahaya'),
(10, 'Melihat bayangan lingkarang di sekeliling cahaya'),
(11, 'Mata memerah'),
(12, ' Penglihatan yang semakin menyempit hingga akhirnya tidak dapat melihat objek sama sekali'),
(13, 'Gangguan penglihatan'),
(14, 'Pembesaran kornea'),
(15, 'Kemerahan pada konjungtiva mata'),
(16, 'Mata sering terasa gatal dan seperti ada debu'),
(17, 'Mata mengeluarkan cairan kental yang membentuk kerak pda malam hari'),
(18, 'Mata dapat mengeluarkan cairan kental yang membentuk kerak pda malm hari, sehingga menyulitkan kamu'),
(19, 'Terkadang mata mengeluarkan air'),
(20, 'Iritasi dan perih pada mata'),
(21, 'Pertumbuhan selaput berwarna putih pada sudut mata bagian dalam atau luar'),
(22, 'Kelopak mata terasa gatal'),
(23, 'Kelopak mata menjadi lengket'),
(24, 'Tepi kelopak mata terlihat bengkak'),
(25, 'Mata yang terlalu berair'),
(26, 'Munculnya nanah yang keluar dari sudut mata'),
(27, 'Pembengkakan pada saluran air mata dikelopak bagian bawah');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `penyakit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `penyakit`) VALUES
(1, 'Katarak'),
(2, 'Ablasio'),
(3, 'Astigmatisme'),
(4, 'Glaukoma'),
(5, 'Bufthalmus'),
(6, 'Konjungtivitis'),
(7, 'Pterygium'),
(8, 'Blefaritis'),
(9, 'Dakriosistitis');

-- --------------------------------------------------------

--
-- Table structure for table `relasi`
--

CREATE TABLE `relasi` (
  `id_relasi` int(11) NOT NULL,
  `id_gejala` int(11) DEFAULT NULL,
  `id_penyakit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `relasi`
--

INSERT INTO `relasi` (`id_relasi`, `id_gejala`, `id_penyakit`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 10, 4),
(11, 11, 4),
(12, 12, 4),
(13, 13, 5),
(14, 14, 5),
(15, 15, 5),
(16, 16, 6),
(17, 17, 6),
(18, 18, 6),
(19, 19, 7),
(20, 20, 7),
(21, 21, 7),
(22, 22, 8),
(23, 23, 8),
(24, 24, 8),
(25, 25, 9),
(26, 26, 9),
(27, 27, 9);

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE `solusi` (
  `id_solusi` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `solusi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`id_solusi`, `id_penyakit`, `solusi`) VALUES
(1, 1, 'Melakukan operasi pengangkatan katarak'),
(2, 2, 'Melakukan operasi laser (cryotherapy)'),
(3, 3, 'Memakai kacamata atau lensa kontak, operasi refraktif'),
(4, 4, 'Mengkonsumsi obat-obatan, melakukan operasi atau terapi laser'),
(5, 5, 'Melakukan operasi filterasi, atau penggunaan obat'),
(6, 6, 'Menggunakan obat tetes mata, mengkompres dingin mata, dan menjagakebersihan sekitar mata'),
(7, 7, 'Menggunakan obat tetes mata, atau melakukan operasi jika mengganggu penglihatan'),
(8, 8, 'menjaga kebersihan di sekitar kelopak mata, atau mengkompres hangat mata'),
(9, 9, 'mengkonsumsi obat-obatan Antibiotik, atau melakukan operasi jika diperlukan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `role`, `nama`, `email`, `alamat`, `tgl_lahir`, `password`) VALUES
(2, 0, 'admin', 'admin@gmail.com', 'Tabanan', '2020-04-17', '$2y$10$ASS50col3niwOOku4Zkky.HpmF18hiPWL9pi2DnE8CS7jTDSD4ufe'),
(4, 2, 'Dokter isma', 'budi@gmail.com', 'Badung', '2020-04-09', '$2y$10$n2nS/Rg7Zvjdv.q1mrv7TOJYrzf18LVQQzsWuDWqPf5Ieos/OIWiG'),
(6, 2, 'Dokter yani', 'jaya@gmail.com', 'Denpasar', '2020-05-12', '$2y$10$Hb0Q.SpDMZ1m34GlQSnB4.GkKM9wBRwWsrHUIFwn4sV6M7JGNPIV.'),
(10, 1, 'test', 'test@gmail.com', 'asjadja', '2020-06-15', '$2y$10$KIVNLDg1RABhFvjKmfwR4eDUb90lCthb5/ZgNW8GNFvhL3L5ju0qO'),
(11, 1, 'Rudi Ismanto', 'ismacomunity@gmail.com', 'serang', '2012-03-17', '$2y$10$WJW3jR6MAGgZP2.mnkenS.VhLsykYOxlS4PGkHOJWnxYlofqRvDMO'),
(12, 1, 'Rudi Ismanto ', 'ismacomunity@gmail.com', 'serang', '2023-03-14', '$2y$10$PHqhtE2vNIKXuDYrHLgMReSe8DEcXdGDanqZtdmQlZIyAKYXrPm7q'),
(13, 1, 'Hariyani', 'hariyani@gmail.com', 'cilegon', '2024-06-06', '$2y$10$hL2c33PZTbEWcWmDuIhvxe18raaYxfdnS6Oy3qyhTqRIK31dbFSfa'),
(14, 1, 'hariyani', 'hariyani@gmail.com', 'serang', '2024-06-04', '$2y$10$luDeT2BSARXC1MGVKTS.6.8EzjsYDET.k/r4/JOMuyzFnUIBuEw/.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id_relasi`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`id_solusi`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `solusi`
--
ALTER TABLE `solusi`
  MODIFY `id_solusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi`
--
ALTER TABLE `relasi`
  ADD CONSTRAINT `relasi_ibfk_1` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id_gejala`),
  ADD CONSTRAINT `relasi_ibfk_2` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);

--
-- Constraints for table `solusi`
--
ALTER TABLE `solusi`
  ADD CONSTRAINT `solusi_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
