-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2024 at 07:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_brg` varchar(64) NOT NULL,
  `nama_brg` varchar(64) NOT NULL,
  `jenis_brg` varchar(64) NOT NULL,
  `kategori` varchar(64) NOT NULL,
  `satuan` varchar(64) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_brg`, `nama_brg`, `jenis_brg`, `kategori`, `satuan`, `stock`) VALUES
('30120001', 'PC', 'LG', 'Tidak Bisa Dipinjam', 'Unit', 10),
('3050204004', 'AC', 'Panasonic', 'Tidak Bisa Dipinjam', 'Unit', 50),
('3100203001', 'CPU', 'Acer', 'Tidak Bisa Dipinjam', 'Unit', 50),
('3100203002', 'PC Unit', 'Acer', 'Tidak Bisa Dipinjam', 'Unit', 45),
('3100203004', 'Mouse', 'Fantech', 'Bisa Dipinjam', 'Unit', 50),
('3100203005', 'Keyboard', 'Fantech', 'Bisa Dipinjam', 'Unit', 51),
('3100203007', 'DELL', 'Laptop', 'Bisa Dipinjam', 'Unit', 10);

-- --------------------------------------------------------

--
-- Table structure for table `brg_masuk`
--

CREATE TABLE `brg_masuk` (
  `id` int(11) NOT NULL,
  `kode_brg` varchar(15) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `qty` int(11) NOT NULL,
  `penerima` varchar(70) NOT NULL,
  `id_ruangan` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brg_masuk`
--

INSERT INTO `brg_masuk` (`id`, `kode_brg`, `tgl_masuk`, `qty`, `penerima`, `id_ruangan`) VALUES
(35, '3100203001', '2024-01-12', 5, 'Ronal Hadi', 'Gudang'),
(36, '3100203007', '2024-01-12', 10, 'Roni Putra', 'Gudang'),
(37, '30120001', '2024-01-12', 5, 'Admin', 'Gudang');

-- --------------------------------------------------------

--
-- Table structure for table `brg_mutasi`
--

CREATE TABLE `brg_mutasi` (
  `id_mutasi` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `ruangan` varchar(64) NOT NULL,
  `kode_brg` varchar(64) NOT NULL,
  `tgl_mutasi` date NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brg_mutasi`
--

INSERT INTO `brg_mutasi` (`id_mutasi`, `id_ruangan`, `ruangan`, `kode_brg`, `tgl_mutasi`, `qty`) VALUES
(76, 304, 'Gudang', '3100203002', '2024-01-12', 5),
(77, 304, 'Gudang', '3100203001', '2024-01-10', 5),
(79, 304, 'Gudang', '3100203007', '2024-01-12', 5),
(80, 307, 'Gudang', '30120001', '2024-01-12', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `kode_brg` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_dikembalikan` date DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`id`, `nama`, `kode_brg`, `username`, `tgl_peminjaman`, `tgl_kembali`, `tgl_dikembalikan`, `status`, `qty`) VALUES
(69, 'Altaf Hafizun', '3100203005', '2201091021', '2024-01-11', '2024-01-12', '2024-01-12', 'Dikembalikan', 1),
(70, 'Altaf Hafizun', '3100203004', '2201091021', '2024-01-12', '2024-01-13', '2024-01-12', 'Dikembalikan', 1),
(71, 'Altaf Hafizun', '3100203007', '2201091021', '2024-01-12', '2024-01-13', '2024-01-12', 'Dikembalikan', 1),
(72, 'Marchella Putri Yofelino', '3100203005', '2201092017', '2024-01-12', '2024-01-13', '2024-01-12', 'Dikembalikan', 1),
(73, 'Marchella Putri Yofelino', '3100203004', '2201092017', '2024-01-12', '2024-01-13', '2024-01-12', 'Dikembalikan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `nama_ruangan` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `nama_ruangan`) VALUES
(301, 'Lab Pemrograman 1'),
(304, 'Lab Sistem Jaringan'),
(306, 'Lab Multimedia'),
(307, 'Lab Sistem Informasi'),
(308, 'Lab Pemograman');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(64) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `nama`, `password`, `level`) VALUES
('admin', 'Administrator', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
('2201091021', 'Altaf Hafizun', '202cb962ac59075b964b07152d234b70', 'mahasiswa'),
('2201092058', 'Dafa Febrian Muktar', '202cb962ac59075b964b07152d234b70', 'mahasiswa'),
('2201092017', 'Marchella Putri Yofelino', '202cb962ac59075b964b07152d234b70', 'mahasiswa'),
('pimpinan', 'Pimpinan', '90973652b88fe07d05a4304f0a945de8', 'pimpinan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indexes for table `brg_masuk`
--
ALTER TABLE `brg_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_brg` (`kode_brg`);

--
-- Indexes for table `brg_mutasi`
--
ALTER TABLE `brg_mutasi`
  ADD PRIMARY KEY (`id_mutasi`),
  ADD KEY `id_ruangan` (`id_ruangan`),
  ADD KEY `kode_brg` (`kode_brg`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama` (`nama`),
  ADD KEY `kode_brg` (`kode_brg`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`nama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brg_masuk`
--
ALTER TABLE `brg_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `brg_mutasi`
--
ALTER TABLE `brg_mutasi`
  MODIFY `id_mutasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brg_masuk`
--
ALTER TABLE `brg_masuk`
  ADD CONSTRAINT `brg_masuk_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `brg_mutasi`
--
ALTER TABLE `brg_mutasi`
  ADD CONSTRAINT `brg_mutasi_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brg_mutasi_ibfk_2` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`nama`) REFERENCES `user` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinjaman_ibfk_2` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
