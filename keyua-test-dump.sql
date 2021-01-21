--
-- Дамп данных таблицы `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `product` (`product_id`, `model`, `quantity`) VALUES
(28, 'Product 1', 939),
(29, 'Product 2', 999),
(30, 'Product 3', 7),
(31, 'Product 4', 1000),
(32, 'Product 5', 999),
(33, 'Product 6', 1000),
(34, 'Product 7', 1000),
(35, 'Product 8', 1000),
(36, 'Product 9', 994),
(40, 'product 11', 970),
(41, 'Product 14', 977),
(42, 'Product 15', 990),
(43, 'Product 16', 929),
(44, 'Product 17', 1000),
(45, 'Product 18', 998),
(46, 'Product 19', 1000),
(47, 'Product 21', 1000),
(48, 'product 20', 995),
(49, 'SAM1', 0);

ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=699488547;

--
-- Дамп данных таблицы `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `category` (`category_id`, `parent_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 20),
(27, 20),
(28, 25),
(29, 25),
(30, 25),
(31, 25),
(32, 25),
(33, 0),
(34, 0),
(35, 28),
(36, 28),
(37, 34),
(38, 34),
(39, 34),
(40, 34),
(41, 34),
(42, 34),
(43, 34),
(44, 34),
(45, 18),
(46, 18),
(47, 34),
(48, 34),
(49, 34),
(50, 34),
(51, 34),
(52, 34),
(53, 34),
(54, 34),
(55, 34),
(56, 34),
(57, 0),
(58, 52);

ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`,`parent_id`),
  ADD KEY `parent_id` (`parent_id`);

ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Дамп данных таблицы `category_description`
--

CREATE TABLE `category_description` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `category_description` (`category_id`, `name`) VALUES
(28, 'Monitors'),
(33, 'Cameras'),
(32, 'Web Cameras'),
(31, 'Scanners'),
(30, 'Printers'),
(29, 'Mice and Trackballs'),
(27, 'Mac'),
(26, 'PC'),
(17, 'Software'),
(25, 'Components'),
(24, 'Phones &amp; PDAs'),
(20, 'Desktops'),
(35, 'test 1'),
(36, 'test 2'),
(37, 'test 5'),
(38, 'test 4'),
(39, 'test 6'),
(40, 'test 7'),
(41, 'test 8'),
(42, 'test 9'),
(43, 'test 11'),
(34, 'MP3 Players'),
(18, 'Laptops &amp; Notebooks'),
(44, 'test 12'),
(45, 'Windows'),
(46, 'Macs'),
(47, 'test 15'),
(48, 'test 16'),
(49, 'test 17'),
(50, 'test 18'),
(51, 'test 19'),
(52, 'test 20'),
(53, 'test 21'),
(54, 'test 22'),
(55, 'test 23'),
(56, 'test 24'),
(57, 'Tablets'),
(58, 'test 25');

ALTER TABLE `category_description`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `name` (`name`);

--
-- Дамп данных таблицы `product_to_category`
--

CREATE TABLE `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

ALTER TABLE `product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Дамп данных таблицы `category_path`
--

CREATE TABLE `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0);

ALTER TABLE `category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);
