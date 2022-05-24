-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 07, 2022 at 06:25 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Id` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Id`, `CategoryName`, `Description`) VALUES
(1, 'Wildlife', ''),
(2, 'Strong Women', ''),
(3, 'Figurative', ''),
(4, 'Abstract', '');

-- --------------------------------------------------------

--
-- Table structure for table `courrier`
--

CREATE TABLE `courrier` (
  `Id` int(11) NOT NULL,
  `CourrierName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `CountryCode` int(11) NOT NULL,
  `StandardPhone` int(20) DEFAULT NULL,
  `MobileNumber` int(11) NOT NULL,
  `Contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courrier`
--

INSERT INTO `courrier` (`Id`, `CourrierName`, `Address`, `Email`, `CountryCode`, `StandardPhone`, `MobileNumber`, `Contact`) VALUES
(1, 'Postnord', 'postnordgatan 2 , 51124 Göteborg, Sverige', 'info@postnord.se', 46, 31837465, 767123654, 'Stefan Larsson'),
(2, 'DHL', 'dhlgatan 65, 45623 Borås, Sverige', 'info@dhl.se', 46, NULL, 731123645, 'Louise Andersson');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `Id` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Text` text NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`Id`, `Title`, `Text`, `Date`) VALUES
(1, 'January 2022', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”\r\nThe purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\r\n', '2022-01-01'),
(2, 'Min titel', 'brödtext2', '2022-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Id` int(11) NOT NULL,
  `StatusID` varchar(20) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CourrierID` int(11) NOT NULL,
  `RegisterDate` datetime NOT NULL,
  `ShippingDate` datetime DEFAULT NULL,
  `CustRecDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Id`, `StatusID`, `UserID`, `CourrierID`, `RegisterDate`, `ShippingDate`, `CustRecDate`) VALUES
(1, 'CREC', 1, 1, '2022-01-28 00:00:00', '2022-01-29 00:00:00', '2022-01-31 00:00:00'),
(2, 'CREC', 2, 2, '2022-02-02 15:39:35', '2022-02-02 15:39:35', '2022-02-02 15:39:35'),
(3, 'REG', 2, 1, '2022-01-24 00:00:00', NULL, NULL),
(4, 'REG', 3, 1, '2022-01-28 00:00:00', NULL, NULL),
(5, 'CREC', 3, 1, '2022-01-18 00:00:00', '2022-01-29 00:00:00', '2022-02-03 09:53:14'),
(6, 'REG', 1, 2, '2022-01-29 00:00:00', NULL, NULL),
(7, 'REG', 1, 1, '2022-02-02 15:24:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ProductID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`ProductID`, `OrderID`, `Quantity`) VALUES
(5, 7, 1),
(12, 1, 1),
(19, 2, 1),
(20, 5, 3),
(27, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `Id` varchar(8) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`Id`, `Status`, `Description`) VALUES
('CREC', 'CustReceived', 'The order is delivered to customer'),
('REG', 'Registered', 'The order is registered and will soon be handled'),
('SHIP', 'Shipped', 'The order has left our warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `UnitPrice` float NOT NULL,
  `UnitsInStock` int(11) NOT NULL,
  `Image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `Name`, `Description`, `UnitPrice`, `UnitsInStock`, `Image`) VALUES
(1, 'Stop hiding', '100x150\r\nAcrylic and charcoal\r\nGallery canvas\r\nReady to hang!', 1490, 1, 'abStopHiding.png'),
(2, 'Spirit of a wolf', '100 x 120\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame not necessary)\r\nReady to hang!', 1190, 1, 'wildSpiritOfAWolf.png'),
(3, 'Everyone knows the price of evereything and the value of nothing', '100x150\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 1490, 1, 'womanEveryoneKnowsThePrice.JPG'),
(4, 'Power', '100x120\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 1290, 1, 'womanStrongBianca.jpg'),
(5, 'Prodigious', '100x120\r\nAcrylic\r\nGallery canvas\r\nReady to hang', 1190, 1, 'abProdigious.jpg'),
(6, 'Dont worry bout me', '100x150\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 1490, 1, 'womanStrongBianca2.jpg'),
(7, 'Epic', '60 x 80\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 890, 1, 'womanEpic.JPG'),
(8, 'Front porch', '100x120\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 1290, 1, 'womanStrongPorch.JPG'),
(9, 'To the moon and back', '100x80\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 990, 1, 'womanToTheMoonAndBack.JPG'),
(10, 'Here comes the sun', '100x150\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 1490, 1, 'womanStrong.jpg'),
(11, 'Stand your ground', '210x360\r\nAcrylic\r\nUnstretched canvas\r\nWill be shipped in safe tube\r\nCan be shipped directly to your nearest frame maker!', 2600, 1, 'abStandYourGround.JPG'),
(12, 'Dylan', '100x120\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 1290, 1, 'figDylan.JPG'),
(13, 'Sometimes I feel transparent', '60x80\r\nAcrylic\r\nGallery canvas\r\nReady to hang', 800, 1, 'figSometimesIFeelTransparent.jpg'),
(14, 'Tell me more', '100x120\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame is not a need)\r\nReady to hang!', 1190, 1, 'figTellMeMore.JPG'),
(15, 'I’VE SEEN IT ALL', 'Portrait of artist Jammie Holmes\r\n100x150\r\nOil and charcoal\r\nReady to hang', 1290, 1, 'figIveSeenItAll.JPG'),
(16, 'Can\'t worry \'bout what\'s behind you or what\'s coming for you further up the road', '150x100\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame not necessary)\r\nReady to hang!', 1290, 1, 'wildAnt.png'),
(17, 'Self-respect', '100x150 \r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame not necessary)\r\nReady to hang!', 1290, 1, 'wildDeer.png'),
(18, 'Country dreams', '215x150\r\nAcrylic\r\nUnstretched canvas\r\nWill be shipped in safe tube\r\nCan be shipped directly to your nearest frame maker!', 2500, 1, 'wildCountryDreams.png'),
(19, 'Single malt', '70x90\r\nAcrylic\r\nRegular canvas\r\nReady to hang!', 700, 1, 'wildLife.JPG'),
(20, 'Spirit of a bird', '100x100\r\nAcrylic\r\nRegular canvas\r\nReady to hang!', 1090, 1, 'wildSpiritOfABird.png'),
(21, 'Spirit of a lion', '100x120\r\nAcrylic\r\nGallery canvas with 40mm black painted edges (frame not necessary)\r\nReady to hang!', 1190, 1, 'wildSpiritOfALion.png'),
(22, 'What we do in life echoes in eternity', '210x310\r\nMixed media\r\nUnstretched canvas\r\nWill be shipped in safe tube\r\nCan be shipped directly to your nearest frame maker!', 2600, 1, 'wildWhatWeDoInLife.JPG'),
(23, 'Knowledge', '215x225\r\nAcrylic on unstretched canvas\r\nWill be shipped in safe tube\r\nCan be shipped directly to your nearest frame maker!', 2200, 1, 'abKnowledge.jpg'),
(24, 'Take what’s ours', '100x150\r\nAcrylic\r\nGallery canvas\r\nReady to hang!', 1490, 1, 'womanTakeWhatsOurs.png'),
(25, 'Street smart', '150x100\r\nOil on a acrylic background\r\nGallery canvas\r\nReady to hang', 1290, 1, 'figStreetSmart.png'),
(26, 'Olive', '100x120\r\nAcrylic\r\nGallery canvas\r\nReady to hang', 1000, 1, 'figOlive.png'),
(27, 'Breaking up with god', '60x80\r\nAcrylic\r\nGallery canvas\r\nReady to hang', 800, 1, 'abBreakingUpWithGod.png'),
(28, 'These times', '100x100\r\nMixed media\r\nReady to hang', 990, 1, 'abTheseTimes.png');

-- --------------------------------------------------------

--
-- Table structure for table `productincategory`
--

CREATE TABLE `productincategory` (
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `LastUpdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productincategory`
--

INSERT INTO `productincategory` (`ProductID`, `CategoryID`, `LastUpdated`) VALUES
(1, 4, '2022-02-01'),
(2, 1, '2022-02-01'),
(3, 2, '2022-02-01'),
(4, 2, '2022-02-01'),
(5, 4, '2022-02-01'),
(6, 2, '2022-02-01'),
(7, 2, '2022-02-01'),
(8, 2, '2022-02-01'),
(9, 2, '2022-02-01'),
(10, 2, '2022-02-01'),
(11, 4, '2022-02-01'),
(12, 3, '2022-02-01'),
(13, 3, '2022-02-01'),
(14, 3, '2022-02-01'),
(15, 3, '2022-02-01'),
(16, 1, '2022-02-01'),
(16, 3, '2022-02-01'),
(17, 1, '2022-02-01'),
(18, 1, '2022-02-01'),
(19, 1, '2022-02-01'),
(20, 1, '2022-02-01'),
(21, 1, '2022-02-01'),
(22, 1, '2022-02-01'),
(23, 4, '2022-02-01'),
(24, 2, '2022-02-01'),
(25, 3, '2022-02-01'),
(26, 3, '2022-02-01'),
(27, 4, '2022-02-01'),
(28, 4, '2022-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptionnews`
--

CREATE TABLE `subscriptionnews` (
  `Id` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscriptionnews`
--

INSERT INTO `subscriptionnews` (`Id`, `UserID`, `FirstName`, `LastName`, `Email`) VALUES
(3, NULL, 'Angelica', 'Moberg Skoglund', 'a.m.s@live.se'),
(4, 3, 'Sigge', 'Eklund', 'telia@telia.se'),
(5, NULL, 'Sebastian', 'Larsson', 'sebastianlarsson@live.se'),
(6, NULL, 'Amina', 'Hallam', 'aminahallam@live.se'),
(7, 1, 'Agda', 'Larsson', 'tjena@hej.se');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `CO` varchar(100) DEFAULT NULL,
  `ZipCode` int(20) NOT NULL,
  `City` varchar(60) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `CountryCode` int(11) NOT NULL,
  `StandardPhone` int(20) DEFAULT NULL,
  `MobileNumber` int(20) NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  `TermsOfPurchase` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `Email`, `Password`, `FirstName`, `LastName`, `Street`, `CO`, `ZipCode`, `City`, `Country`, `CountryCode`, `StandardPhone`, `MobileNumber`, `Admin`, `TermsOfPurchase`) VALUES
(1, 'tjena@hej.se', 'hejsvej2014', 'Agda', 'Larsson', 'Tjolahoppsvägen', NULL, 51123, 'Borås', 'Sweden', 46, 31, 274843, 0, 0),
(2, 'hejhejhej@tjose', 'tbnhjrejvn25', 'Örjan', 'Svedin', 'Andravägen 78', NULL, 12345, 'Bollebygd', 'Sweden', 46, NULL, 736761236, 0, 0),
(3, 'telia@telia.se', 'rfgerger98!', 'Sigge', 'Eklund', 'sistavägen 45', NULL, 25412, 'Göteborg', 'Sweden', 46, NULL, 765453658, 0, 1),
(4, 'grey@grey.se', 'ffefwfäfer', 'Per', 'Andersson', 'skitvägen', NULL, 12345, 'Malmö', 'Sweden', 46, NULL, 76123456, 0, 0),
(5, 'admin@admin.se', 'admin', 'admin', 'admin', 'skitvägen', NULL, 12345, 'Malmö', 'Sweden', 46, NULL, 76123456, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `courrier`
--
ALTER TABLE `courrier`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CourrierId` (`CourrierID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `OrderStatusID` (`StatusID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ProductID`,`OrderID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `productincategory`
--
ALTER TABLE `productincategory`
  ADD PRIMARY KEY (`ProductID`,`CategoryID`),
  ADD KEY `CategoryId` (`CategoryID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `subscriptionnews`
--
ALTER TABLE `subscriptionnews`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `courrier`
--
ALTER TABLE `courrier`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `subscriptionnews`
--
ALTER TABLE `subscriptionnews`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CourrierID`) REFERENCES `courrier` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`StatusID`) REFERENCES `orderstatus` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productincategory`
--
ALTER TABLE `productincategory`
  ADD CONSTRAINT `productincategory_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productincategory_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
