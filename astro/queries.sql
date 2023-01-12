-- GENRES
create table GENRES(
    id INTEGER PRIMARY KEY NOT NULL,
    name text(50)
)

-- DIRECTORS
create table DIRECTORS (
    id INTEGER PRIMARY KEY NOT NULL,
    name text(50)
)

-- MOVIES
create table MOVIES(
    id INTEGER PRIMARY KEY NOT NULL,
    title TEXT(100),
    year TEXT(4),
    id_genre INTEGER NOT NULL,
    id_director INTEGER NOT NULL,
    FOREIGN KEY (id_genre) REFERENCES GENRES (id),
    FOREIGN KEY (id_director) REFERENCES DIRECTORS (id)
)

-- CLIENTS
create table CLIENTS (
    id INTEGER PRIMARY KEY NOT NULL,
    name TEXT(100),
    registeredat TEXT(10)
)

-- DROPPING DATA
--drop table MOVIES
--drop table DIRECTORS
--drop table GENRES
--drop table CLIENTS

-- INSERTING DATA
insert into DIRECTORS values
      (1, 'Todd Haynes'),
      (2, 'Jared Bush')

insert into GENRES values
      (1, 'Drama'),
      (2, 'Comedy'),
      (3, 'Action'),
      (4, 'Fantasy'),
      (5, 'Horror'),
      (6, 'Romance'),
      (7, 'Thriller')

insert into MOVIES values
    (1, 'Carol', '2015', 4, 2),
    (2, 'Encanto', '2022', 8, 1)

insert into CLIENTS values
    (1, 'Elena G Blanco', date('2000-05-05'))


-- GIVE ME ALL YOU GOT
select * from MOVIES
select * from GENRES
select * from DIRECTORS
select * from CLIENTS

--select date('2022-13-01')
--select date('now')