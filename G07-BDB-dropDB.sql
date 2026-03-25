-- G07-BDB-dropDB

-- Drop dependent tables first

drop table Photo;

drop table Video;

drop table Other_Languages;

drop table Filming_Location;

drop table Credit;

drop table Nominee;

drop table Nominated;

drop table Character_In;

drop table Genre_Of;

drop table Sub_Genre_Of;


-- ENTITIES with foreign keys

drop table Award;

drop table Review;

drop table Sub_Genre;

-- ENTITIES without foreign keys

drop table Movie;

drop table Person;

drop table Character;

drop table Event;

drop table Genre;

drop table Streamer;

drop table Theater;