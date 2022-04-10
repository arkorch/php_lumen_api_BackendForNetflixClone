-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netflixapis`
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
(4, 'Comedy'),
(5, 'Emotional '),
(6, 'Adventure '),
(7, 'Romance ');

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
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 1, 7),
(8, 4, 8),
(9, 2, 9),
(10, 2, 10),
(11, 6, 11),
(12, 2, 12),
(13, 1, 13),
(14, 4, 14),
(15, 1, 15),
(16, 2, 16),
(17, 4, 17),
(18, 4, 18),
(19, 7, 19),
(20, 7, 20),
(21, 7, 21);

-- --------------------------------------------------------

--
-- Table structure for table `category_tvshow`
--

CREATE TABLE `category_tvshow` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `tvshow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_tvshow`
--

INSERT INTO `category_tvshow` (`id`, `category_id`, `tvshow_id`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 4, 3),
(4, 1, 4),
(5, 3, 5),
(6, 6, 6);

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
(6, 'Sad');

-- --------------------------------------------------------

--
-- Table structure for table `genre_song`
--

CREATE TABLE `genre_song` (
  `genre_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre_song`
--

INSERT INTO `genre_song` (`genre_id`, `song_id`, `id`) VALUES
(5, 1, 1),
(5, 2, 2),
(1, 3, 3),
(5, 4, 4),
(5, 5, 5),
(5, 6, 6),
(6, 7, 7),
(1, 8, 8),
(3, 9, 9),
(5, 10, 10),
(6, 11, 11),
(5, 12, 12),
(6, 13, 13),
(3, 14, 14),
(5, 15, 15),
(5, 16, 16),
(6, 17, 17),
(3, 18, 18),
(3, 19, 19),
(3, 20, 20),
(2, 21, 21),
(2, 22, 22),
(2, 23, 23),
(2, 24, 24),
(2, 25, 25);

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
(1, 'dark.jpg', 'The Dark Knight', '2008', '2h 32m', 'The Dark Knight is a 2008 superhero film directed, co-produced, and co-written by Christopher Nolan. Based on the DC Comics character Batman.', 'dark.mp4', 'July 18, 2008', 1, 'adult'),
(2, 'spider.jpg', 'Spider-Man: No Way Home', '2021', '2h 28m', 'With Spider-Man\'s identity now revealed, our friendly neighborhood web-slinger is unmasked ', 'spider.mp4', 'December 17, 2021', 3, 'kids'),
(3, 'Rises.jpg', 'The Dark Knight Rises', '2012', '2h 45m', 'Despite his tarnished reputation after the events of The Dark Knight (2008), in which he took the rap for Dent\'s crimes', 'rises.mp4', 'July 20, 2012', 2, 'kids'),
(4, 'eternals.jpg', 'Eternals', '2021', '2h 37m', 'The Eternals, a race of immortal beings with superhuman powers who have secretly lived on Earth for thousands of years, reunite to battle the evil Deviants.', 'eternals.mp4', 'November 5, 2021', 1, 'kids'),
(5, 'no.jpg', 'No Time to Die', '2021', '2h 43m', 'No Time to Die is a 2021 spy film and the twenty-fifth in the James Bond series', 'no.mp4', 'September 30, 2021', 3, 'adult'),
(6, 'joker.jpg', 'Joker', '2019', '1h 58m', 'Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City', 'joker.mp4', 'October 4, 2019', 2, 'adult'),
(7, 'dead.jpg', 'Deadpool', '2016', '1h 48m', 'A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.', 'dead.mp4', 'Febuary 12, 2016', 2, 'kids'),
(8, 'guy.jpg', 'Free Guy', '2021', '1h 55m', 'When a bank teller discovers he\'s actually a background player in an open-world video game', 'guy.mp4', 'August 13, 2021', 1, 'kids'),
(9, 'f9.jpg', 'Fast & Furious 9', '2021', '2h 23m', 'Dom Toretto is living the quiet life off the grid with Letty and his son, but they know that danger always lurks just over the peaceful horizon.', 'f9.mp4', 'June 25, 2021', 1, 'adult'),
(10, 'squad.jpg', 'The Suicide Squad', '2021', '2h 12m', 'The government sends the most dangerous supervillains in the world -- Bloodsport, Peacemaker, King Shark, Harley Quinn and others', 'squad.mp4', 'August 6, 2021', 1, 'adult'),
(11, 'revenant.jpg', 'The Revenant', '2015', '2h 36m', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', 'Revenant.mp4', 'January 8, 2015', 1, 'kids'),
(12, 'captain .jpg', 'Captain Marvel', '2019', '2h 4m', 'Captain Marvel is an extraterrestrial Kree warrior who finds herself caught in the middle of an intergalactic battle between her people and the Skrulls.', 'captain.mp4', 'March 7, 2019', 1, 'kids'),
(13, 'avatar.jpg', 'Avatar', '2009', '2h 42m', 'On the lush alien world of Pandora live the Na\'vi, beings who appear primitive but are highly evolved. Because the planet\'s environment is poisonous', 'avatar.mp4', 'December 18, 2009', 1, 'adult'),
(14, 'colonia.jpg', 'Colonia', '2015', '1h 46m', 'A young woman&rsquo;s desperate search for her abducted boyfriend that draws her into the infamous Colonia Dignidad, a sect nobody has ever escaped from.', 'Colonia.mp4', 'April 15, 2015', 1, 'kids'),
(15, 'force.jpg', 'Star Wars: The Force Awakens', '2015', '2h 16m', 'Three decades after the Empire&rsquo;s defeat, a new threat arises in the militant First Order. Stormtrooper defector Finn and spare parts scavenger Rey are caught up in the Resistance&rsquo;s search for the missing Luke Skywalker.', 'Force.mp4', 'December 18, 2015', 1, 'kids'),
(16, 'avengers.jpg', 'The Avengers', '2012', '2h 23m', 'When Thor\'s evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury', 'avengers.mp4', 'May 3, 2013', 2, 'kids'),
(17, 'iron.jpg', 'Iron Man 3', '2013', '2h 10m', 'Plagued with worry and insomnia since saving New York from destruction, Tony Stark ', 'iron.mp4', 'August 1, 2014', 2, 'kids'),
(18, 'don.jpg', 'Don Jon', '2013', '1h 30m', 'A New Jersey guy dedicated to his family, friends, and church, develops unrealistic expectations from watching porn and works to find happiness and intimacy with his potential true love.', 'don.mp4', 'September 27, 2013', 1, 'adult'),
(19, 'lie.jpg', 'Lie with Me', '2005', '1h 33m', 'Promiscuous Torontonians Leila (Lauren Lee Smith) and David (Eric Balfour) meet at a nightclub and have immediate chemistry.', 'lie.mp4', 'November 11, 2005', 2, 'adult'),
(20, 'fifty.jpg', 'Fifty Shades Darker', '2017', '1h 58m', 'When a wounded Christian Grey tries to entice a cautious Anastasia Steele back into his life, she demands a new arrangement before she will give him another chance.', 'fifty.mp4', 'February 10, 2017', 1, 'adult'),
(21, 'pie.jpg', 'American Pie 2', '2001', '1h 50m', 'After a year apart - attending different schools, meeting different people - the guys rent a beach house and vow to make this the best summer ever.', 'pie.mp4', 'August 6, 2001', 2, 'adult');

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
(1, 'Pretty Too', 239, 1),
(2, 'Super Gremlin', 317, 1),
(3, 'The Final Countdown', 420, 1),
(4, 'Everybody Hates Me', 325, 1),
(5, 'Sad Rappers', 309, 1),
(6, 'Smoke My Pain', 450, 1),
(7, 'Sorry', 335, 1),
(8, 'Bad News', 413, 1),
(9, 'Creature', 357, 1),
(10, 'Drugs in My Pocket', 420, 1),
(11, 'So High', 426, 1),
(12, 'Talk My Shit', 317, 1),
(13, 'Fist Class', 253, 2),
(14, 'As It Was', 246, 2),
(15, 'Heat Waves', 352, 2),
(16, 'Industry Baby', 330, 2),
(17, 'Right On', 332, 2),
(18, 'Story of my life', 320, 2),
(19, 'Stay', 220, 2),
(20, 'PantySito', 356, 3),
(21, 'Smells Like Teen Spirit', 254, 3),
(22, 'Imagine', 350, 3),
(23, 'The Four Seasons', 245, 3),
(24, 'Carmina Burana', 450, 3),
(25, 'No Se Va', 335, 3),
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

-- --------------------------------------------------------

--
-- Table structure for table `tvshows`
--

CREATE TABLE `tvshows` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `tvshows_cover` varchar(75) NOT NULL DEFAULT 'cover_default.jpg',
  `tvshows_title` varchar(125) NOT NULL,
  `tvshows_year` varchar(5) NOT NULL,
  `tvshows_runtime` varchar(25) NOT NULL,
  `tvshows_storyline` text NOT NULL,
  `tvshows_trailer` varchar(75) NOT NULL DEFAULT 'trailer_default.jpg',
  `tvshows_release` varchar(125) NOT NULL,
  `county_id` int(11) NOT NULL DEFAULT 1,
  `rating` varchar(10) NOT NULL DEFAULT 'kids'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tvshows`
