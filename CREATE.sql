create table genre(
    genreid SERIAL primary key,
    name varchar(30)
);

create table artist(
    artistid SERIAL primary key,
    artistname varchar(30)
);

create table artist_genre(
    artistid int references artist(artistid) on delete cascade,
    genreid int references genre(genreid) on delete cascade,
    primary key (artistid, genreid)
);

create table album(
    albumid SERIAL primary key,
    title varchar(50),
    releaseyear int
);


create table album_artist(
    artistid int references artist(artistid) on delete cascade,
    albumid int references album(albumid) on delete cascade,
    primary key (artistid, albumid)
);

create table track(
    trackid SERIAL primary key,
    title varchar(50),
    duration int,
    albumid int references album(albumid) on delete cascade
);

create table collection(
    collectionid SERIAL primary key,
    namecollection varchar(30),
    releaseyear int
);

create table collection_track(
    collectionid int references collection(collectionid) on delete cascade,
    trackid int references track(trackid) on delete cascade,
    primary key (collectionid, trackid)
);
