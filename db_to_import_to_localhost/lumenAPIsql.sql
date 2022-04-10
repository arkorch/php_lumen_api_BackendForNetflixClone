-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2022 at 10:24 PM
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netflix`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Sci-Fi'),
(2, 'Action'),
(3, 'Horror'),
(4, 'Comedy');

-- --------------------------------------------------------

--
-- Table structure for table `category_movie`
--

CREATE TABLE `category_movie` (
  `genre_movie` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_movie`
--

INSERT INTO `category_movie` (`genre_movie`, `category_id`, `movie_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 4, 3),
(4, 2, 4),
(5, 1, 5),
(6, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`) VALUES
(1, 'Canada', 'CA'),
(2, 'United States', 'US'),
(3, 'Colombia', 'CO');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Rock'),
(2, 'Classical'),
(3, 'Pop'),
(4, 'Punk Rock'),
(5, 'Hip-hop'),
(6, 'Country');

-- --------------------------------------------------------

--
-- Table structure for table `genre_song`
--

CREATE TABLE `genre_song` (
  `genre_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre_song`
--

INSERT INTO `genre_song` (`genre_id`, `song_id`) VALUES
(5, 1),
(4, 1),
(3, 2),
(3, 3),
(1, 32),
(3, 32);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `movies_cover` varchar(75) NOT NULL DEFAULT 'cover_default.jpg',
  `movies_title` varchar(125) NOT NULL,
  `movies_year` varchar(5) NOT NULL,
  `movies_runtime` varchar(25) NOT NULL,
  `movies_storyline` text NOT NULL,
  `movies_trailer` varchar(75) NOT NULL DEFAULT 'trailer_default.jpg',
  `movies_release` varchar(125) NOT NULL,
  `county_id` int(11) NOT NULL DEFAULT 1,
  `rating` varchar(10) NOT NULL DEFAULT 'kids'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `movies_cover`, `movies_title`, `movies_year`, `movies_runtime`, `movies_storyline`, `movies_trailer`, `movies_release`, `county_id`, `rating`) VALUES