--

INSERT INTO `tvshows` (`id`, `tvshows_cover`, `tvshows_title`, `tvshows_year`, `tvshows_runtime`, `tvshows_storyline`, `tvshows_trailer`, `tvshows_release`, `county_id`, `rating`) VALUES
(1, 'pokemon.jpg', 'Pokemon Season 2', '1999', '2h 16m', 'Pikachu explore the world of pokemon', 'Pokemon2.mp4', 'April 1, 1997', 1, 'kids'),
(2, 'tom.jpg', 'Tom and jerry', '1950', '1h 46m', 'A greedy blue/gray cat who is always chasing Jerry', 'Tom.mp4', 'April 1, 1950', 3, 'kids'),
(3, 'planet.jpg', 'Our Planet', '2019', '2h 17m', 'Experiencing our planet’s natural beauty ', 'Planet.mp4', 'April 5, 2019', 2, 'kids'),
(4, 'war.jpg', 'World war II in color', '2009', '2h', 'Documentary telling the full story of World War II', 'war.mp4', 'September 4, 2009', 1, 'adult'),
(5, 'Family.jpg', 'Family Guy', '1999', '2h 9min', 'The series is about the lives of Peter Griffin, his wife Lois, and their three children', 'family.mp4', 'January 9, 1999', 3, 'adult'),
(6, 'big.jpg', 'Big Bang Theory', '2007', '2h 19m', 'The Big Bang Theory is a comedy about brilliant physicists, Leonard and Sheldon, who are the kind of \"beautiful minds\"', 'big.mp4', 'September 24, 2007', 2, 'adult');

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
-- Indexes for table `category_tvshow`
--
ALTER TABLE `category_tvshow`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `genre_song`
--
ALTER TABLE `genre_song`
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
-- Indexes for table `tvshows`
--
ALTER TABLE `tvshows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_movie`
--
ALTER TABLE `category_movie`
  MODIFY `genre_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `category_tvshow`
--
ALTER TABLE `category_tvshow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `genre_song`
--
ALTER TABLE `genre_song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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

--
-- AUTO_INCREMENT for table `tvshows`
--
ALTER TABLE `tvshows`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
