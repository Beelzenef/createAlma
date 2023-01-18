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
    year INTEGER,
    id_genre INTEGER NOT NULL,
    id_director INTEGER NOT NULL,
    FOREIGN KEY (id_genre) REFERENCES GENRES (id),
    FOREIGN KEY (id_director) REFERENCES DIRECTORS (id)
)

-- CLIENTS
create table CLIENTS (
    id INTEGER PRIMARY KEY NOT NULL,
    name TEXT(100),
    registeredat DATETIME
)

-- DROPPING DATA
--drop table MOVIES
--drop table DIRECTORS
--drop table GENRES
--drop table CLIENTS

-- delete from directors
-- delete from movies

-- INSERTING DATA
insert into DIRECTORS values
      (1, 'Todd Haynes'),
      (2, 'Jared Bush'),
      (3, 'Christopher Nolan'),
      (4, 'David Fincher'),
      (5, 'Lilly Wachowski'),
      (6, 'Stanley Kubrick'),
      (7, 'Bong Joon-ho'),
      (8, 'Andrew Stanton'),
      (9, 'Riddley Scott'),
      (10, 'Steven Spielberg'),
      (11, 'Quentin Tarantino'),
      (12, 'Roland Emmerich'),
      (13, 'John Madden'),
      (14, 'Richard Curtis')

insert into GENRES values
      (1, 'Drama'),
      (2, 'Comedy'),
      (3, 'Action'),
      (4, 'Fantasy'),
      (5, 'Horror'),
      (6, 'Romance'),
      (7, 'Thriller')

insert into MOVIES values
    (1, 'Carol', 2015, 6, 2),
    (2, 'Encanto', 2022, 8, 1),
    (3, 'Pulp Fiction', 1994, 3, 11),
    (4, 'Schindler`s list', 1994, 1, 10),
    (5, 'The Dark Knight', 1994, 3, 3), 
    (6, 'The day after tomorrow', 2004, 3, 12),
    (7, 'Matrix', 1999, 3, 5),
    (8, 'Love actually', 2003, 6, 14),
    (9, 'Interstellar', 2014, 1, 3), 
    (10, 'Parasite', 2019, 5, 7), 
    (11, 'Alien', 1979, 5, 9), 
    (12, 'WALL-E', 2008, 2, 8), 
    (13, 'The shining', 1980, 5, 6), 
    (14, '2001, a space odissey', 1968, 5, 6),
    (15, 'Independence day', 1996, 3, 12),
    (16, 'Inception', 2010, 1, 3),
    (17, 'Shakespeare in love', 1998, 6, 13),
    (18, 'Fight club', 1999, 3, 4) 

insert into CLIENTS values
    (1, 'Elena G Blanco', date('2000-05-05'))

-- GIVE ME ALL YOU GOT
select * from MOVIES
select * from GENRES
select * from DIRECTORS
select * from CLIENTS

--select date('2022-13-01')
--select date('now')