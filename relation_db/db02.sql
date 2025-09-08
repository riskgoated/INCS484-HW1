CREATE TABLE Person (
  person_id SERIAL PRIMARY KEY,
  name      VARCHAR(80) NOT NULL UNIQUE,
  phone     VARCHAR(20) NOT NULL
);

CREATE TABLE PlantType (
  plant_type_id SERIAL PRIMARY KEY,
  type_name     VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE Location (
  location_id    SERIAL PRIMARY KEY,
  name           VARCHAR(80) NOT NULL UNIQUE,
  sunlight_hours INT NOT NULL
);

CREATE TABLE Plant (
  plant_id        SERIAL PRIMARY KEY,
  plant_name      VARCHAR(80) NOT NULL UNIQUE,
  plant_type_id   INT NOT NULL REFERENCES PlantType(plant_type_id),
  location_id     INT NOT NULL REFERENCES Location(location_id),
  produces_food   BOOLEAN NOT NULL,
  days_alive      INT NOT NULL,
  water_person_id INT REFERENCES Person(person_id)
);

CREATE TABLE DayOfWeek (
  day_id   SERIAL PRIMARY KEY,
  day_name VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE PlantWaterDay (
  plant_id INT NOT NULL REFERENCES Plant(plant_id) ON DELETE CASCADE,
  day_id   INT NOT NULL REFERENCES DayOfWeek(day_id),
  PRIMARY KEY (plant_id, day_id)
);
