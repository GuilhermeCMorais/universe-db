--
-- PostgreSQL database dump
--

-- Create the database
CREATE DATABASE universe;

-- Connect to the database
\c universe;

-- Call the database
SELECT datname FROM pg_database WHERE datname = 'universe';

-- Create the galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    type TEXT NOT NULL,
    age NUMERIC NOT NULL,
    has_black_hole BOOLEAN NOT NULL
);

-- Create the star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    mass NUMERIC NOT NULL,
    is_main_sequence BOOLEAN NOT NULL
);

-- Create the planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    radius_km INT NOT NULL,
    has_life BOOLEAN NOT NULL
);

-- Create the moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    orbital_period_days NUMERIC NOT NULL,
    is_tidal_locked BOOLEAN NOT NULL
);

-- Create an additional table (e.g., asteroid)
CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    composition TEXT NOT NULL,
    diameter_km INT NOT NULL,
    is_potentially_hazardous BOOLEAN NOT NULL
);

-- Insert data into the galaxy table
INSERT INTO galaxy (name, type, age, has_black_hole) VALUES
('Milky Way', 'Spiral', 13.51, TRUE),
('Andromeda', 'Spiral', 10.00, TRUE),
('Triangulum', 'Spiral', 12.00, FALSE),
('Whirlpool', 'Spiral', 14.00, TRUE),
('Sombrero', 'Elliptical', 11.00, TRUE),
('Cartwheel', 'Lenticular', 9.00, FALSE);

-- Insert data into the star table
INSERT INTO star (name, galaxy_id, mass, is_main_sequence) VALUES
('Sun', 1, 1.0, TRUE),
('Sirius', 1, 2.1, TRUE),
('Betelgeuse', 1, 8.0, FALSE),
('Proxima Centauri', 1, 0.12, TRUE),
('Vega', 1, 2.15, TRUE),
('Rigel', 1, 17.0, FALSE);

-- Insert data into the planet table
INSERT INTO planet (name, star_id, radius_km, has_life) VALUES
('Mercury', 1, 2440, FALSE),
('Venus', 1, 6052, FALSE),
('Earth', 1, 6371, TRUE),
('Mars', 1, 3389, FALSE),
('Jupiter', 1, 69911, FALSE),
('Saturn', 1, 58232, FALSE),
('Uranus', 1, 25362, FALSE),
('Neptune', 1, 24622, FALSE),
('Proxima b', 4, 7150, FALSE),
('Kepler-22b', 6, 24600, FALSE),
('HD 209458 b', 5, 94620, FALSE),
('Gliese 581g', 4, 7500, FALSE);

-- Insert data into the moon table
INSERT INTO moon (name, planet_id, orbital_period_days, is_tidal_locked) VALUES
('Moon', 3, 27.3, TRUE),
('Phobos', 4, 0.3, TRUE),
('Deimos', 4, 1.3, TRUE),
('Io', 5, 1.8, TRUE),
('Europa', 5, 3.5, TRUE),
('Ganymede', 5, 7.1, TRUE),
('Callisto', 5, 16.7, TRUE),
('Titan', 6, 15.9, TRUE),
('Enceladus', 6, 1.4, TRUE),
('Mimas', 6, 0.9, TRUE),
('Triton', 8, 5.9, TRUE),
('Oberon', 7, 13.5, TRUE),
('Titania', 7, 8.7, TRUE),
('Ariel', 7, 2.5, TRUE),
('Umbriel', 7, 4.1, TRUE),
('Charon', 8, 6.4, TRUE),
('Nereid', 8, 360.1, FALSE),
('Proteus', 8, 27.6, FALSE),
('Dysnomia', 10, 15.8, TRUE),
('Kepler Moon-1', 11, 40.3, FALSE);

-- Insert data into the asteroid table
INSERT INTO asteroid (name, composition, diameter_km, is_potentially_hazardous) VALUES
('Ceres', 'Rock and Ice', 939, FALSE),
('Vesta', 'Rock', 525, FALSE),
('Eros', 'Silicate Rock', 34, TRUE);


--
-- PostgreSQL database dump complete
--

