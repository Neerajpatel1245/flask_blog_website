-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2024 at 05:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `Srno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Srno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(25) NOT NULL,
  `img_file` varchar(15) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Srno`, `title`, `tag_line`, `slug`, `content`, `author`, `img_file`, `date`) VALUES
(1, 'Let\'s Dive Into Space.', 'Here will be tag line', 'first', 'Space is a three-dimensional continuum containing positions and directions.[1] In classical physics, physical space is often conceived in three linear dimensions. Modern physicists usually consider it, with time, to be part of a boundless four-dimensional continuum known as spacetime.', 'Neeraj', 'post-bg.jpg', '2024-03-22'),
(3, 'Pagination', 'Documentation and examples for showing pagination to indicate a series of related content exists across multiple pages.', 'second', 'We use a large block of connected links for our pagination, making links hard to miss and easily scalable—all while providing large hit areas. Pagination is built with list HTML elements so screen readers can announce the number of available links. Use a wrapping <nav> element to identify it as a navigation section to screen readers and other assistive technologies.\r\n\r\nIn addition, as pages likely have more than one such navigation section, it’s advisable to provide a descriptive aria-label for the <nav> to reflect its purpose. For example, if the pagination component is used to navigate between a set of search results, an appropriate label could be aria-label=\"Search results pages\".', 'unknown', '', '2024-03-23'),
(4, 'Tables', 'Documentation and examples for opt-in styling of tables (given their prevalent use in JavaScript plugins) with Bootstrap.', 'third', 'Due to the widespread use of tables across third-party widgets like calendars and date pickers, we’ve designed our tables to be opt-in. Just add the base class .table to any <table>, then extend with custom styles or our various included modifier classes.\r\n\r\nUsing the most basic table markup, here’s how .table-based tables look in Bootstrap. All table styles are inherited in Bootstrap 4, meaning any nested tables will be styled in the same manner as the parent.', 'Neeraj', '', '2024-03-23'),
(5, 'Forms', 'Examples and usage guidelines for form control styles, layout options, and custom components for creating a wide variety of forms.', 'fourth', 'Bootstrap’s form controls expand on our Rebooted form styles with classes. Use these classes to opt into their customized displays for a more consistent rendering across browsers and devices.\r\n\r\nBe sure to use an appropriate type attribute on all inputs (e.g., email for email address or number for numerical information) to take advantage of newer input controls like email verification, number selection, and more.\r\n\r\nHere’s a quick example to demonstrate Bootstrap’s form styles. Keep reading for documentation on required classes, form layout, and more.', 'Neeraj', '', '2024-03-23'),
(6, 'Bootstrap Glyphicons', 'Bootstrap 3 Icons', 'fifth', 'Below is a list of all Bootstrap 3 Glyphicons.\r\n\r\nNote: Glyphicons are not supported in Bootstrap 4.\r\n\r\nFor more information about Bootstrap 3 and Glyphicons, visit our Bootstrap 3 Tutorial.\r\n\r\nIcon	Description	Example\r\nglyphicon glyphicon-asterisk	\r\nglyphicon glyphicon-plus	\r\nglyphicon glyphicon-minus	\r\nglyphicon glyphicon-eur	\r\nglyphicon glyphicon-euro	\r\nglyphicon glyphicon-cloud	\r\nglyphicon glyphicon-envelope	\r\nglyphicon glyphicon-pencil	\r\nglyphicon glyphicon-glass	\r\nglyphicon glyphicon-music	\r\nglyphicon glyphicon-search	\r\nglyphicon glyphicon-heart	\r\nglyphicon glyphicon-star	\r\nglyphicon glyphicon-star-empty	\r\nglyphicon glyphicon-user	\r\nglyphicon glyphicon-film	\r\nglyphicon glyphicon-th-large	\r\nglyphicon glyphicon-th	\r\nglyphicon glyphicon-th-list	\r\nglyphicon glyphicon-ok	\r\nglyphicon glyphicon-remove	\r\nglyphicon glyphicon-zoom-in	\r\nglyphicon glyphicon-zoom-out	\r\nglyphicon glyphicon-off	\r\nglyphicon glyphicon-signal	\r\nglyphicon glyphicon-cog	\r\nglyphicon glyphicon-trash	\r\nglyphicon glyphicon-home	\r\nglyphicon glyphicon-file	\r\nglyphicon glyphicon-time	\r\nglyphicon glyphicon-road	\r\nglyphicon glyphicon-download-alt	\r\nglyphicon glyphicon-download	\r\nglyphicon glyphicon-upload	\r\nglyphicon glyphicon-inbox	\r\nglyphicon glyphicon-play-circle	\r\nglyphicon glyphicon-repeat	\r\nglyphicon glyphicon-refresh	\r\nglyphicon glyphicon-list-alt	\r\nglyphicon glyphicon-lock	\r\nglyphicon glyphicon-flag	\r\nglyphicon glyphicon-headphones	\r\nglyphicon glyphicon-volume-off	\r\nglyphicon glyphicon-volume-down	\r\nglyphicon glyphicon-volume-up	\r\nglyphicon glyphicon-qrcode	\r\nglyphicon glyphicon-barcode	\r\nglyphicon glyphicon-tag	\r\nglyphicon glyphicon-tags	\r\nglyphicon glyphicon-book	\r\nglyphicon glyphicon-bookmark	\r\nglyphicon glyphicon-print	\r\nglyphicon glyphicon-camera	\r\nglyphicon glyphicon-font	\r\nglyphicon glyphicon-bold	\r\nglyphicon glyphicon-italic	\r\nglyphicon glyphicon-text-height	\r\nglyphicon glyphicon-text-width	\r\nglyphicon glyphicon-align-left	\r\nglyphicon glyphicon-align-center	\r\nglyphicon glyphicon-align-right	\r\nglyphicon glyphicon-align-justify	\r\nglyphicon glyphicon-list	\r\nglyphicon glyphicon-indent-left	\r\nglyphicon glyphicon-indent-right	\r\nglyphicon glyphicon-facetime-video	\r\nglyphicon glyphicon-picture	\r\nglyphicon glyphicon-map-marker	\r\nglyphicon glyphicon-adjust	\r\nglyphicon glyphicon-tint	\r\nglyphicon glyphicon-edit	\r\nglyphicon glyphicon-share	\r\nglyphicon glyphicon-check	\r\nglyphicon glyphicon-move	\r\nglyphicon glyphicon-step-backward	\r\nglyphicon glyphicon-fast-backward	\r\nglyphicon glyphicon-backward	\r\nglyphicon glyphicon-play	\r\nglyphicon glyphicon-pause	\r\nglyphicon glyphicon-stop	\r\nglyphicon glyphicon-forward	\r\nglyphicon glyphicon-fast-forward	\r\nglyphicon glyphicon-step-forward	\r\nglyphicon glyphicon-eject	\r\nglyphicon glyphicon-chevron-left	\r\nglyphicon glyphicon-chevron-right	\r\nglyphicon glyphicon-plus-sign	\r\nglyphicon glyphicon-minus-sign	\r\nglyphicon glyphicon-remove-sign	\r\nglyphicon glyphicon-ok-sign	\r\nglyphicon glyphicon-question-sign	\r\nglyphicon glyphicon-info-sign	\r\nglyphicon glyphicon-screenshot	\r\nglyphicon glyphicon-remove-circle	\r\nglyphicon glyphicon-ok-circle	\r\nglyphicon glyphicon-ban-circle	\r\nglyphicon glyphicon-arrow-left	\r\nglyphicon glyphicon-arrow-right	\r\nglyphicon glyphicon-arrow-up	\r\nglyphicon glyphicon-arrow-down	\r\nglyphicon glyphicon-share-alt	\r\nglyphicon glyphicon-resize-full	\r\nglyphicon glyphicon-resize-small	\r\nglyphicon glyphicon-exclamation-sign	\r\nglyphicon glyphicon-gift	\r\nglyphicon glyphicon-leaf	\r\nglyphicon glyphicon-fire	\r\nglyphicon glyphicon-eye-open	\r\nglyphicon glyphicon-eye-close	\r\nglyphicon glyphicon-warning-sign	\r\nglyphicon glyphicon-plane	\r\nglyphicon glyphicon-calendar	\r\nglyphicon glyphicon-random	\r\nglyphicon glyphicon-comment	\r\nglyphicon glyphicon-magnet	\r\nglyphicon glyphicon-chevron-up	\r\nglyphicon glyphicon-chevron-down	\r\nglyphicon glyphicon-retweet	\r\nglyphicon glyphicon-shopping-cart	\r\nglyphicon glyphicon-folder-close	\r\nglyphicon glyphicon-folder-open	\r\nglyphicon glyphicon-resize-vertical	\r\nglyphicon glyphicon-resize-horizontal	\r\nglyphicon glyphicon-hdd	\r\nglyphicon glyphicon-bullhorn	\r\nglyphicon glyphicon-bell	\r\nglyphicon glyphicon-certificate	\r\nglyphicon glyphicon-thumbs-up	\r\nglyphicon glyphicon-thumbs-down	\r\nglyphicon glyphicon-hand-right	\r\nglyphicon glyphicon-hand-left	\r\nglyphicon glyphicon-hand-up	\r\nglyphicon glyphicon-hand-down	\r\nglyphicon glyphicon-circle-arrow-right	\r\nglyphicon glyphicon-circle-arrow-left	\r\nglyphicon glyphicon-circle-arrow-up	\r\nglyphicon glyphicon-circle-arrow-down	\r\nglyphicon glyphicon-globe	\r\nglyphicon glyphicon-wrench	\r\nglyphicon glyphicon-tasks	\r\nglyphicon glyphicon-filter	\r\nglyphicon glyphicon-briefcase	\r\nglyphicon glyphicon-fullscreen	\r\nglyphicon glyphicon-dashboard	\r\nglyphicon glyphicon-paperclip	\r\nglyphicon glyphicon-heart-empty	\r\nglyphicon glyphicon-link	\r\nglyphicon glyphicon-phone	\r\nglyphicon glyphicon-pushpin	\r\nglyphicon glyphicon-usd	\r\nglyphicon glyphicon-gbp	\r\nglyphicon glyphicon-sort	\r\nglyphicon glyphicon-sort-by-alphabet	\r\nglyphicon glyphicon-sort-by-alphabet-alt	\r\nglyphicon glyphicon-sort-by-order	\r\nglyphicon glyphicon-sort-by-order-alt	\r\nglyphicon glyphicon-sort-by-attributes	\r\nglyphicon glyphicon-sort-by-attributes-alt	\r\nglyphicon glyphicon-unchecked	\r\nglyphicon glyphicon-expand	\r\nglyphicon glyphicon-collapse-down	\r\nglyphicon glyphicon-collapse-up	\r\nglyphicon glyphicon-log-in	\r\nglyphicon glyphicon-flash	\r\nglyphicon glyphicon-log-out	\r\nglyphicon glyphicon-new-window	\r\nglyphicon glyphicon-record	\r\nglyphicon glyphicon-save	\r\nglyphicon glyphicon-open	\r\nglyphicon glyphicon-saved	\r\nglyphicon glyphicon-import	\r\nglyphicon glyphicon-export	\r\nglyphicon glyphicon-send	\r\nglyphicon glyphicon-floppy-disk	\r\nglyphicon glyphicon-floppy-saved	\r\nglyphicon glyphicon-floppy-remove	\r\nglyphicon glyphicon-floppy-save	\r\nglyphicon glyphicon-floppy-open	\r\nglyphicon glyphicon-credit-card	\r\nglyphicon glyphicon-transfer	\r\nglyphicon glyphicon-cutlery	\r\nglyphicon glyphicon-header	\r\nglyphicon glyphicon-compressed	\r\nglyphicon glyphicon-earphone	\r\nglyphicon glyphicon-phone-alt	\r\nglyphicon glyphicon-tower	\r\nglyphicon glyphicon-stats	\r\nglyphicon glyphicon-sd-video	\r\nglyphicon glyphicon-hd-video	\r\nglyphicon glyphicon-subtitles	\r\nglyphicon glyphicon-sound-stereo	\r\nglyphicon glyphicon-sound-dolby	\r\nglyphicon glyphicon-sound-5-1	\r\nglyphicon glyphicon-sound-6-1	\r\nglyphicon glyphicon-sound-7-1	\r\nglyphicon glyphicon-copyright-mark	\r\nglyphicon glyphicon-registration-mark	\r\nglyphicon glyphicon-cloud-download	\r\nglyphicon glyphicon-cloud-upload	\r\nglyphicon glyphicon-tree-conifer	\r\nglyphicon glyphicon-tree-deciduous	\r\nglyphicon glyphicon-cd	\r\nglyphicon glyphicon-save-file	\r\nglyphicon glyphicon-open-file	\r\nglyphicon glyphicon-level-up	\r\nglyphicon glyphicon-copy	\r\nglyphicon glyphicon-paste	\r\nglyphicon glyphicon-alert	\r\nglyphicon glyphicon-equalizer	\r\nglyphicon glyphicon-king	\r\nglyphicon glyphicon-queen	\r\nglyphicon glyphicon-pawn	\r\nglyphicon glyphicon-bishop	\r\nglyphicon glyphicon-knight	\r\nglyphicon glyphicon-baby-formula	\r\nglyphicon glyphicon-tent	\r\nglyphicon glyphicon-blackboard	\r\nglyphicon glyphicon-bed	\r\nglyphicon glyphicon-apple	\r\nglyphicon glyphicon-erase	\r\nglyphicon glyphicon-hourglass	\r\nglyphicon glyphicon-lamp	\r\nglyphicon glyphicon-duplicate	\r\nglyphicon glyphicon-piggy-bank	\r\nglyphicon glyphicon-scissors	\r\nglyphicon glyphicon-bitcoin	\r\nglyphicon glyphicon-yen	\r\nglyphicon glyphicon-ruble	\r\nglyphicon glyphicon-scale	\r\nglyphicon glyphicon-ice-lolly	\r\nglyphicon glyphicon-ice-lolly-tasted	\r\nglyphicon glyphicon-education	\r\nglyphicon glyphicon-option-horizontal	\r\nglyphicon glyphicon-option-vertical	\r\nglyphicon glyphicon-menu-hamburger	\r\nglyphicon glyphicon-modal-window	\r\nglyphicon glyphicon-oil	\r\nglyphicon glyphicon-grain	\r\nglyphicon glyphicon-sunglasses	\r\nglyphicon glyphicon-text-size	\r\nglyphicon glyphicon-text-color	\r\nglyphicon glyphicon-text-background	\r\nglyphicon glyphicon-object-align-top	\r\nglyphicon glyphicon-object-align-bottom	\r\nglyphicon glyphicon-object-align-horizontal	\r\nglyphicon glyphicon-object-align-left	\r\nglyphicon glyphicon-object-align-vertical	\r\nglyphicon glyphicon-object-align-right	\r\nglyphicon glyphicon-triangle-right	\r\nglyphicon glyphicon-triangle-left	\r\nglyphicon glyphicon-triangle-bottom	\r\nglyphicon glyphicon-triangle-top	\r\nglyphicon glyphicon-console	\r\nglyphicon glyphicon-superscript	\r\nglyphicon glyphicon-subscript	\r\nglyphicon glyphicon-menu-left	\r\nglyphicon glyphicon-menu-right	\r\nglyphicon glyphicon-menu-down	\r\nglyphicon glyphicon-menu-up', 'Neeraj', '', '2024-03-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`Srno`),
  ADD KEY `Srno` (`Srno`),
  ADD KEY `Srno_2` (`Srno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Srno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `Srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
