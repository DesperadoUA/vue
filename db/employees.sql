-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 08 2020 г., 17:51
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vue`
--

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `сhief` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `name`, `date`, `department`, `сhief`, `thumbnail`) VALUES
(1, 'Сотрудник 1', '2020-09-08 14:31:57', 'Seo', 'Boss 1', 'https://bigpicture.ru/wp-content/uploads/2019/04/grandbeauty00.jpg'),
(2, 'Сотрудник 2', '2020-09-08 14:31:57', 'Seo', 'Boss 1', 'https://bigpicture.ru/wp-content/uploads/2019/04/grandbeauty27.jpg'),
(3, 'Сотрудник 3', '2020-09-08 14:31:57', 'Seo', 'Boss 1', 'https://i.pinimg.com/originals/e8/83/7b/e8837b00067930f307a825c2ff74f3fa.jpg'),
(4, 'Сотрудник 4', '2020-09-08 14:31:57', 'Seo', 'Boss 2', 'https://mixnews.lv/wp-content/uploads/2020/05/7/2020-05-07-mixnews-1242214.jpg'),
(5, 'Сотрудник 5', '2020-09-08 14:31:57', 'Контент', 'Boss 2', 'https://s0.rbk.ru/v6_top_pics/media/img/1/28/755743646058281.jpeg'),
(6, 'Сотрудник 6', '2020-09-08 14:31:57', 'Контент', 'Boss 1', 'https://cdn.shazoo.ru/444287_MFhaI6pmAH_ryan_reynolds_x_men.jpg'),
(7, 'Сотрудник 7', '2020-09-08 14:31:57', 'Дизайнер', 'Boss 1', 'https://www.ohchr.org/SiteCollectionImages/Issues/OlderPersons/claudia_mahler.jpg'),
(8, 'Сотрудник 8', '2020-09-08 14:31:57', 'Дизайнер', 'Boss 2', 'https://files.vm.ru/photo/vecherka/2018/12/doc73ect2hq0km10chbjdlb_800_480.jpg'),
(9, 'Сотрудник 9', '2020-09-08 14:31:57', 'Разработчик', 'Boss 2', 'https://www.liga.net/images/general/2020/05/14/thumbnail-20200514210100-2892.jpg'),
(10, 'Сотрудник 10', '2020-09-08 14:31:57', 'Копирайтер', 'Boss 1', 'https://vedtver.ru/upload/iblock/7f2/7f2f5dc34416d2a12ed0da5dc462320b.jpg'),
(11, 'Сотрудник 11', '2020-09-08 14:31:57', 'Копирайтер', 'Boss 2', 'https://www.factroom.ru/facts/wp-content/uploads/2012/08/328.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
