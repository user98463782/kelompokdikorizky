-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 05:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dicko`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `alamatmahasiswa` (`alamatmhs` VARCHAR(100))   begin
select*from mahasiswa where alamat=alamatmhs;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `alamatmahasiswa1` (`alamatmhs` VARCHAR(100))   begin
select*from mahasiswa where alamat=alamatmhs;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `alamatmahasiswa11` (`alamatmhs` VARCHAR(100))   begin
select * from mahasiswa11 where alamat=alamatmhs; 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `idmahasisw` (`idmhs` INT(11))   begin
select * from nilai_mm where id_nilai_mm=idmhs;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertmahasisw` (`id_nilai_mm` CHAR(2), `nrp` VARCHAR(15), `nilai` INT(11))   begin
insert into nilai_mm values (id_nilai_mm, nrp, nilai);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertmahasiswa` (`nimmhs` INT(10), `namamhs` VARCHAR(50), `alamatmhs` VARCHAR(50))   begin
insert into mahasiswa values (nimmhs, namamhs, alamatmhs);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertmahasiswa11` (`nimmhs` INT(10), `namamhs` VARCHAR(50), `alamatmhs` VARCHAR(50))   begin
insert into mahasiswa11 values (nimmhs, namamhs, alamatmhs);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test` (`nilai` INT)   begin
declare skor char (50);
case
when nilai > 100 or nilai < 0 then
set skor = "nilai salah";
when nilai >= 90 then
set skor = "skor = A"; 
when nilai >= 70 then
set skor = "skor : B";
else
set skor ="skor : E";
end case;
select skor;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dosen1` () RETURNS INT(11)  begin
declare kodedosen int;
select count(*) into kodedosen from dosen;
return kodedosen;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getdiskon` (`jumlah` INT) RETURNS INT(11)  begin
declare diskon int; CASE
when (jumlah >= 100) THEN SET diskon = 10;
when (jumlah >= 50 AND jumlah < 100 ) THEN SET diskon = 5;
when (jumlah >= 20 AND jumlah < 50 ) THEN SET diskon = 3;
else SET diskon = 0; END CASE;
return diskon;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `karyawan1` (`nama` VARCHAR(50)) RETURNS VARCHAR(35) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  begin
return concat (nama);
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kota1` () RETURNS INT(11)  begin
declare kota int;
select count(*) into kota
from karyawan;
return kota;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kuadrat` (`x` INT, `y` INT) RETURNS INT(11)  begin
return x*y ;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `tambah` (`angka1` INT, `angka2` INT) RETURNS INT(11)  begin
return angka1 + angka2;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `tambah1` (`angka1` INT, `angka2` INT, `angka3` INT) RETURNS INT(11)  begin
return angka1 + angka2 * angka3;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `stok` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`) VALUES
('A11', 'Keyboard', 55),
('A12', 'DVD R-W', 10);

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `deleteChild` AFTER DELETE ON `barang` FOR EACH ROW begin
delete from pembelian
where id_barang = Old.id_barang;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inkremenStok2` BEFORE INSERT ON `barang` FOR EACH ROW begin
set new.stok = new.stok + 1;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` char(5) NOT NULL,
  `nama_dosen` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `nama_dosen`) VALUES
('11', 'Stive'),
('22', 'samuel'),
('33', 'alexander');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `NIK` int(15) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Kota` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`NIK`, `Nama`, `Alamat`, `Kota`) VALUES
(11111111, 'Dicko', 'JL.T.Amir Hamzah', 'Binjai'),
(22222222, 'Pulu-Pulu', 'JL.Wahidin', 'Medan'),
(33333333, 'Mia Khalifah', 'JL.Ikan Nila', 'Stabat');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `alamat`) VALUES
(10, 'diko', 'binjai'),
(30, 'didi', 'stabat'),
(50, 'andyan', 'kuala'),
(60, 'dimas', 'gumit'),
(80, 'maulana', 'medan'),
(90, 'diko', 'binjai');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa11`
--

