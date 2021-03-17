--
-- Структура таблицы `advertisers`
--

CREATE TABLE `advertisers` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `advertisers`
--

INSERT INTO `advertisers` (`id`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Структура таблицы `blacklists`
--

CREATE TABLE `blacklists` (
  `id` int NOT NULL,
  `advertisers_id` int NOT NULL,
  `table_name` varchar(1) NOT NULL,
  `value_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `blacklists`
--

INSERT INTO `blacklists` (`id`, `advertisers_id`, `table_name`, `value_id`) VALUES
(1, 1, 'p', 1),
(2, 1, 's', 1),
(47, 2, 'p', 1),
(48, 2, 's', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `publishers`
--

CREATE TABLE `publishers` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `publishers`
--

INSERT INTO `publishers` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Структура таблицы `sites`
--

CREATE TABLE `sites` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sites`
--

INSERT INTO `sites` (`id`) VALUES
(1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `advertisers`
--
ALTER TABLE `advertisers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `blacklists`
--
ALTER TABLE `blacklists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `advertisers_id_2` (`advertisers_id`,`table_name`,`value_id`),
  ADD KEY `advertisers_id` (`advertisers_id`);

--
-- Индексы таблицы `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `advertisers`
--
ALTER TABLE `advertisers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `blacklists`
--
ALTER TABLE `blacklists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT для таблицы `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;
