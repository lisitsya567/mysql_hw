-- 1. Вывести сколько фильмов сняла кинокомпания Universal Pictures
SELECT movies.title
FROM movies
JOIN company ON company.id = movies.company_id
WHERE company.title = 'Universal Pictures'
;

-- 2. Вывести сколько всего фильмов было снято режиссером Фрэнсисом Фордом Копполой
SELECT movies.title
FROM movies
JOIN directors ON movies.directors_id = directors.id
WHERE directors.full_name = 'Фрэнсис Форд Коппола'
;

-- 3. Вывести количество снятых фильмов за последние 20 лет
SELECT movies.title
FROM movies
WHERE
CURDATE()
ORDER BY year DESC
LIMIT 20
;

-- 4. Вывести все жанры фильмов в которых снимал Стивен Спилберг в течении всей своей карьеры
SELECT DISTINCT genres.title
FROM movies
JOIN directors ON movies.directors_id = directors.id
JOIN genres ON movies.genres_id = genres.id
WHERE directors.full_name = 'Стивен Спилберг'
;

-- 5. Вывести названия, жанры и режиссеров 5 самых дорогих фильмов
SELECT
	movies.title,
	genres.title,
    directors.full_name
FROM movies
JOIN directors ON movies.directors_id = directors.id
JOIN genres ON movies.genres_id = genres.id
ORDER BY budget DESC
LIMIT 5
;

-- 6. Вывести имя режиссера с самым большим количеством фильмов
SELECT
    directors.full_name
FROM movies
JOIN directors ON movies.directors_id = directors.id
ORDER BY movies.directors_id DESC
LIMIT 1
;


-- 7. Вывести названия и жанры фильмов, снятые самой большой кинокомпанией (по сумме всех бюджетов фильмов)
SELECT
	movies.title,
    genres.title,
    movies.budget
FROM movies
JOIN directors ON movies.directors_id = directors.id
JOIN company ON movies.company_id = company.id
JOIN genres ON movies.genres_id = genres.id
WHERE budget
GROUP BY
	movies.title,
    genres.title,
    movies.budget
ORDER BY movies.budget DESC
LIMIT 1
;


-- 8. Вывести средний бюджет фильмов, снятых кинокомпанией Warner Bros.
SELECT movies.title, AVG(budget)
FROM movies
JOIN company ON movies.company_id = company.id
WHERE company.title = 'Warner Bros'
GROUP BY movies.title
;

-- 9. Вывести количество фильмов каждого жанра и средний бюджет по жанру
SELECT genres.title, COUNT(movies.genres_id), AVG(movies.budget)
FROM movies
JOIN genres ON movies.genres_id = genres.id
GROUP BY genres.title
;

-- 10. Найти и удалить комедию "Дикие истории" 2014-го года
DELETE movies.title
FROM movies
WHERE movies.title = 'Дикие истории' and genres.title = 'комедия' and movies.year = '2014'
;

