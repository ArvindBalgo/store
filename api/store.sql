-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 29, 2020 at 06:49 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Textile', 'Industry textil qui aide les personnes à travailler sur les tapisseries et les grandes ligne de vêtements de Maurice', '2020-07-11 13:53:55', '2020-08-17 09:34:40'),
(2, 'Agro Category value', 'The best agro company of the world', '2020-07-11 13:53:55', '2020-08-20 12:01:44'),
(3, 'Kurt Bednar IV', 'Prof. Era Brakus', '2020-07-11 13:53:55', '2020-07-11 13:53:55'),
(4, 'Octavia O\'Kon', 'Brandon Bechtelar', '2020-07-11 13:53:59', '2020-07-11 13:53:59'),
(5, 'Gay Vandervort', 'Florencio Tromp', '2020-07-11 13:53:59', '2020-07-11 13:53:59'),
(6, 'Lelia Braun', 'Giovani Kiehn', '2020-07-11 13:53:59', '2020-07-11 13:53:59'),
(13, 'My new Category', 'Industry textil qui aide les personnes à travailler sur les tapisseries et les grandes ligne de vêtements de Maurice', '2020-08-29 06:39:10', '2020-08-29 06:39:10'),
(8, 'Textil2', 'Industry textil qui aide les personnes à travailler sur les tapisseries et les grandes ligne de vêtements de Maurice', '2020-08-04 13:32:42', '2020-08-04 13:32:42'),
(9, 'Textile', 'Industry textil qui aide les personnes à travailler sur les tapisseries et les grandes ligne de vêtements de Maurice', '2020-08-17 09:36:05', '2020-08-17 09:36:05'),
(14, 'My new Category', 'Industry textil qui aide les personnes à travailler sur les tapisseries et les grandes ligne de vêtements de Maurice', '2020-08-29 06:44:52', '2020-08-29 06:44:52'),
(12, 'My new Category', 'Industry textil qui aide les personnes à travailler sur les tapisseries et les grandes ligne de vêtements de Maurice', '2020-08-24 15:41:43', '2020-08-24 15:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2020_07_05_154244_store_migration', 1),
(8, '2020_08_15_061721_add_featured_place_store_table', 3),
(7, '2020_07_11_084528_add_table_category', 2),
(9, '2020_08_15_064145_add_subcategory_table', 4),
(10, '2020_08_15_083638_create_cars_table', 5),
(11, '2020_08_15_084335_create_users_table', 5),
(12, '2020_08_15_091011_add_users_fields', 6),
(13, '2020_08_15_091454_add_users_fields-2', 7),
(14, '2020_08_15_094146_add_relation_table_store_subcategory_relation_table', 8),
(15, '2020_08_15_114512_remove_field_store_id', 9),
(16, '2020_08_15_114528_remove_field_category_id', 9),
(17, '2020_08_15_114825_remove_field_category_id_2', 10),
(18, '2020_08_15_124707_rename_talbe_column_end_hour', 11),
(19, '2020_08_15_124855_rename_talbe_column_end_hour2', 12),
(20, '2020_08_15_125049_remove_field_category_id_3', 13);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainphoto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  `beginhour` decimal(8,2) NOT NULL,
  `closehour` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `description`, `email`, `phone`, `place`, `mainphoto`, `gallery`, `created_at`, `updated_at`, `featured`, `beginhour`, `closehour`) VALUES
