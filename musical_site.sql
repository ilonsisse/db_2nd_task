CREATE TABLE musical_genre (
    genre VARCHAR(50) PRIMARY KEY,
    genre_description TEXT
);

CREATE TABLE singer (
    nickname VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
);


CREATE TABLE singer_genre (
    singer_nickname VARCHAR(50) NOT NULL REFERENCES singer(nickname),
    genre VARCHAR(50) NOT NULL REFERENCES musical_genre(genre),
    PRIMARY KEY (singer_nickname, genre)
);

CREATE TABLE album (
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL
);

CREATE TABLE album_singer (
    album_id INTEGER NOT NULL REFERENCES album(album_id),
    singer_nickname VARCHAR(50) NOT NULL REFERENCES singer(nickname),
    PRIMARY KEY (album_id, singer_nickname)
);

CREATE TABLE track (
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE compilation (
    compilation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE compilation_track (
    compilation_id INTEGER NOT NULL REFERENCES compilation(compilation_id),
    track_id INTEGER NOT NULL REFERENCES track(track_id),
    PRIMARY KEY (compilation_id, track_id)
);

