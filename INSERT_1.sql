-- Задание 1
-- Жанры
INSERT INTO genre (name) VALUES
('Rock'),
('Pop'),
('Jazz'),
('Hip-Hop'),
('Classical');

-- Исполнители
INSERT INTO artist (artistname) VALUES
('The Beatles'),
('Adele'),
('Miles Davis'),
('Kanye West'),
('Ludwig van Beethoven'),
('Nirvana'),
('Taylor Swift'),
('Daft Punk');

-- Связь исполнителей с жанрами
INSERT INTO artist_genre (artistid, genreid) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 2),
(8, 3);

-- Альбомы
INSERT INTO album (title, releaseyear) VALUES
('Abbey Road', 1969),
('25', 2015),
('Kind of Blue', 1959),
('The College Dropout', 2004),
('Symphony No.9', 1824);

-- Связь исполнителей с альбомами
INSERT INTO album_artist (artistid, albumid) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3);

-- Треки
INSERT INTO track (title, duration, albumid) VALUES
('Come Together', 259, 1),
('Something', 182, 1),
('Hello', 295, 2),
('Send My Love', 223, 2),
('So What', 545, 3),
('Freddie Freeloader', 589, 3),
('Through the Wire', 211, 4),
('Power', 292, 4);

-- Сборники
INSERT INTO collection (namecollection, releaseyear) VALUES
('Greatest Hits 60s', 1970),
('Pop Anthems', 2018),
('Jazz Classics', 1960),
('Hip-Hop Essentials', 2005),
('Classical Masterpieces', 1830),
('Mixed Favorites', 2020);

-- Связь сборников с треками
INSERT INTO collection_track (collectionid, trackid) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 1),
(6, 4),
(6, 5);

-- Альбомы 2019–2020 годов
INSERT INTO album (title, releaseyear) VALUES
('Future Nostalgia', 2020),
('When We All Fall Asleep, Where Do We Go?', 2019);


-- Треки для альбома 2020 года
INSERT INTO track (title, duration, albumid) VALUES
('Start Now', 183, 6),
('Physical', 193, 6),
('Break My Heart', 215, 6);

-- Треки для альбома 2019 года
INSERT INTO track (title, duration, albumid) VALUES
('Bad Guy', 194, 7),
('When The Party Over', 204, 7),
('Bury A Friend', 194, 7);



-- Новые исполнители
INSERT INTO artist (artistname) VALUES
('Dua Lipa'),
('Billie Eilish');


-- Связь исполнителей с альбомами
INSERT INTO album_artist (artistid, albumid) VALUES
(9, 6),
(10, 7);

