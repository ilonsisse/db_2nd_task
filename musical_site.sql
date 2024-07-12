CREATE TABLE musical_genre (
    genre_id SERIAL PRIMARY KEY, -- добавил PK на id
    genre VARCHAR(50) UNIQUE NOT NULL, -- ограничение UNIQUE NOT NULL на поле genre
    genre_description TEXT
);

CREATE TABLE singer (
    singer_id SERIAL PRIMARY KEY, -- добавил PK на id
    nickname VARCHAR(50) UNIQUE NOT NULL, -- ограничение UNIQUE NOT NULL на поле nickname
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
);

CREATE TABLE singer_genre (
    singer_id INTEGER NOT NULL REFERENCES singer(singer_id),
    genre_id INTEGER NOT NULL REFERENCES musical_genre(genre_id),
    PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE album (
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL CHECK (release_date >= '1900-01-01') -- ограничение на дату выхода
);

CREATE TABLE album_singer (
    album_id INTEGER NOT NULL REFERENCES album(album_id),
    singer_id INTEGER NOT NULL REFERENCES singer(singer_id),
    PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE track (
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL CHECK (duration > 0 AND duration <= 3600), -- поменял тип на INTEGER и ограничил длительность трека
    album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE compilation (
    compilation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year >= 1900) -- ограничение на год выпуска
);

CREATE TABLE compilation_track (
    compilation_id INTEGER NOT NULL REFERENCES compilation(compilation_id),
    track_id INTEGER NOT NULL REFERENCES track(track_id),
    PRIMARY KEY (compilation_id, track_id)
);
