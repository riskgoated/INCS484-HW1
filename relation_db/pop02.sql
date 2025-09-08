-- Populate DB
INSERT INTO Person (name, phone) VALUES
  ('Bob','913-875-0987'),
  ('Linda','913-876-0932');

INSERT INTO PlantType (type_name) VALUES
  ('Cactus'),
  ('Cayenne Pepper Plant'),
  ('Spider plant'),
  ('Tomato Plant');

INSERT INTO Location (name, sunlight_hours) VALUES
  ('Kitchen Counter',4),
  ('Front porch',6),
  ('Home Office',2);

INSERT INTO DayOfWeek (day_name) VALUES
  ('Monday'),('Tuesday'),('Wednesday'),('Thursday'),
  ('Friday'),('Saturday'),('Sunday');


INSERT INTO Plant (plant_name, plant_type_id, location_id, produces_food, days_alive, water_person_id)
VALUES (
  'Carl',
  (SELECT plant_type_id FROM PlantType WHERE type_name='Cactus'),
  (SELECT location_id   FROM Location  WHERE name='Kitchen Counter'),
  0,
  100,
  (SELECT person_id     FROM Person    WHERE name='Bob')
);

INSERT INTO Plant (plant_name, plant_type_id, location_id, produces_food, days_alive, water_person_id)
VALUES (
  'Chilly',
  (SELECT plant_type_id FROM PlantType WHERE type_name='Cayenne Pepper Plant'),
  (SELECT location_id   FROM Location  WHERE name='Front porch'),
  1,
  10,
  (SELECT person_id     FROM Person    WHERE name='Linda')
);

INSERT INTO Plant (plant_name, plant_type_id, location_id, produces_food, days_alive, water_person_id)
VALUES (
  'Spiderman',
  (SELECT plant_type_id FROM PlantType WHERE type_name='Spider plant'),
  (SELECT location_id   FROM Location  WHERE name='Home Office'),
  0,
  35,
  (SELECT person_id     FROM Person    WHERE name='Bob')
);

INSERT INTO Plant (plant_name, plant_type_id, location_id, produces_food, days_alive, water_person_id)
VALUES (
  'Planto the Plant',
  (SELECT plant_type_id FROM PlantType WHERE type_name='Tomato Plant'),
  (SELECT location_id   FROM Location  WHERE name='Front porch'),
  1,
  15,
  (SELECT person_id     FROM Person    WHERE name='Linda')
);

INSERT INTO PlantWaterDay (plant_id, day_id)
VALUES (
  (SELECT plant_id FROM Plant WHERE plant_name='Chilly'),
  (SELECT day_id   FROM DayOfWeek WHERE day_name='Monday')
);

INSERT INTO PlantWaterDay (plant_id, day_id)
SELECT (SELECT plant_id FROM Plant WHERE plant_name='Spiderman'),
       d.day_id
FROM DayOfWeek d
WHERE d.day_name IN ('Tuesday','Thursday');

INSERT INTO PlantWaterDay (plant_id, day_id)
SELECT (SELECT plant_id FROM Plant WHERE plant_name='Planto the Plant'),
       d.day_id
FROM DayOfWeek d
WHERE d.day_name IN ('Monday','Friday');