(1, 'guardians2.jpg', 'Guardians of the Galaxy Vol. 2', '2017', '2h 16m', 'The Guardians must fight to keep their newfound family together as they unravel the mystery of Peter Quill&rsquo;s true parentage.', 'Guardians2.mp4', 'May 5, 2017', 1, 'adult'),
(2, 'dunkirk.jpg', 'Dunkirk', '2017', '1h 46m', 'Allied soldiers from Belgium, the British Empire and France are surrounded by the German army and evacuated during a fierce battle in World War II.', 'Dunkirk.mp4', 'July 21, 2017', 3, 'kids'),
(3, 'logan.jpg', 'Logan', '2017', '2h 17m', 'In the near future, a weary Logan cares for an ailing Professor X, somewhere on the Mexican border. However, Logan&rsquo;s attempts to hide from the world, and his legacy, are upended when a young mutant arrives, pursued by dark forces.', 'Logan.mp4', 'March 3,2017', 2, 'adult'),
(4, 'okja.jpg', 'Okja', '2017', '2h', ' Meet Mija, a young girl who risks everything to prevent a powerful, multi-national company from kidnapping her best friend - a fascinating animal named Okja. ', 'Okja.mp4', 'June 28,2017', 1, 'kids'),
(5, 'beauty.jpg', 'Beauty and the Beast', '2017', '2h 9min', 'An adaptation of the fairy tale about a monstrous-looking prince and a young woman who fall in love. ', 'Beauty.mp4', 'March 17, 2017', 3, 'adult'),
(6, 'hacksaw.jpg', 'Hacksaw Ridge', '2016', '2h 19m', 'WWII American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people, and becomes the first man in American history to receive the Medal of Honor without firing a shot.', 'Hacksaw.mp4', 'November 4, 2016', 2, 'adult'),
(7, 'deadpool.jpg', 'Deadpool', '2016', '1h 48m', 'A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.', 'Deadpool.mp4', 'Febuary 12, 2016', 1, 'kids'),
(8, 'arrival.jpg', 'Arrival', '2016', '1h 56m', 'When twelve mysterious spacecraft appear around the world, linguistics professor Louise Banks is tasked with interpreting the language of the apparent alien visitors.', 'Arrival.mp4', 'November 11, 2016', 1, 'kids'),
(9, 'eddie.jpg', 'Eddie the Eagle', '2016', '1h 46m', 'The story of Eddie Edwards, the notoriously tenacious British underdog ski jumper who charmed the world at the 1988 Winter Olympics.', 'Eddie.mp4', 'Febuary 26, 2016', 1, 'kids'),
(10, 'trolls.jpg', 'Trolls', '2016', '1h 32m', 'After the Bergens invade Troll Village, Poppy, the happiest Troll ever born, and the curmudgeonly Branch set off on a journey to rescue her friends.', 'Trolls.mp4', 'November 4, 2016', 1, 'adult'),
(11, 'revenant.jpg', 'The Revenant', '2015', '2h 36m', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 'Revenant.mp4', 'January 8, 2015', 1, 'kids'),
(12, 'brooklyn.jpg', 'Brooklyn', '2015', '1h 57m', 'An Irish immigrant lands in 1950s Brooklyn, where she quickly falls into a romance with a local. When her past catches up with her, however, she must choose between two countries and the lives that exist within.', 'Brooklyn.mp4', 'November 25, 2015', 1, 'kids'),
(13, 'walk.jpg', 'The Walk', '2015', '2h 3m', 'In 1974, high-wire artist Philippe Petit recruits a team of people to help him realize his dream: to walk the immense void between the World Trade Center towers.', 'Walk.mp4', 'October 9, 2015', 1, 'adult'),
(14, 'colonia.jpg', 'Colonia', '2015', '1h 46m', 'A young woman&rsquo;s desperate search for her abducted boyfriend that draws her into the infamous Colonia Dignidad, a sect nobody has ever escaped from.', 'Colonia.mp4', 'April 15, 2015', 1, 'kids'),
(15, 'force.jpg', 'Star Wars: The Force Awakens', '2015', '2h 16m', 'Three decades after the Empire&rsquo;s defeat, a new threat arises in the militant First Order. Stormtrooper defector Finn and spare parts scavenger Rey are caught up in the Resistance&rsquo;s search for the missing Luke Skywalker.', 'Force.mp4', 'December 18, 2015', 1, 'kids'),
(16, 'whiplash.jpg', 'Whiplash', '2014', '1h 47m', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', 'Whiplash.mp4', 'October 15, 2014', 1, 'adult'),
(17, 'guardians.jpg', 'Guardians of the Galaxy', '2014', '2h 1m', 'A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe.', 'Guardians.mp4', 'August 1, 2014', 1, 'kids'),
(18, 'donjon.jpg', 'Don Jon', '2013', '1h 30m', 'A New Jersey guy dedicated to his family, friends, and church, develops unrealistic expectations from watching porn and works to find happiness and intimacy with his potential true love.', 'donjon.mp4', 'September 27, 2013', 1, 'kids'),
(19, 'gravity.jpg', 'Gravity', '2013', '1h 31m', 'Two astronauts work together to survive after an accident which leaves them alone in space.', 'Gravity.mp4', 'October 4, 2013', 1, 'kids'),
(20, 'pi.jpg', 'Life of Pi', '2012', '2h 7m', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.', 'Pi.jpg', 'November 21, 2012', 1, 'adult'),
(21, 'silver.jpg', 'Silver Linings Playbook', '2012', '2h 2m', 'After a stint in a mental institution, former teacher Pat Solitano moves back in with his parents and tries to reconcile with his ex-wife. Things get more challenging when Pat meets Tiffany, a mysterious girl with problems of her own.', 'Silver.jpg', 'December 25, 2012', 1, 'kids');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `duration` int(11) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `duration`, `country_id`) VALUES
(1, 'Survior', 260, 1),
(2, 'Testy', 500, 1),
(3, 'The Final Countdown', 420, 1),
(4, 'Rockstar', 450, 1),
(5, 'Rockstar', 450, 1),
(6, 'Rockstar', 450, 1),
(7, 'Rockstar', 450, 2),
(8, 'Rockstar', 450, 1),
(9, 'Rockstar', 450, 1),
(10, 'Rockstar', 450, 1),
(11, 'Rockstar', 450, 1),
(12, 'Rockstar', 450, 3),
(13, 'Rockstar', 450, 1),
(14, 'Rockstar', 450, 1),
(15, 'Rockstar', 450, 1),
(16, 'Rockstar', 450, 1),
(17, 'Rockstar', 450, 1),
(18, 'Rockstar', 450, 1),
(19, 'Rockstar', 450, 1),
(20, 'Rockstar', 450, 1),
(21, 'Rockstar', 450, 1),
(22, 'Rockstar', 450, 1),
(23, 'Rockstar', 450, 5),
(24, 'Rockstar', 450, 1),
(25, 'Rockstar', 450, 1),
(26, 'Rockstar', 450, 1),
(27, 'Rockstar', 450, 1),
(28, 'Rockstar', 450, 1),
(29, 'Rockstar', 450, 1),
(30, 'Rockstar', 450, 1),
(31, 'Rockstar', 450, 1),
(32, '<script>console.log(\'hello, world\');</script>', 450, 2),
(33, 'Rockstar', 450, 1),
(34, 'HArrold', 320, 1),
(35, 'HArrold', 320, 2),
(36, 'console.log(\'hello, world\');', 12, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_movie`
--
ALTER TABLE `category_movie`
  ADD PRIMARY KEY (`genre_movie`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_movie`
--
ALTER TABLE `category_movie`
  MODIFY `genre_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
