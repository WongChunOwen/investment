-- !preview conn=con

-- Drop the table if it exists
DROP TABLE IF EXISTS airlines CASCADE;

-- Create the airlines table with appropriate columns
CREATE TABLE airlines(
    carrier VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255)
);

-- Import data from the CSV file
COPY airlines
FROM 'C:/Users/phoin/Desktop/nycflights13/airlines.csv'
CSV HEADER;

-- Drop the table if it exists
DROP TABLE IF EXISTS airports CASCADE;

-- Create the airports table with appropriate columns
CREATE TABLE airports (
    faa VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    alt INT,
    tz INT,
    dst VARCHAR(1),
    tzone VARCHAR(255)
);

-- Import data from the CSV file
COPY airports(faa, name, lat, lon, alt, tz, dst, tzone)
FROM 'C:/Users/phoin/Desktop/nycflights13/airports.csv'
CSV HEADER;

-- Drop the table if it exists
DROP TABLE IF EXISTS flights CASCADE;

-- Create the flights table with appropriate columns
CREATE TABLE flights (
    year INT,
    month INT,
    day INT,
    dep_time INT,
    sched_dep_time INT,
    dep_delay INT,
    arr_time INT,
    sched_arr_time INT,
    arr_delay INT,
    carrier VARCHAR(255),
    flight INT,
    tailnum VARCHAR(255),
    origin VARCHAR(255),
    dest VARCHAR(255),
    air_time INT,
    distance INT,
    hour INT,
    minute INT,
    time_hour TIMESTAMP
);

-- Import data from the CSV file
COPY flights(year, month, day, dep_time, sched_dep_time, dep_delay, arr_time, sched_arr_time, arr_delay, carrier, flight, tailnum, origin, dest, air_time, distance, hour, minute, time_hour)
FROM 'C:/Users/phoin/Desktop/nycflights13/flights.csv'
CSV HEADER;


-- Drop the table if it exists
DROP TABLE IF EXISTS planes CASCADE;

-- Create the planes table with appropriate columns
CREATE TABLE planes (
    tailnum VARCHAR(255) PRIMARY KEY,
    year INT,
    type VARCHAR(255),
    manufacturer VARCHAR(255),
    model VARCHAR(255),
    engines INT,
    seats INT,
    speed INT,
    engine VARCHAR(255)
);

-- Import data from the CSV file
COPY planes(tailnum, year, type, manufacturer, model, engines, seats, speed, engine)
FROM 'C:/Users/phoin/Desktop/nycflights13/planes.csv'
CSV HEADER;


-- Drop the table if it exists
DROP TABLE IF EXISTS weather CASCADE;

-- Create the weather table with appropriate columns
CREATE TABLE weather (
    origin VARCHAR(255),
    year INT,
    month INT,
    day INT,
    hour INT,
    temp DOUBLE PRECISION,
    dewp DOUBLE PRECISION,
    humid DOUBLE PRECISION,
    wind_dir INT,
    wind_speed DOUBLE PRECISION,
    wind_gust DOUBLE PRECISION,
    precip DOUBLE PRECISION,
    pressure DOUBLE PRECISION,
    visib DOUBLE PRECISION,
    time_hour TIMESTAMP
);

-- Import data from the CSV file
COPY weather(origin, year, month, day, hour, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib, time_hour)
FROM 'C:/Users/phoin/Desktop/nycflights13/weather.csv'
CSV HEADER;
