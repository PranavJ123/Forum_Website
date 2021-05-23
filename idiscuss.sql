-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2021 at 06:12 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `idiscuss`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `created`) VALUES
(1, 'Python', 'Python is an interpreted high-level general-purpose programming language. Python\'s design philosophy emphasizes code readability with its notable use of significant indentation.', '2021-04-28 20:18:13'),
(2, 'JavaScript', 'JavaScript, often abbreviated as JS, is a programming language that conforms to the ECMAScript specification.', '2021-04-28 20:18:48'),
(3, 'Django', 'Django is a Python-based free and open-source web framework that follows the model-template-views architectural pattern. It is maintained by the Django Software Foundation, an American independent organization established as a 501 non-profit.', '2021-05-01 20:34:41'),
(4, 'Flask', 'This is another python framework.', '2021-05-01 20:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_content` text NOT NULL,
  `thread_id` int(11) NOT NULL,
  `comment_by` int(11) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_content`, `thread_id`, `comment_by`, `comment_time`) VALUES
(1, 'this is a first comment.', 1, 1, '2021-05-03 21:30:33'),
(2, 'rt', 1, 2, '2021-05-03 21:40:32'),
(3, 'somebody please fix my problem.', 1, 3, '2021-05-03 21:41:51'),
(4, 'As already mentioned:No Spam / Advertising / Self-promote in the forums is not allowed. Do not post copyright-infringing material. Do not post “offensive” posts, links or images.Do not cross post questions.Do not PM users asking for help.Remain respectful of other members at all times.', 1, 4, '2021-05-03 21:51:09'),
(5, 'Watch codewithharry tutorial its awesome you learn very quickly along with projects.', 11, 5, '2021-05-03 21:56:48'),
(6, 'nvjh', 4, 6, '2021-05-04 19:31:13'),
(7, 'Javascript first comment', 9, 7, '2021-05-04 19:32:56'),
(8, 'cknm', 1, 8, '2021-05-07 21:01:09'),
(9, 'klkc', 1, 9, '2021-05-07 21:01:16'),
(10, 'jfkjode', 1, 3, '2021-05-07 21:05:13'),
(11, 'yes', 12, 8, '2021-05-07 21:16:40'),
(12, 'mnbv', 19, 8, '2021-05-07 21:30:42'),
(13, 'hey Pranav I knw this is sad but search google for this error.', 22, 16, '2021-05-09 18:49:12'),
(14, '&lt;script&gt;alert(\"Hello\")&lt;/script&gt;', 22, 16, '2021-05-09 19:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `thread_id` int(11) NOT NULL,
  `thread_title` varchar(255) NOT NULL,
  `thread_desc` text NOT NULL,
  `thread_cat_id` int(8) NOT NULL,
  `thread_user_id` int(22) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`thread_id`, `thread_title`, `thread_desc`, `thread_cat_id`, `thread_user_id`, `timestamp`) VALUES
(1, 'Unable to install pyaudio', 'I am not able to install pyaudio on windows.', 1, 1, '2021-05-02 20:05:55'),
(4, 'Not able to use Python.', 'Please help me!!', 1, 2, '2021-05-02 20:27:56'),
(5, 'ytfu', 'koj', 1, 3, '2021-05-03 20:57:00'),
(8, 'klckl', 'jkhcl', 1, 4, '2021-05-03 20:59:37'),
(9, 'klc', 'ncln', 2, 5, '2021-05-03 21:00:22'),
(11, 'Want to learn Python from scratch.', 'Suggest me some tutorial for python.', 1, 6, '2021-05-03 21:07:47'),
(12, 'Import panda module', 'not able to import panda module', 1, 7, '2021-05-03 21:55:50'),
(13, 'kl', 'kljl;', 1, 8, '2021-05-07 20:13:19'),
(14, 'Buy fruits', 'yes', 1, 3, '2021-05-07 21:14:50'),
(18, 'hjokp', 'njk', 1, 8, '2021-05-07 21:29:04'),
(19, 'poiu', 'lkjh', 1, 8, '2021-05-07 21:30:27'),
(20, 'lho', 'jkhgioedo', 1, 16, '2021-05-09 18:29:39'),
(21, 'nkld', 'dipo', 1, 16, '2021-05-09 18:46:50'),
(22, 'jdkl', 'dh', 4, 16, '2021-05-09 18:47:10'),
(23, '&lt;script>alert(\"you are hacked in title\");&lt;/script>', '&lt;script>alert(\"you are hacked in title\");&lt;/script>', 2, 16, '2021-05-09 19:10:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` int(11) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `user_email`, `user_pass`, `timestamp`) VALUES
(1, 'this@this.com', '123', '2021-05-04 20:16:40'),
(2, 'bkj@gmm', '$2y$10$DGHFVDZ/QBHyhIlMZeowXO3b6sRdHK.oHTH2/q75UCUxV9tU908aa', '2021-05-04 20:30:25'),
(3, 'pranav@gmail.com', '$2y$10$9cNWLc1EGQb/FDdJWw3ghu0DLxiBqY8UdCnMT9W56m27TTaFjaN62', '2021-05-04 20:32:25'),
(4, 'poi@poi.com', '$2y$10$bb9cA3.JO88PZ./zktdgvuwEgTTkX5Juk9FJbcPN8LfKbG.I8cCyy', '2021-05-04 20:37:42'),
(5, 'qwe@qwe.com', '$2y$10$Mv.VhhpxSu/qv2fndhJsEuqUwkdAfUu/4wphANTiTAtDAp5A4/Gfe', '2021-05-04 20:40:06'),
(6, 'ghjkj@gmail.com', '$2y$10$xExTExVB2LXKi0W6p0qnPOz4vBvYBBTNFkyxlXtDUfi8g8J3p9Sei', '2021-05-05 19:16:18'),
(7, 'pranav@gmail1.com', '$2y$10$5VGGrS/nYL9Bdlhl2KCdpe4eCuh4qybKOXc/PIozysqT6S9vKq1qi', '2021-05-05 19:34:22'),
(8, 'p@p.com', '$2y$10$hIlHPcI1WIa78cV2D/fKe.GhbKT52FcYZ7Sap3DB6LCVXoiQ64rla', '2021-05-05 19:40:44'),
(9, 'q@q.com', '$2y$10$bU87yPHhYJRRztfYUOWiCOE2yQj5AGOv3LoOEstduByXijnYpAYgy', '2021-05-05 19:44:58'),
(10, 'a@a.com', '$2y$10$73yH2h6bHkWhAypn7QlTI.Y9b454GX2w6PIh7Vu7tiEqdPNUWxEY6', '2021-05-05 19:45:56'),
(11, 'i@i.com', '$2y$10$nBozxbqo8AGc5m93rMBwZecsggVYxGRuAwYrvtUwFA7UHXkGe5sOu', '2021-05-06 13:01:29'),
(12, 'z@z.com', '$2y$10$yZTtE3kdybTehdfe0mk/puuL6yqx5NYXKsgdy2Dgt.fKL6OFKpC4u', '2021-05-06 13:25:37'),
(13, 'o@o.com', '$2y$10$dhTR9sKwxPK7R4sy12OOv.5lnnTci1dEooafHgcwiTyebIBo2a2sK', '2021-05-06 13:40:30'),
(14, 's@s.com', '$2y$10$D4QyRqoUIKBu1btZ/vlhwuWRJqUgsCCciGyNlb2Y/cfAnk9Zy7hAS', '2021-05-06 13:46:53'),
(15, 'v@v.com', '$2y$10$XofSroMiO3HPYV1rxywL6eCdQS70QHRCrY8RlKDScaKPvwl8R8.MO', '2021-05-07 19:59:07'),
(16, 'pranav', '$2y$10$WoEW0ubZidnIWPoPss9PoeFNUXfpA/GTolI91tid6JK2SmTZrNkhW', '2021-05-09 18:28:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`thread_id`);
ALTER TABLE `threads` ADD FULLTEXT KEY `thread_title` (`thread_title`,`thread_desc`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
