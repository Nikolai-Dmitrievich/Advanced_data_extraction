-- Задание 2
-- Название и продолжительность самого длительного трека.
select title, duration 
from track 
where duration = (select max(duration) from track);

-- Название треков, продолжительность которых не менее 3,5 минут
select title, duration 
from track 
where duration >= 210; -- исправил с 180 на 210 сек

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select namecollection
from collection
where releaseyear >= 2018 and releaseyear <= 2020;

-- Исполнители, чьё имя состоит из одного слова.
select artistname
from artist
where artistname not like '% %';

-- Название треков, которые содержат слово «мой» или «my».
select title
from track
where title ilike 'my %' or title ilike '% my' or title ilike '% my %' or title ilike 'my'; -- изменил lower ... like на ilike и добавил условия учитывая позицию в строке('мой' не учитываю, так как нет русского наименования)

-- Задание 3
-- Количество исполнителей в каждом жанре.
select name as Жанр, count(artistname) as Исполнители
from
	artist
	join artist_genre on artist.artistid = artist_genre.artistid
	join genre on artist_genre.genreid = genre.genreid
group by name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
select count(t.title) as Количество
from
	album a
	join track t on a.albumid = t.albumid
where releaseyear >= 2019 and releaseyear <= 2020;

-- Средняя продолжительность треков по каждому альбому.
select a.title as Альбом, round(avg(t.duration)) as Средняя_продолжительность
from
	album a
	join track t on a.albumid = t.albumid
group by a.title;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
select artistname
from artist
where artistname not in (											-- изменил условие как подзапрос
				select a.artistname
				from
					artist a 
					join album_artist aa on a.artistid = aa.artistid
					join album a2 on aa.albumid = a2.albumid
					where a2.releaseyear = 2020);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct c.namecollection 
from
	collection c 
	join collection_track ct on c.collectionid = ct.collectionid
	join track t on ct.trackid = t.trackid
	join album a on t.albumid = a.albumid
	join album_artist aa on a.albumid = aa.albumid
	join artist a2 on aa.artistid = a2.artistid
where a2.artistname = 'Nirvana';

-- Задание 4(необязательное)
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select a2.title
from 
	artist a 
	join album_artist aa on a.artistid = aa.artistid
	join album a2 on aa.albumid = a2.albumid
where a.artistname in (	select a.artistname
						from 
							genre g 
							join artist_genre ag on g.genreid = ag.genreid
							join artist a on ag.artistid = a.artistid
						group by a.artistname
						having count(g.name)>1);

-- Наименования треков, которые не входят в сборники.
select t.title
from
	track t 
	left join collection_track ct on t.trackid = ct.trackid
where ct.collectionid is null;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select a.artistname
from 
	artist a 
	join album_artist aa on a.artistid = aa.artistid
	join album a2 on aa.albumid = a2.albumid
	join track t on a2.albumid = t.albumid
where t.duration = (select min(duration)
					from track);

-- Названия альбомов, содержащих наименьшее количество треков.
select a.title
from
	album a
	left join track t on a.albumid = t.albumid
group by a.albumid 
having count(t.title) = (
						select min(title_count)
						from (
								select a.title, count(t.title) as title_count
								from 
									album a
									left join track t on a.albumid = t.albumid
								group by a.albumid) as q);