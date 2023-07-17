CREATE TABLE  IF NOT EXISTS music_genre
(
	id_music_genre SERIAL PRIMARY KEY,
	name_of_genre VARCHAR(40) UNIQUE NOT NULL
);
CREATE TABLE  IF NOT EXISTS list_of_musicians
(
	id_musician SERIAL PRIMARY KEY,
	name_of_musician VARCHAR(40) UNIQUE NOT NULL
);
CREATE TABLE  IF NOT EXISTS musicians_genre
(
	id_music_genre INTEGER REFERENCES music_genre(id_music_genre),
	id_musician INTEGER REFERENCES list_of_musicians(id_musician),
	PRIMARY KEY(id_music_genre, id_musician)
);
CREATE TABLE  IF NOT EXISTS album_list
(
	id_album  SERIAL PRIMARY KEY,
	name_of_album VARCHAR(40) UNIQUE NOT NULL,
	year_of_release INTEGER CHECK (year_of_release > 1960) NOT NULL
);
CREATE TABLE  IF NOT EXISTS musicians_album
(
	id_album INTEGER REFERENCES album_list(id_album),
	id_musician INTEGER REFERENCES list_of_musicians(id_musician),
	PRIMARY KEY(id_album, id_musician)
);
CREATE TABLE  IF NOT EXISTS track_list
(
	id_track  SERIAL PRIMARY KEY,
	name_of_track VARCHAR(80) UNIQUE NOT NULL,
	id_album INTEGER REFERENCES album_list(id_album),
	track_duration INTEGER CHECK (track_duration > 60)
);
CREATE TABLE  IF NOT EXISTS collection
(
	id_collection SERIAL PRIMARY KEY,
	name_of_collection VARCHAR(40) UNIQUE NOT NULL,
	year_of_release INTEGER CHECK (year_of_release > 1960) NOT NULL
);
CREATE TABLE  IF NOT EXISTS track_collection
(
	id_track INTEGER REFERENCES track_list(id_track),
	id_collection INTEGER REFERENCES collection(id_collection),
	PRIMARY KEY(id_track, id_collection)
);
