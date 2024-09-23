CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL ,
    email VARCHAR(50) UNIQUE NOT NULL ,
    password VARCHAR(255)  NOT NULL ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE surah (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    englishName VARCHAR(50) NOT NULL,
    translationName VARCHAR(50) NOT NULL,
    numberOfAyahs INTEGER NOT NULL
);
CREATE TABLE verses (
    id SERIAL PRIMARY KEY,
    numberInSurah INTEGER NOT NULL,
    text TEXT NOT NULL,
    sajda BOOLEAN NOT NULL,
    surahId INTEGER REFERENCES surah(id) NOT NULL,
    number INTEGER NOT NULL
);
CREATE TABLE savedVerses (
    id SERIAL PRIMARY KEY,
    UserId INTEGER REFERENCES users(id) NOT NULL,
    verseId INTEGER REFERENCES verses(id) NOT NULL
);