(1, 'SoftValue changed', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-07-11 13:53:55', '2020-08-20 12:16:54', 1, '0.00', '0.00'),
(142, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 11:50:17', '2020-08-20 11:50:17', 1, '0.00', '5.00'),
(3, 'Dashawn Mohr', 'Prof. Gilberto Olson III', 'mraz.ethelyn@gmail.com', 'Ms. Lorna Berge', 'Retta Crooks', 'Dr. Ahmed Brekke', 'Mr. Graham Huel', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(4, 'Linwood Ritchie', 'Art Stanton', 'adele.nienow@tromp.com', 'Orval Dach', 'Kevon Hermann', 'Aurelio Hammes', 'Antoinette Flatley MD', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(5, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-07-11 13:53:55', '2020-08-04 13:26:43', 0, '0.00', '0.00'),
(143, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 12:17:08', '2020-08-20 12:17:08', 1, '0.00', '5.00'),
(7, 'Vivien Swaniawski', 'Neil Hoppe', 'dagmar30@roob.com', 'Joey Bogisich', 'Rhett Stiedemann Jr.', 'Nikko Dooley', 'Eloisa Parker', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(8, 'Ms. Alexa Stoltenberg', 'Diamond Adams', 'eve.stracke@yahoo.com', 'Elmira Hessel', 'Macey Terry', 'Ms. Julie Kuhic', 'Miles Haley I', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(9, 'Dr. Rey Powlowski DVM', 'Adrianna Heaney', 'ilarkin@cassin.com', 'Ms. Adela Goodwin Sr.', 'Layla O\'Keefe', 'Miss Blanche Predovic', 'Miss Alda Hansen', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(10, 'Miss Pearl Gorczany', 'Rubye Walter', 'natalie32@roberts.com', 'Henri Crist', 'Maximillia Hackett', 'Geovanni Dare', 'Dr. Reyes Carter DVM', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(11, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-07-11 13:53:55', '2020-08-17 09:34:16', 0, '0.00', '0.00'),
(12, 'Aylin Schmeler', 'Ward Hermiston', 'clemens.block@gusikowski.net', 'Mr. Wiley Hoppe', 'Camren Schaden I', 'Gudrun Hilpert', 'Kiley Borer', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(13, 'Bell Stroman', 'Dr. Chad Schamberger', 'orland.beahan@hotmail.com', 'Maureen Gleichner', 'Dr. Rylan Hoppe', 'Flo Pagac', 'Shana White DVM', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(14, 'Jade Rodriguez', 'Noe Graham', 'hudson.chris@sipes.biz', 'Aida Cummerata IV', 'Terrell Little', 'Liam Waters', 'Dr. Delilah Feeney Sr.', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(15, 'Dr. Hilton Pagac', 'Michele Kertzmann', 'vmckenzie@gmail.com', 'Walter Beier', 'Lee Prosacco Jr.', 'Karley Runolfsdottir', 'Clay Funk', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(16, 'Demetris Zieme', 'Dr. Doug Eichmann', 'thompson.dannie@spencer.com', 'Susan Mohr', 'Selena Schimmel IV', 'Henriette Grimes MD', 'Hobart Schuppe', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(17, 'Elvis King', 'Aileen Predovic', 'wharber@larkin.com', 'Maxine Wintheiser I', 'Moriah Walker', 'Ramon Grant', 'Ben Beer Jr.', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(18, 'Jamel Blanda', 'Mr. Edison Wilkinson', 'medhurst.aliza@yahoo.com', 'Mrs. Rosalinda Kulas', 'Mrs. Cheyanne Renner MD', 'Lindsay Walker Sr.', 'Mariane Eichmann', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(19, 'Lysanne Raynor', 'Enrique Reynolds', 'kozey.vergie@gmail.com', 'Karina Franecki', 'Myrtie Daugherty', 'Melissa Hudson', 'Vida Pollich', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(20, 'Ms. Lurline Bednar', 'Erin Johnston', 'anderson.moises@fisher.com', 'Mr. Jovan Gleichner', 'Mrs. Rachel King II', 'Lillie Robel', 'Karianne Blanda', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(21, 'Prof. Anabel Parker IV', 'Dr. Ashly Sanford MD', 'evangeline.shields@gmail.com', 'Tanya Hills', 'Mr. Khalid Walter', 'Preston Friesen', 'Bernice Reichel', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(22, 'Teagan Morissette', 'Dr. Korbin Simonis', 'edythe.weber@hotmail.com', 'Braxton Gutkowski', 'Geovany Yundt MD', 'Annetta Marvin', 'Nolan Borer', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(23, 'Raul Runte', 'Miss Bridie Goodwin', 'witting.fabiola@bogisich.biz', 'Stacey Pfeffer', 'Cassie Spencer', 'Josiane Feest', 'Selena Bechtelar', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(24, 'Haylee Koelpin', 'Dr. Elinor Paucek IV', 'bartell.ida@gmail.com', 'Abigail Rice Sr.', 'Virgie Rippin', 'Anahi Schamberger', 'Rosalee Huel MD', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(25, 'Prof. Cyrus Hills II', 'Alessia Braun', 'little.jillian@hotmail.com', 'Jaycee Farrell', 'Demarcus Crooks', 'Raegan McDermott', 'Dr. Pattie Lind DVM', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(26, 'Thalia Mante', 'Everett Pacocha DVM', 'alfonzo.schuster@kerluke.org', 'Jayden Hoppe', 'Raphaelle Reichert', 'Mr. Camron Stroman DDS', 'Dayna Bins Sr.', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(27, 'Zelda Rowe', 'Arne Howell', 'xstreich@upton.com', 'Mr. Murl Swaniawski II', 'Jabari Fay', 'Jamil Ruecker DVM', 'Lesley Dach', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(28, 'Dr. Hardy Flatley DVM', 'Ryder Bosco V', 'nnolan@hotmail.com', 'Gardner Kunde', 'Maurine Ondricka', 'Nyah Volkman', 'Malcolm Lubowitz', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(29, 'Marvin Hessel', 'Dr. Emie Shanahan Sr.', 'shanahan.jewel@kunze.com', 'Micah Farrell', 'Roxanne Abbott', 'Bridie Hackett', 'Mr. Holden Wunsch III', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(30, 'Steve Parker', 'Jamal Reichel', 'gerard.kshlerin@effertz.com', 'Jarrod Zboncak', 'Elyse Toy', 'Mr. Lonzo Raynor', 'Makenna Schulist', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(31, 'Monserrate Stiedemann', 'Mrs. Frida Aufderhar', 'gianni17@yahoo.com', 'Mackenzie Sporer', 'Antwon Fisher DDS', 'Dr. Audrey Bayer', 'Marcellus Wisozk Sr.', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(32, 'Prof. Herminia Ruecker', 'Prof. Martina Kiehn', 'sweissnat@carter.com', 'Velma Renner', 'Georgette Kuhn', 'Mac Weimann', 'Darron Harris II', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(33, 'Reyna Lubowitz', 'Tito Hagenes DDS', 'hstreich@beier.biz', 'Dr. Nella Cole', 'Raina Collier', 'Nicole Gusikowski PhD', 'Toby Kilback', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(34, 'Heath Pouros', 'Ara Dibbert', 'nelle41@gmail.com', 'Miss Aurelie Gulgowski II', 'Mr. Rey Mills I', 'Miss Marlene Hartmann PhD', 'Prof. Candace Dickens DDS', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(35, 'Ada Schoen', 'Bobby Bogan', 'nelle.beatty@price.com', 'Vinnie Veum V', 'Elmer McGlynn I', 'Preston Rohan I', 'Annetta Sporer', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(36, 'Lilliana Wolff', 'Sadye Kihn Sr.', 'stoltenberg.remington@hotmail.com', 'Prof. Paolo Schmidt III', 'Kasey Ferry', 'Oren Wisozk', 'Oswald Grimes', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(37, 'Prof. Kayley Legros V', 'Dr. Casimer Corwin IV', 'wquitzon@wilkinson.biz', 'Marcelle Cummerata', 'Cortez Brown DVM', 'Junior Hermiston', 'Elyssa Stark', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(38, 'Holly Sauer', 'Prof. Enrique Volkman', 'ike65@herman.org', 'Prof. Boyd Kihn', 'Delfina West Sr.', 'Josh Russel Sr.', 'Prof. Cicero Bauch', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(39, 'Kathlyn Bechtelar', 'Bernita Bashirian', 'ryan.zachery@hotmail.com', 'Prof. Esperanza Orn', 'Mrs. Gabrielle Streich DDS', 'Elenora Bosco', 'Kolby Lang', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(40, 'Zane Wintheiser', 'Kurtis Prosacco', 'oconner.linnea@larkin.net', 'Jaylon Bartoletti', 'Ayla Prohaska V', 'Prof. Maryam Boyer III', 'Miss Glenda Abshire V', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(41, 'Modesto Hettinger Sr.', 'Aleen Klocko Sr.', 'kasey.wisoky@yahoo.com', 'Mrs. Era Watsica I', 'Ayla Reinger', 'Kailey Hickle', 'Mr. Loyal Raynor V', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(42, 'Elinor Tillman', 'Molly Thompson', 'christiansen.geovanny@runolfsdottir.com', 'Laney Schiller', 'Kieran Rodriguez', 'Francisco Doyle', 'Ms. Delia Gutkowski MD', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(43, 'Helga Parker', 'Ila Blanda', 'koch.monserrate@west.com', 'Dr. Chandler Nikolaus', 'Doug Altenwerth', 'Alayna Crona', 'Dr. Wade Simonis', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(44, 'Max Macejkovic', 'Sister Hauck', 'carter.tod@yahoo.com', 'Mr. Adolph Oberbrunner', 'Ernest Lubowitz', 'Dusty Howe', 'Devin O\'Kon I', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(45, 'Miss Rosemary Ledner', 'Kathryne Bashirian', 'makenna83@yahoo.com', 'Mr. Murphy Kerluke PhD', 'Adrien Gaylord', 'Ursula Donnelly', 'Miss Orpha Bartoletti', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(46, 'Herminio Strosin I', 'Josie Will', 'roob.kaci@farrell.com', 'Mrs. Suzanne Murazik PhD', 'Mr. Ethan Ziemann', 'Jadyn Sawayn', 'Marilou West DDS', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(47, 'Eladio Kuvalis', 'Mr. Tristin Armstrong MD', 'schaefer.tony@hotmail.com', 'Miss Alysson Medhurst II', 'Jarrett Dibbert I', 'Trevion Lakin V', 'Shemar Bashirian', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(48, 'Mrs. Germaine Dare', 'Hosea Bauch', 'vanessa.johnston@hotmail.com', 'Elisabeth Konopelski', 'Guillermo Willms', 'Mireille Gleichner', 'Mrs. Leora Johnston Jr.', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(49, 'Mrs. Zoe Flatley Sr.', 'Kathryn Jacobs III', 'pierre.prosacco@gmail.com', 'Julian Pfannerstill', 'Stacy O\'Keefe MD', 'Mr. Wilber Zulauf PhD', 'Vern Parisian', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(50, 'Christ Barton', 'Gerard Fay', 'luis38@hotmail.com', 'Monte Smitham', 'Dr. Leonor Sipes III', 'Keara Rice', 'Jimmie Parisian', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(51, 'Mrs. Ozella Abbott IV', 'Jeramie Halvorson', 'uflatley@gmail.com', 'Prof. Enrique Labadie', 'Dr. Glennie Murray', 'Kayden Bradtke DDS', 'Bill Torphy', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(52, 'Mrs. Fabiola Conroy II', 'Krista Conroy', 'maggie.rohan@hotmail.com', 'Prof. Cecilia Reichert', 'Leslie Hahn', 'Marianne Streich', 'Gilbert Sanford', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(53, 'Mr. Cameron Kozey', 'Randall Lemke Sr.', 'imelda.buckridge@yahoo.com', 'Andres Bednar', 'Rebecca O\'Connell', 'Prof. Jamison Murray', 'Sophia Considine', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(54, 'Dr. Cheyanne Howe V', 'Miss Cali Glover', 'fconn@gmail.com', 'Mable Torp', 'Adalberto Rogahn', 'Leatha Kris', 'Paolo Kovacek', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(55, 'Kendra Smitham', 'Prof. Sanford Skiles', 'wheller@stoltenberg.info', 'Miss Pat VonRueden', 'Dr. Megane Wuckert Jr.', 'Frederik Auer', 'Elroy Watsica', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(56, 'Prof. Joana Price', 'Mr. Gerard Mante PhD', 'santa47@rutherford.org', 'Dr. Ivory Mohr Sr.', 'Maci Hoppe', 'Makayla Frami', 'Rebecca Johnson', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(57, 'Kaela Ortiz', 'Felicity Macejkovic', 'romaguera.eileen@gmail.com', 'Miss Valentina Aufderhar', 'Prof. Jamar Lockman Jr.', 'Ms. Emilie Robel II', 'Keaton Beier', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(58, 'Ms. Tara Goldner Sr.', 'Loyce Bergnaum', 'reyna.moore@bogisich.com', 'Stephan Spencer', 'Luna Roberts', 'Miss Kattie Ankunding', 'Arnoldo Padberg', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(59, 'Mrs. Mckayla Feest', 'Ava Ernser', 'betsy.toy@gmail.com', 'Christiana Pagac', 'Vita O\'Connell', 'Dr. Elva Durgan', 'Dr. Michel Wolf DDS', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(60, 'Mr. Brenden Bogisich Sr.', 'Grayson Schimmel', 'ansel88@hotmail.com', 'Dr. Vance Murphy', 'Dr. Mac Roberts', 'Citlalli Bechtelar', 'Kelly Mayert', '2020-07-11 13:53:55', '2020-07-11 13:53:55', 0, '0.00', '0.00'),
(61, 'Avery Dickens', 'Sheila Lueilwitz Sr.', 'sofia.king@hotmail.com', 'Angela Cruickshank', 'Tyreek Connelly IV', 'Miss Aditya Halvorson', 'Geoffrey Gleason', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(62, 'Prof. Louvenia Streich', 'Mrs. Nya Dicki Jr.', 'oswaldo94@gmail.com', 'Kasey Frami', 'Austin Veum', 'Dr. Natalia Wuckert Jr.', 'Marge Oberbrunner', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(63, 'Abdiel Conn DDS', 'Kip Fadel DVM', 'rasheed.windler@hotmail.com', 'August Boyer II', 'Miss Destany Berge', 'Fatima Eichmann', 'Ms. Lily Raynor IV', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(64, 'Ayden Conn', 'Berenice Stracke', 'theller@gmail.com', 'Vickie Effertz MD', 'Prof. Greg Schiller II', 'Milford Rau', 'Maymie Torphy', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(65, 'Cortez O\'Hara', 'Toy Gibson', 'modesta41@hotmail.com', 'Mrs. Janelle Conn', 'Heaven Streich IV', 'Theresa Bauch Jr.', 'Damien Connelly', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(66, 'Ms. Winnifred Doyle', 'Corine Crona', 'otis86@gmail.com', 'Dr. Pierre Howell DDS', 'Dr. Hilton Boyer', 'Neva Gottlieb', 'Janae Goodwin', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(67, 'Zelma O\'Connell', 'Mr. Jimmie Kertzmann', 'vincenza.johnston@lubowitz.com', 'Devin Schultz', 'Ned Prosacco', 'Prof. Luisa Hodkiewicz Sr.', 'Waldo Ratke', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(68, 'Novella Hirthe', 'Prof. Jerel Bednar', 'wkirlin@hotmail.com', 'Dorris Marvin', 'Connor Lebsack PhD', 'Webster Kuhn', 'Georgianna Steuber PhD', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(69, 'Jaylon Osinski', 'Dr. Zander McClure II', 'schmitt.christopher@gmail.com', 'Camren Balistreri II', 'Ms. Shea Turner PhD', 'Dalton Willms V', 'Mr. Isaias Dickens V', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(70, 'Cassandra Glover', 'Tavares Sanford I', 'ella40@gmail.com', 'Prof. Delilah Hartmann PhD', 'Prof. Kody McGlynn II', 'Dr. Marjory Wiegand IV', 'Narciso Jacobi', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(71, 'Misty Bechtelar', 'Dr. Darlene Pfannerstill V', 'clara05@hotmail.com', 'Amelie Flatley', 'Kristy Dickinson Sr.', 'Miss Zula Gusikowski', 'Mrs. Petra Larkin I', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(72, 'Kenyon McKenzie II', 'Lavada Terry', 'ywolff@hotmail.com', 'Dr. Berenice Bradtke', 'Stone Larson', 'Jacquelyn Bashirian', 'Eleazar O\'Keefe Jr.', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(73, 'Cecil Lakin', 'Melyna Kemmer', 'dulce.torphy@wiegand.com', 'Rosalinda Hoppe', 'Lenna Jakubowski', 'Fritz Jacobson', 'Vivien Altenwerth', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(74, 'Helene Bechtelar', 'Ryder Corwin', 'laurence.mccullough@cruickshank.com', 'Aliya Sauer', 'Dr. Lizeth Schiller', 'Ms. Theodora Kirlin', 'Oran Kuvalis III', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(75, 'Ned White', 'Maia VonRueden IV', 'zulauf.darrell@gmail.com', 'Miss Maria Labadie', 'Mr. Holden Spinka II', 'Cody Luettgen', 'Ilene Reinger', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(76, 'Prof. June Erdman', 'Evelyn Mueller', 'jjohns@hotmail.com', 'Dr. Russel Heathcote', 'Joelle Harber', 'Allen West', 'Miss Ashleigh Fahey', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(77, 'Miss Sasha Ledner', 'Loyce Rohan MD', 'murazik.emmanuel@gmail.com', 'Mrs. Mireille DuBuque II', 'Salma Kuvalis', 'Alberto Morissette', 'Wilburn Kerluke V', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(78, 'Reynold Mante I', 'Shanelle Homenick', 'kbecker@gmail.com', 'Joe Gottlieb', 'Mrs. Shakira Kiehn DVM', 'Jan Bins', 'Alta West', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(79, 'Prof. Lynn Heidenreich Sr.', 'Johann Kling', 'ankunding.roger@fay.com', 'Ayden Schowalter', 'Dr. Telly Kuhic I', 'Mr. Mackenzie Weimann MD', 'Berenice Zieme', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(80, 'Antwan Bosco DDS', 'Violette Fadel', 'ffadel@gmail.com', 'Prof. Blair Rowe', 'Martina Kovacek DVM', 'Prof. Russel Stoltenberg V', 'Mrs. Audie Thompson', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(81, 'Reese Fisher', 'Dante Purdy', 'amara55@davis.com', 'Amina Stoltenberg', 'Kelsi Stehr', 'Davon Heathcote', 'Hope Brown', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(82, 'Toby Dickens', 'Prof. Tessie Conroy IV', 'qwyman@yahoo.com', 'Dion Robel', 'Diana Dach', 'Jolie Rogahn', 'Cara Ondricka', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(83, 'Dr. Quinn Ledner DDS', 'Daija Sauer', 'walker.corrine@gmail.com', 'Isac Lesch IV', 'Ransom Carter PhD', 'Mr. Mathias Jast', 'Julie DuBuque', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(84, 'Brando Shanahan', 'Myrna Denesik', 'ckuphal@yahoo.com', 'Dr. Laney DuBuque DDS', 'Damion Zemlak', 'Miss Demetris Greenholt DVM', 'Jamal Hettinger', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(85, 'Prof. Selmer Muller DVM', 'Alaina Homenick', 'dicki.luther@schaden.com', 'Bradley Glover', 'Korbin Renner', 'Maxime Tromp Jr.', 'Jennings Osinski', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(86, 'Janiya Runte III', 'Michele Wintheiser Sr.', 'pfannerstill.ilene@gmail.com', 'Ms. Nadia Hermiston', 'Lurline Smith', 'Mr. Brock Cremin', 'Dr. Eliza Dickens', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(87, 'Hannah Jenkins', 'Tommie McKenzie II', 'harber.edna@hotmail.com', 'Esta Baumbach', 'Ms. Jenifer Wunsch Jr.', 'Kaley Turcotte', 'Braeden Kozey', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(88, 'Victor Torphy', 'Ms. Reba Cartwright', 'vtrantow@lowe.com', 'Prof. Gerda Spinka', 'Gerard Dickinson V', 'Ludwig Spinka IV', 'Ike Lind', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(89, 'Karina Hills', 'Pearlie Littel Sr.', 'keyon.stoltenberg@hand.org', 'Prof. Brennon Parker', 'Glennie Grady', 'Dr. Bell Carter I', 'Dr. Khalid Rau', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(90, 'Prof. Eulah Corwin', 'Keenan Lebsack', 'kaya.jacobson@hotmail.com', 'Zackery Langworth', 'Dr. Meggie Stamm', 'Mr. Rashad Schuppe PhD', 'Noah Walker', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(91, 'Jude Bergnaum Sr.', 'Felipa Wilkinson', 'umante@swaniawski.net', 'Jerel Barrows', 'Adonis Koss', 'Autumn Brekke', 'Miss Rosalinda Mills', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(92, 'Jaclyn Lockman', 'Reva Parisian', 'zack36@leannon.org', 'Mrs. Selina Monahan', 'Santiago Swift', 'Bradley Mraz', 'German Doyle DVM', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(93, 'Ms. Kaitlyn Fadel MD', 'Mr. Jamir Mann', 'jarret.pollich@hill.com', 'Joshuah Schmidt DVM', 'Brannon Gottlieb', 'Jalyn Veum', 'Dr. Darien Beahan', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(94, 'Kiara Ryan', 'Hilda Hill', 'mccullough.imelda@altenwerth.net', 'Liana Wiegand', 'Pearlie Rutherford', 'Dr. Cynthia Stokes Jr.', 'Alverta Runolfsdottir DVM', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(95, 'Estefania Mann', 'Mr. Stone Cormier', 'muller.benton@yahoo.com', 'Felipa Daugherty', 'Mr. Garrick Morissette Sr.', 'Emelie Cummings', 'Mrs. Mylene Wilkinson', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(96, 'Dr. Nasir Cremin II', 'Alyson Okuneva DDS', 'tmonahan@gmail.com', 'Dr. Ara Abernathy III', 'Jessie White PhD', 'Mrs. Estelle Beahan', 'Dr. Electa Frami', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(97, 'Ashton Stark', 'Barrett Hauck', 'zboyle@gmail.com', 'Miss Donna Beer MD', 'Shayna Olson', 'Katlyn Thompson', 'Liam Cartwright DVM', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(98, 'Miss Simone Sanford', 'Mr. Owen Jacobi Sr.', 'alyson30@yahoo.com', 'Otha Considine', 'Miss Erica Abshire Jr.', 'Hadley Larson', 'Wilmer O\'Reilly', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(99, 'Dr. Joesph Rippin', 'Mae Lynch', 'boyer.lawrence@yahoo.com', 'Shane Corkery PhD', 'Wava Gusikowski', 'Mr. Antwan Littel', 'Idell Rosenbaum', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(100, 'Kristy Rutherford V', 'Beth Kling', 'domenica.hoppe@heathcote.com', 'Maurice Pfannerstill PhD', 'Osbaldo Ortiz IV', 'Dr. Erica Kuhic', 'Lola Stoltenberg', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(101, 'Mr. Norval Willms MD', 'Joey O\'Kon', 'oconner.sydnie@yahoo.com', 'Colin Krajcik', 'Prof. Lue Turcotte', 'Corrine Satterfield', 'Kiara Quitzon', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(102, 'Dr. Roxanne Tillman', 'Marjolaine Bashirian', 'ahammes@gmail.com', 'Hazel Williamson', 'Breana Mueller', 'Reyna Zulauf', 'Mrs. Delfina Padberg', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(103, 'Mr. Adolph Marvin MD', 'Imani Cummings', 'rlegros@langosh.com', 'Janis Ebert', 'Jaycee Leffler', 'Dr. Lupe Barrows PhD', 'Darrin McKenzie', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(104, 'Melyssa Bradtke III', 'Lydia Hoppe', 'nprohaska@harber.com', 'Vena Morar I', 'Deangelo Reilly', 'Oscar Bode', 'Miss Katherine Franecki', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(105, 'Chad Kreiger', 'Lawrence Goyette', 'bjohnson@bergstrom.com', 'Dale Terry', 'Dr. Andres Adams', 'Annalise Tromp', 'Prof. Stan McKenzie', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(106, 'Waylon Predovic', 'Cortez Hilpert', 'von.hayden@hotmail.com', 'Marjory Stracke', 'Kavon Stroman', 'Mr. Watson Koepp', 'Deion Marks', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(107, 'Jayson Swaniawski MD', 'Maybell Kling', 'ellen.reilly@gmail.com', 'Elmo Emard', 'Benjamin Haag', 'Ebony Witting', 'Bell Herman', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(108, 'Mr. Oswaldo Wiegand III', 'Iliana Ullrich', 'hhane@hotmail.com', 'Jaleel Bechtelar', 'Prof. Ryleigh Leffler', 'Dr. Jayce Braun', 'Mrs. Mariane Pfeffer', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(109, 'Laron Deckow', 'Ashtyn Stracke III', 'rmohr@hackett.org', 'General McCullough', 'Dr. Herminia Abbott', 'Deanna Breitenberg I', 'Lourdes Rippin', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(110, 'Shania Heidenreich', 'Abe Renner', 'wfeeney@bashirian.com', 'Ms. Mariam Jacobi IV', 'Mrs. Rosa Dibbert III', 'Yazmin Hansen', 'Prof. Leonardo Cronin', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(111, 'Prof. Tevin Swaniawski', 'Kane Heidenreich', 'shamill@monahan.info', 'Clement Walker III', 'Madelyn Oberbrunner', 'Prof. Obie Schuppe MD', 'Joesph Hansen', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(112, 'Kristoffer Kovacek DVM', 'Adalberto Kassulke', 'gustave.denesik@nicolas.com', 'Suzanne Senger', 'Mack Lueilwitz', 'Earl Murazik', 'Jerry Koss', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(113, 'Broderick Schiller', 'Florian Maggio', 'hertha71@yahoo.com', 'Lurline Pollich', 'Afton Reichel', 'Ms. Vilma Bartell Jr.', 'Mrs. Valentine Breitenberg IV', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(114, 'Izaiah Ritchie', 'Lloyd Barrows', 'baumbach.elsie@yahoo.com', 'Cristobal Stanton', 'Willie Thompson', 'Dr. Michale Lakin V', 'Mr. Christian Klocko V', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(115, 'Justus Bailey', 'Fermin Bergnaum', 'dudley21@kling.com', 'Dr. Tara Hettinger', 'Gilbert Wolff Jr.', 'Heloise Huel DDS', 'Travis Casper', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(116, 'Miss Sonia Collins MD', 'Mr. Humberto Blanda', 'xprosacco@hotmail.com', 'Prof. Griffin Breitenberg', 'Prof. Ida Lindgren MD', 'Cordelia Wunsch Sr.', 'Alta Turner', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(117, 'Juliana Waters', 'Gaylord Langworth', 'ylarkin@goyette.com', 'Juwan Cummerata DVM', 'Jerry Marvin', 'Ms. Francisca Powlowski III', 'Fatima Dare', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(118, 'Kitty Gorczany', 'Prof. Clemmie Lebsack', 'lesch.neha@yahoo.com', 'Jasper Wolff', 'Rasheed Robel', 'Kaia Hermiston', 'Sydnie Bartell Jr.', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(119, 'Assunta Collins', 'Mr. Wilfrid Harvey', 'foconner@kuphal.com', 'Prof. Filiberto Jaskolski V', 'Avis Kling DVM', 'Kody Keebler', 'Dr. Brian Stehr V', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(120, 'Randall Mayer Jr.', 'Bernard Krajcik', 'alana28@gmail.com', 'Frederique Skiles III', 'Mr. Jaden Johnston IV', 'Serenity Hamill', 'Nedra Schowalter', '2020-07-11 13:53:59', '2020-07-11 13:53:59', 0, '0.00', '0.00'),
(121, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 12:53:14', '2020-08-15 12:53:14', 1, '0.00', '5.00'),
(122, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 12:53:45', '2020-08-15 12:53:45', 1, '0.00', '5.00'),
(123, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 12:55:39', '2020-08-15 12:55:39', 1, '0.00', '5.00'),
(124, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 12:56:48', '2020-08-15 12:56:48', 1, '0.00', '5.00'),
(125, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 13:06:03', '2020-08-15 13:06:03', 1, '0.00', '5.00'),
(126, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 13:06:09', '2020-08-15 13:06:09', 1, '0.00', '5.00'),
(127, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 13:07:30', '2020-08-15 13:07:30', 1, '0.00', '5.00'),
(128, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 13:08:11', '2020-08-15 13:08:11', 1, '0.00', '5.00'),
(129, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 13:08:22', '2020-08-15 13:08:22', 1, '0.00', '5.00'),
(130, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 13:37:12', '2020-08-15 13:37:12', 1, '0.00', '5.00'),
(131, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-15 13:37:14', '2020-08-15 13:37:14', 1, '0.00', '5.00'),
(132, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-17 09:29:02', '2020-08-17 09:29:02', 1, '0.00', '5.00'),
(133, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-17 09:33:10', '2020-08-17 09:33:10', 1, '0.00', '5.00'),
(134, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 09:59:48', '2020-08-20 09:59:48', 1, '0.00', '5.00'),
(135, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 10:28:37', '2020-08-20 10:28:37', 1, '0.00', '5.00'),
(136, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 10:28:45', '2020-08-20 10:28:45', 1, '0.00', '5.00'),
(137, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 10:28:50', '2020-08-20 10:28:50', 1, '0.00', '5.00'),
(138, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 10:30:28', '2020-08-20 10:30:28', 1, '0.00', '5.00'),
(139, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 10:30:46', '2020-08-20 10:30:46', 1, '0.00', '5.00'),
(140, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 10:30:58', '2020-08-20 10:30:58', 1, '0.00', '5.00'),
(141, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-20 11:40:02', '2020-08-20 11:40:02', 1, '0.00', '5.00'),
(144, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-24 15:34:34', '2020-08-24 15:34:34', 1, '0.00', '5.00'),
(145, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-29 06:40:28', '2020-08-29 06:40:28', 1, '0.00', '5.00'),
(146, 'SoftValue', 'It is a great company', 'roreilly@gmail.com', '8965129841', 'Mauritius', 'softvalue.png', 'gallery', '2020-08-29 06:45:31', '2020-08-29 06:45:31', 1, '0.00', '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `store_subcategory`
--

DROP TABLE IF EXISTS `store_subcategory`;
CREATE TABLE IF NOT EXISTS `store_subcategory` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_subcategory_store_id_foreign` (`store_id`),
  KEY `store_subcategory_subcategory_id_foreign` (`subcategory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_subcategory`
--

INSERT INTO `store_subcategory` (`id`, `created_at`, `updated_at`, `store_id`, `subcategory_id`) VALUES
(1, NULL, NULL, 126, 2),
(2, NULL, NULL, 127, 2),
(3, NULL, NULL, 128, 2),
(4, NULL, NULL, 129, 5),
(5, NULL, NULL, 129, 4),
(6, NULL, NULL, 130, 3),
(7, NULL, NULL, 126, 1),
(8, NULL, NULL, 132, 1),
(9, NULL, NULL, 133, 2),
(10, NULL, NULL, 134, 2),
(34, NULL, NULL, 142, 1),
(19, NULL, NULL, 135, 1),
(20, NULL, NULL, 135, 2),
(21, NULL, NULL, 136, 1),
(22, NULL, NULL, 137, 2),
(23, NULL, NULL, 138, 2),
(24, NULL, NULL, 139, 2),
(25, NULL, NULL, 140, 1),
(26, NULL, NULL, 140, 2),
(27, NULL, NULL, 141, 1),
(28, NULL, NULL, 141, 2),
(75, NULL, NULL, 1, 2),
(74, NULL, NULL, 1, 1),
(35, NULL, NULL, 142, 2),
(66, NULL, NULL, 143, 1),
(67, NULL, NULL, 143, 2),
(70, NULL, NULL, 144, 1),
(71, NULL, NULL, 144, 2),
(72, NULL, NULL, 145, 1),
(73, NULL, NULL, 145, 2),
(76, NULL, NULL, 146, 1),
(77, NULL, NULL, 146, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategory_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `created_at`, `updated_at`, `name`, `category_id`) VALUES
(1, '2020-08-15 12:00:27', '2020-08-20 11:58:05', 'Boissons', 1),
(2, '2020-08-15 12:00:51', '2020-08-15 12:00:51', 'Fromage', 2),
(3, '2020-08-15 13:34:40', '2020-08-15 13:34:40', 'Marchandise', 1),
(4, '2020-08-15 13:34:46', '2020-08-15 13:34:46', 'General', 1),
(5, '2020-08-15 13:34:52', '2020-08-15 13:34:52', 'Boissons', 1),
(6, '2020-08-17 09:29:10', '2020-08-17 09:29:10', 'Boissons', 1),
(8, '2020-08-20 11:58:35', '2020-08-20 11:58:35', 'new sub', 1),
(9, '2020-08-29 06:37:45', '2020-08-29 06:37:45', 'new sub', 1),
(10, '2020-08-29 06:44:10', '2020-08-29 06:44:10', 'new sub', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `name`, `password`, `login`) VALUES
(3, '2020-08-15 09:11:43', '2020-08-29 06:43:07', 'user name', 'aueiae', 'testlogin'),
(4, '2020-08-15 09:12:38', '2020-08-15 09:12:38', '', '', ''),
(7, '2020-08-15 09:29:53', '2020-08-15 09:29:53', 'test', 'test', 'logchanged'),
(8, '2020-08-15 09:30:19', '2020-08-15 09:30:19', 'test', 'test', 'logchanged'),
(9, '2020-08-15 09:30:26', '2020-08-15 09:30:26', 'test', 'test', 'logchanged'),
(10, '2020-08-15 09:30:27', '2020-08-15 09:30:27', 'test', 'test', 'logchanged'),
(18, '2020-08-29 06:43:19', '2020-08-29 06:43:19', 'Jean Marc', '1234', 'jeanmarc'),
(16, '2020-08-20 11:59:08', '2020-08-20 11:59:08', 'Jean Marc', '1234', 'jeanmarc'),
(11, '2020-08-15 13:02:48', '2020-08-15 13:02:48', 'BETOMBO', '1234', 'betombo'),
(12, '2020-08-15 13:02:52', '2020-08-15 13:02:52', 'BETOMBO', '1234', 'betombo'),
(13, '2020-08-15 13:02:53', '2020-08-15 13:02:53', 'BETOMBO', '1234', 'betombo'),
(14, '2020-08-17 09:29:06', '2020-08-17 09:29:06', 'BETOMBO', '1234', 'betombo'),
(15, '2020-08-20 09:59:52', '2020-08-20 09:59:52', 'BETOMBO', '1234', 'betombo');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
