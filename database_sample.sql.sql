-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2016 at 01:43 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_peter`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_id` varchar(50) NOT NULL COMMENT 'PK for Category - ID number',
  `Description` varchar(20) NOT NULL COMMENT 'Description for category'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vehicle category on our Db';

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_id`, `Description`) VALUES
('4WD', '4WD'),
('Hatchback', 'Hatchback'),
('Sedan', 'Sedan'),
('Sportsedan', 'Sportsedan'),
('Stationwagon', 'Stationwagon'),
('Ute', 'Ute');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL COMMENT 'Customer Identification',
  `First_Name` varchar(50) NOT NULL COMMENT 'Christian Name',
  `Last_Name` varchar(100) NOT NULL COMMENT 'Surname',
  `Street` varchar(20) NOT NULL COMMENT 'Street name',
  `City` varchar(20) NOT NULL COMMENT 'Resides in city of',
  `State` varchar(5) NOT NULL COMMENT 'Australian State ',
  `Postcode` varchar(5) NOT NULL COMMENT 'Residents Postcode',
  `Phone` varchar(20) NOT NULL COMMENT 'Customers phone number',
  `Email` varchar(100) NOT NULL COMMENT 'Customers email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains all the customers in our db';

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `First_Name`, `Last_Name`, `Street`, `City`, `State`, `Postcode`, `Phone`, `Email`) VALUES
(1, 'Darren', 'Bundaberg', '25 Heavenly Drive', 'Bundaberg', 'Qld', '4670', '045191919', 'darrenbundaberg@yahoo.com.au'),
(2, 'Jesse', 'James', '69 Gumtree Road', 'Armadale', 'SA', '6112', '045828228', 'jessjames@gmail.com.au'),
(3, 'David', 'Donaldson', '82 Pelican Crescent', 'Brentwood', 'SA', '6153', '0409876543', 'daviddonaldson@yahoo.com.au'),
(4, 'Barry', 'Kersten', '35 Cypress Drive', 'Alfred cove', 'WA', '6154', '045828888', 'barrykersten@yahoo.com'),
(5, 'Lola', 'Lawson', '1 Crowley Crescent', 'Yarragon', 'Vic', '3823', '0405558889', 'loloklawson@yahoo.com'),
(6, 'Geoff ', 'Beck', '33 Loves Lane', 'Bayswater', 'WA', '6053', '06 4535269', 'geoffbeck@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `Manufacture_ID` enum('Holden','Ford','Mazda','Nissan','Volkswagon','') NOT NULL COMMENT 'Manufacturers  Identification',
  `Name` varchar(50) NOT NULL COMMENT 'Description of Company'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains all the manufactures in our db';

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`Manufacture_ID`, `Name`) VALUES
('Holden', 'Holden'),
('Ford', 'Ford'),
('Mazda', 'Mazda'),
('Nissan', 'Nissan'),
('Volkswagon', 'Volkswagon');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Receipt` int(25) NOT NULL COMMENT 'Sales receipt number',
  `Staff_ID` int(11) NOT NULL COMMENT 'Staff Identification ',
  `Customer` int(11) NOT NULL COMMENT 'Customer Identification',
  `Stock_No` int(50) NOT NULL COMMENT 'Stock Code',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'date of sales'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains all the sales in our database';

-- --------------------------------------------------------

--
-- Table structure for table `salesperson`
--

