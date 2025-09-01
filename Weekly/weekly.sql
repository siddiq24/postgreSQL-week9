insert into users (email, password) values 
('siddiqrm24@octa.com', 'password123');

--Login
SELECT id, email, point
FROM users
WHERE email = 'siddiqrm24@octa.com'
AND password = 'password123'
LIMIT 1;

--Register
INSERT INTO users (email, password, point, created_at)
VALUES ('userbaru@example.com', 'contohPassword', 0, CURRENT_TIMESTAMP);

--Get upcoming movies
SELECT *
FROM movies
WHERE release_date > CURRENT_DATE
ORDER BY release_date ASC;

--get popular movies
SELECT m.id, m.title, COUNT(os.seats_id) AS tickets_sold
FROM movies m
JOIN schedules s ON m.id = s.movie_id
JOIN order_tickets ot ON ot.schedule_id = s.id
JOIN order_seats os ON os.order_id = ot.id
WHERE ot.is_paid = true
GROUP BY m.id, m.title
ORDER BY tickets_sold DESC
LIMIT 20;

-- get movie with pagination
SELECT *
FROM movies
ORDER BY release_date DESC
LIMIT 20 OFFSET 20*n;

-- filter movie by name and genre with pagination
SELECT m.*
FROM movies m
JOIN genre_movie gm ON m.id = gm.movie_id
JOIN genres g ON gm.genre_id = g.id
WHERE m.title ILIKE '%' || :title || '%'
  AND g.name ILIKE '%' || :genre || '%' 
ORDER BY m.release_date DESC
LIMIT :limit OFFSET (:page - 1) * :limit;

--get schedule
SELECT 
    s.id AS schedule_id,
    m.title AS movie_title,
    m.duration,
    m.poster_img,
    c.name AS cinema_name,
    t.time,
    s.date
FROM schedules s
JOIN movies m ON s.movie_id = m.id
JOIN cinemas c ON s.cinema_id = c.id
JOIN times t ON s.time_id = t.id
ORDER BY s.date, t.time;

-- get seats sold
SELECT cols, rows
FROM seats
WHEN status = 'sold';

-- get movie details
SELECT 
    m.id,
    m.title,
    m.description,
    m.release_date,
    m.duration,
    m.poster_img,
    m.backdrop_img,
    m.rating,
    m.isUpcoming,
    d.name AS director_name,
    STRING_AGG(g.name, ', ') AS genres
FROM movies m
JOIN directors d ON m.directors_id = d.id
LEFT JOIN genre_movie gm ON m.id = gm.movie_id
LEFT JOIN genres g ON gm.genre_id = g.id
WHERE m.id = 1
GROUP BY m.id, d.name;

--create order
INSERT INTO order_tickets (user_id, schedule_id, total)
VALUES (3, 10, 100000)
RETURNING id;

INSERT INTO order_seats (order_id, seats_id )
VALUES 
(7, 3),
(7, 4),
(7, 5);

SELECT  os.seats_id 
FROM order_seats os
JOIN order_tickets ot  ON os.order_id = ot.id
WHERE ot.schedule_id = 10
  AND os.seats_id  IN (3,4,5);

--get profile
SELECT 
    u.id,
    u.email,
    u.point,
    u.created_at,
    p.avatar
FROM users u
LEFT JOIN profiles p ON u.id = p.user_id
WHERE u.id = 1;


--get history
SELECT 
    ot.id AS order_id,
    ot.create_at AS order_date,
    m.title AS movie_title,
    c.name AS cinema_name,
    s.date,
    t.time,
    ot.total
FROM order_tickets ot
JOIN schedules s ON ot.schedule_id = s.id
JOIN movies m ON s.movie_id = m.id
JOIN cinemas c ON s.cinema_id = c.id
JOIN times t ON s.time_id = t.id
WHERE ot.user_id = 1
GROUP BY ot.id, ot.create_at, m.title, c.name, s.date, t.time, ot.total
ORDER BY ot.create_at DESC;


-- edit profile
UPDATE users
SET email = 'newemail@example.com',
    password = 'newpassword'
WHERE id = 1;

-- get all movie admin
SELECT m.id,
       m.title,
       m.description,
       m.release_date,
       m.duration,
       m.poster_img,
       m.backdrop_img,
       m.rating,
       m.isUpcoming,
       d.name AS director_name
FROM movies m
JOIN directors d ON m.directors_id = d.id
ORDER BY m.created_ad DESC
LIMIT 20 OFFSET 0;

--delete movie
DELETE FROM movies
WHERE id = 1;

-- edit movie
UPDATE movies
SET 
    title = 'new title',
    description = 'new desc',
    release_date = 'date',
    duration = 'new duration',
    poster_img = 'new poster',
    directors_id = 'new director',
    backdrop_img = 'new backdrop',
    rating = 'new rating',
    isUpcoming = 'true / false'
WHERE id = 22;

