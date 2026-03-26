-- G07-BDB-createDB
-- TODO: Constraints
-- candidate keys
-- 

-- Tables w/o foreign keys

create table Movie(
    id int not null Primary key,
    mTitle  varchar(255) not null,
    releaseDate     DATE not null,
    Uscert    VARCHAR(2) not null,
    mLength      decimal not null,
    country varchar(255) not null,
    budget int,
    grossEarning decimal,
    primaryLanguage varchar(255) not null,
    mDescription   varchar(3600) not null,
    popularityScore int,
    colorInfo varchar(255),
    soundInfo varchar(3600)    
);

create table Person(
    id int not null Primary key,
    firstName varchar(255) not null,
    lastName  varchar(255) not null,
    isCelebrity varchar(1) not null,
    starmeter int not null,
    birthDate DATE not null,
    deathDate DATE,
    gender varchar(2) not null,
    biography varchar(255)
);

create table Character(
    id int not null Primary key,
    firstName varchar(3666) not null,
    lastName  varchar(3666),
    cDescription varchar(3600)
    
);

create table Event(
    id int not null Primary key,
    eTitle varchar(255) not null, 
    eDate date not null,
    eLocation varchar(255) not null 
);

create table Genre(
    id int not null Primary key,
    gName varchar(255) not null,
    gDescription varchar(3600)
);

create table Streamer(
    id int not null Primary key,
    sName varchar(255) not null,
    website varchar(3600) not null
);

create table Theater(
    id int not null Primary key, 
    tName varchar(255) not null,
    street varchar(255) not null,
    city varchar(255) not null,
    tState varchar(255) not null,
    postal varchar(255) not null,
    wheelChair char not null,
    hearingImpaired char not null
);

-- Tables of ENTITES w/ foreign keys -- participate in a relationship (1,1)

create table Award(
    id int not null Primary key,
    eventId int not null,
    aTitle varchar(255) not null,
    category varchar(255) not null,
    foreign key (eventId) references Event(id)
);

create table Review(
    id int not null Primary key,
    movieId int not null,
    rTitle varchar(255) not null,
    postDate date not null,
    rating int not null,
    text varchar(3600),
    likes int not null,
    dislikes int not null,
    authorFName varchar(255) not null,
    authorLName varchar(255) not null,
    publication varchar(255) not null,
    foreign key (movieId) references Movie(id)
);

create table Sub_Genre(
    id int not null Primary key,
    genreId int not null, 
    sPrefix varchar(255) not null,
    sDescription varchar(3600),
    foreign key (genreId) references Genre(id)
);

-- Relationship Tables

create table Credit(
    personId int not null,
    movieId int not null,
    actorFlag      varchar(1) not null,
    directorFlag   varchar(1) not null,
    writerFlag     varchar(1) not null,
    starFlag       varchar(1) not null,
    crewMemberFlag varchar(1) not null,
    primary key (personId, movieId),
    foreign key (movieId) references Movie(id),
    foreign key (personId) references Person(id)
    
);

create table Nominee(
    personId int not null,
    movieId  int not null,
    awardId  int not null,
    dateNominated date not null,
    won char,
    primary key (personId, movieId, awardId),
    foreign key (personId) references Person(id),
    foreign key (awardId)  references Award(id),
    foreign key (movieId)  references Movie(id)
);

create table Nominated(
    movieId int not null,
    awardId int not null,
    dateNominated date not null,
    won char,
    primary key (movieId, awardId),
    foreign key (awardId) references Award(id),
    foreign key (movieId) references Movie(id)
);

create table Character_In(
    personId int not null,
    movieId int not null,
    characterId int not null,
    primary key (personId, movieId, characterId),
    foreign key (personId) references Person(id),
    foreign key (movieId) references Movie(id),
    foreign key (characterId) references Character(id)
);

create table Genre_Of(
    movieId int not null,
    genreId int not null,
    primary key (movieId, genreId),
    foreign key (movieId) references Movie(id),
    foreign key (genreId) references Genre(id)
);

create table Sub_Genre_Of(
    movieId int not null,
    sub_genreId int not null,
    primary key (movieId, sub_genreId),
    foreign key (movieId) references Movie(id),
    foreign key (sub_genreId) references Sub_Genre(id)
);


create table Available_On(
    movieId int not null,
    streamerId int not null,
    primary key (movieId, streamerId),
    foreign key (movieId) references Movie(id),
    foreign key (streamerId) references Streamer(id)
);

create table Shows(
    movieId int not null,
    theaterId int not null,
    showTime date not null,
    primary key (movieId, theaterId, showTime),
    foreign key (movieId) references Movie(id),
    foreign key (theaterId) references Theater(id)
);


-- Other Tables 
 
create table Photo(
    id int not null Primary key,
    personId int,
    movieId  int,
    filePath varchar(3600) not null,
    pDescription varchar(3600),
    posterFlag varchar(1) not null,
    foreign key (movieId) references Movie(id),
    foreign key (personId) references Person(id)

);

create table Video(
    id int not null Primary key,
    personId int,
    movieId  int,
    filePath varchar(3600) not null,
    timeMinutes    DECIMAL not null,
    vDescription varchar(3600),
    foreign key (movieId) references Movie(id),
    foreign key (personId) references Person(id)
    
);

create table Other_Languages(
    movieId int not null,
    mLanguage varchar(3600) not null,
    primary key(movieId,mLanguage),
    foreign key (movieId) references Movie(id)
);

create table Filming_Location(
    movieId int not null,
    mLocation varchar(3600) not null,
    primary key(movieId,Mlocation),
    foreign key (movieId) references Movie(id)
);

create table Subscription_Price(
    id int not null Primary key,
    streamerId int not null,
    price double precision,
    foreign key (streamerId) references Streamer(id)
);

create table Region_Availability(
    id int not null Primary key,
    streamerId int not null,
    region varchar(255),
    foreign key (streamerId) references Streamer(id)
);