CREATE TABLE `salesperson` (
  `Staff_ID` int(11) NOT NULL COMMENT 'Staff Identification',
  `First_Name` varchar(50) NOT NULL COMMENT 'Christian Name',
  `Last_Name` varchar(100) NOT NULL COMMENT 'Surname',
  `Phone` varchar(20) NOT NULL COMMENT 'Telephone Number',
  `Email` varchar(100) NOT NULL COMMENT 'Email Address'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains all the staff in our database';

--
-- Dumping data for table `salesperson`
--

INSERT INTO `salesperson` (`Staff_ID`, `First_Name`, `Last_Name`, `Phone`, `Email`) VALUES
(1, 'Richard', 'Cranium', '07 475 475 47', 'richardcranium@westcoastauto.com'),
(2, 'Dwayne', 'Pipe', '07 475 475 48', 'dwaynepipe@westcoastauto.com.au'),
(3, 'Harley', 'Davidson', '07 475 475 49', 'harleydavidson@westcoastauto.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `EMAIL` varchar(100) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `SECURITY_LEVEL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`EMAIL`, `USERNAME`, `PASSWORD`, `SECURITY_LEVEL`) VALUES
('admin@admin.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Stock_No` int(50) NOT NULL COMMENT 'Vehicle stock number',
  `Availability` varchar(20) CHARACTER SET utf32 NOT NULL COMMENT 'Indicates if vehicle is in stock or sold',
  `Manufacturer_ID` enum('Holden','Ford','Mazda','') NOT NULL COMMENT 'Manufacturing company of the vehicle',
  `Category_ID` varchar(50) NOT NULL COMMENT 'Category Identification',
  `Model` varchar(20) NOT NULL COMMENT 'Make of model',
  `Year` year(4) NOT NULL COMMENT 'Year of manufacture',
  `Price` int(6) NOT NULL COMMENT 'Vehicle Price',
  `Kilometeres` int(7) NOT NULL COMMENT 'Odometer reading',
  `Colour` varchar(20) NOT NULL COMMENT 'Vehicles colour',
  `Registration` varchar(10) NOT NULL COMMENT 'Vehicles Registration',
  `VIN` varchar(20) NOT NULL COMMENT 'Vehicle Identification number',
  `Cylinders` varchar(15) NOT NULL COMMENT 'Cylinders in total',
  `Fuel` varchar(10) NOT NULL COMMENT 'Type of engine fuel',
  `Transmission` varchar(10) NOT NULL,
  `Specials` tinyint(1) NOT NULL COMMENT 'Identification of specials'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vehicle category on our Db';

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Stock_No`, `Availability`, `Manufacturer_ID`, `Category_ID`, `Model`, `Year`, `Price`, `Kilometeres`, `Colour`, `Registration`, `VIN`, `Cylinders`, `Fuel`, `Transmission`, `Specials`) VALUES
(1, 'instock', 'Holden', 'Sedan', 'Commodore', 2006, 12999, 135992, 'Orange', '463HYV', '369852147892546', '6', 'petrol', 'automatic', 0),
(2, 'instock', 'Holden', 'Sedan', 'Commodore', 2005, 7000, 161444, 'Navy Blue', '000JIM', '97856423125891', '6', 'petrol', 'automatic', 0),
(3, 'instock', 'Holden', 'Ute', 'Omega', 2008, 12999, 79803, 'White', '285PCP', '64319785251973', '6', 'petrol', 'automatic', 0),
(4, 'instock', 'Holden', 'Stationwagon', 'Commodore', 2009, 20000, 114001, 'White', '666PMS', '32564178965419', '6', 'unleaded', 'automatic', 0),
(5, 'instock', 'Mazda', 'Sportsedan', ' 3 Maxx ', 2007, 9000, 172868, 'Red', '233MAX', '983245781291375', '6', 'unleaded', 'automatic', 0),
(6, 'instock', 'Mazda', 'Stationwagon', 'Tribute Classic', 2002, 7000, 200615, 'Gold', '235KVM', '75821456958236', '6', 'unleaded', 'automatic', 0),
(7, 'instock', 'Ford', 'Sedan', 'Falcon', 2005, 9999, 135583, 'Yellow', '000HIS', '36985218459735', '6', 'unleaded', 'Manual', 0),
(8, 'instock', 'Ford', 'Ute', 'Courier GL', 2005, 8999, 203457, 'White', '763VYV', '46528197328465', '6', 'unleaded', 'Manual', 0),
(9, 'instock', 'Ford', 'Hatchback', 'Focus', 2010, 46000, 18360, 'Lime Green', '555KDB', '95847634591258', '4', 'unleaded', 'Manual', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`Manufacture_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Receipt`),
  ADD KEY `Staff_ID` (`Staff_ID`),
  ADD KEY `Customer` (`Customer`),
  ADD KEY `Stock_No` (`Stock_No`);

--
-- Indexes for table `salesperson`
--
ALTER TABLE `salesperson`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`EMAIL`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Stock_No`),
  ADD KEY `Manufacturer_ID` (`Manufacturer_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Customer Identification', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `Receipt` int(25) NOT NULL AUTO_INCREMENT COMMENT 'Sales receipt number';
--
-- AUTO_INCREMENT for table `salesperson`
--
ALTER TABLE `salesperson`
  MODIFY `Staff_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Staff Identification', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `Stock_No` int(50) NOT NULL AUTO_INCREMENT COMMENT 'Vehicle stock number', AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`Customer`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`Staff_ID`) REFERENCES `salesperson` (`Staff_ID`),
  ADD CONSTRAINT `sales_ibfk_5` FOREIGN KEY (`Stock_No`) REFERENCES `vehicle` (`Stock_No`) ON UPDATE CASCADE;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_id`),
  ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`Manufacturer_ID`) REFERENCES `manufacturer` (`Manufacture_ID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