CREATE TABLE `mahasiswa11` (
  `nim` int(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa11`
--

INSERT INTO `mahasiswa11` (`nim`, `nama`, `alamat`) VALUES
(80, 'maulana', 'kampung lalang'),
(90, 'diko', 'binjai'),
(95, 'asep', 'langkat'),
(100, 'triva', 'tamdem');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `kode` varchar(5) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `merk` varchar(15) NOT NULL,
  `tarif` int(11) NOT NULL,
  `nopol` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`kode`, `jenis`, `merk`, `tarif`, `nopol`) VALUES
('01', 'SUV', 'Pajero sport', 5000000, 'bk 123 b'),
('02', 'sport', 'ferrari', 8000000, 'bk 234 t'),
('03', 'sedan', 'BMW', 12000000, 'bk 567 d'),
('04', 'Hatchback', 'Honda CIVIC', 15000000, 'bk 890 a'),
('05', 'EV', 'BMW', 20000000, 'bk 112 z');

-- --------------------------------------------------------

--
-- Stand-in structure for view `mobil1`
-- (See below for the actual view)
--
CREATE TABLE `mobil1` (
`jenis` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `mobil2`
-- (See below for the actual view)
--
CREATE TABLE `mobil2` (
`jenis` varchar(10)
,`merk` varchar(15)
,`tarif` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_mm`
--

CREATE TABLE `nilai_mm` (
  `id_nilai_mm` char(2) NOT NULL,
  `nrp` varchar(15) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai_mm`
--

INSERT INTO `nilai_mm` (`id_nilai_mm`, `nrp`, `nilai`) VALUES
('01', 'diko', 90),
('02', 'asep', 95);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kode` varchar(6) NOT NULL,
  `nama` varchar(15) NOT NULL,
  `kontak` varchar(15) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kota` varchar(15) NOT NULL,
  `kode_pos` varchar(5) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kode`, `nama`, `kontak`, `alamat`, `kota`, `kode_pos`, `telepon`, `fax`) VALUES
('11', 'diko', '1111', 'tandem', 'binjai', '1234', '081234567', '11111'),
('22', 'triva', '2222', 'tandem', 'binjai', '2345', '081234568', '22222'),
('33', 'maulana', '3333', 'diski', 'medan', '3456', '081234569', '33333'),
('44', 'dimas', '4444', 'gumit', 'stabat', '4567', '081234560', '44444'),
('55', 'didi', '5555', 'tandem hilir', 'binjai', '5678', '081234571', '55555');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pelanggan1`
-- (See below for the actual view)
--
CREATE TABLE `pelanggan1` (
`nama` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pelanggan2`
-- (See below for the actual view)
--
CREATE TABLE `pelanggan2` (
`kode` varchar(6)
,`nama` varchar(15)
,`kontak` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(5) NOT NULL,
  `id_barang` varchar(5) NOT NULL,
  `jumlah_beli` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_barang`, `jumlah_beli`) VALUES
(2, 'A11', 40);

--
-- Triggers `pembelian`
--
DELIMITER $$
CREATE TRIGGER `updateStok` AFTER INSERT ON `pembelian` FOR EACH ROW begin
update barang
set stok = stok + new.jumlah_beli
where id_barang = new.id_barang;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatestokedit` AFTER UPDATE ON `pembelian` FOR EACH ROW begin
update barang
set stok = stok + (new.jumlah_beli - old.jumlah_beli)
where id_barang = new.id_barang;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `no_faktur_sewa` varchar(5) NOT NULL,
  `kode_pelanggan` varchar(6) NOT NULL,
  `tgl_sewa` date NOT NULL,
  `kode_mobil` varchar(5) NOT NULL,
  `lama_sewa` int(11) NOT NULL,
  `uang_muka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`no_faktur_sewa`, `kode_pelanggan`, `tgl_sewa`, `kode_mobil`, `lama_sewa`, `uang_muka`) VALUES
('001', '11', '2020-02-20', '01', 3, 2000000),
('002', '22', '2019-09-19', '02', 3, 4500000),
('003', '33', '2018-08-18', '03', 2, 5000000),
('004', '44', '2017-07-17', '04', 1, 6500000),
('005', '55', '2016-06-16', '05', 5, 8000000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sewa1`
-- (See below for the actual view)
--
CREATE TABLE `sewa1` (
`kode_pelanggan` varchar(6)
,`kode_mobil` varchar(5)
,`lama_sewa` int(11)
,`uang_muka` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sewa3`
-- (See below for the actual view)
--
CREATE TABLE `sewa3` (
`uang_muka` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `nim` int(10) DEFAULT NULL,
  `buku` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nim`, `buku`) VALUES
(1, 30, 'si kancil'),
(2, 50, 'tranformers'),
(3, 60, 'kisah nabi'),
(4, 80, 'malah dewasa'),
(5, 90, 'dilan');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vend_ID` char(4) NOT NULL,
  `vend_nama` varchar(25) NOT NULL,
  `vend_addres` varchar(30) DEFAULT NULL,
  `vend_city` varchar(20) DEFAULT NULL,
  `vend_state` varchar(5) DEFAULT NULL,
  `vend_zip` varchar(7) DEFAULT NULL,
  `vend_country` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vend_ID`, `vend_nama`, `vend_addres`, `vend_city`, `vend_state`, `vend_zip`, `vend_country`) VALUES
('111', 'Dicko', 'Jati makmur', 'Binjai', 'north', '1111', 'Indonesia');

-- --------------------------------------------------------

--
-- Structure for view `mobil1`
--
DROP TABLE IF EXISTS `mobil1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mobil1`  AS SELECT `mobil`.`jenis` AS `jenis` FROM `mobil` WHERE `mobil`.`jenis` like 'S%' ;

-- --------------------------------------------------------

--
-- Structure for view `mobil2`
--
DROP TABLE IF EXISTS `mobil2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mobil2`  AS SELECT `mobil`.`jenis` AS `jenis`, `mobil`.`merk` AS `merk`, `mobil`.`tarif` AS `tarif` FROM `mobil` ;

-- --------------------------------------------------------

--
-- Structure for view `pelanggan1`
--
DROP TABLE IF EXISTS `pelanggan1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pelanggan1`  AS SELECT `pelanggan`.`nama` AS `nama` FROM `pelanggan` WHERE `pelanggan`.`nama` like 'd%' ;

-- --------------------------------------------------------

--
-- Structure for view `pelanggan2`
--
DROP TABLE IF EXISTS `pelanggan2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pelanggan2`  AS SELECT `pelanggan`.`kode` AS `kode`, `pelanggan`.`nama` AS `nama`, `pelanggan`.`kontak` AS `kontak` FROM `pelanggan` ;

-- --------------------------------------------------------

--
-- Structure for view `sewa1`
--
DROP TABLE IF EXISTS `sewa1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sewa1`  AS SELECT `sewa`.`kode_pelanggan` AS `kode_pelanggan`, `sewa`.`kode_mobil` AS `kode_mobil`, `sewa`.`lama_sewa` AS `lama_sewa`, `sewa`.`uang_muka` AS `uang_muka` FROM `sewa` ;

-- --------------------------------------------------------

--
-- Structure for view `sewa3`
--
DROP TABLE IF EXISTS `sewa3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sewa3`  AS SELECT `sewa`.`uang_muka` AS `uang_muka` FROM `sewa` WHERE `sewa`.`uang_muka` < 8000000 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mahasiswa11`
--
ALTER TABLE `mahasiswa11`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `nilai_mm`
--
ALTER TABLE `nilai_mm`
  ADD PRIMARY KEY (`id_nilai_mm`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vend_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
