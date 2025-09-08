CREATE TABLE Manufacturer (
  manufacturer_id  SERIAL PRIMARY KEY,
  name             VARCHAR(100) NOT NULL UNIQUE,
  street           VARCHAR(120) NOT NULL,
  suite            VARCHAR(40),
  city             VARCHAR(80)  NOT NULL,
  state            CHAR(2)      NOT NULL,
  zip              VARCHAR(10)  NOT NULL
);

CREATE TABLE StorageBox (
  box_id        VARCHAR(10) PRIMARY KEY,
  description   VARCHAR(100) NOT NULL
);

CREATE TABLE Item (
  item_id           INT PRIMARY KEY,
  item_name         VARCHAR(200) NOT NULL,
  manufacturer_id   INT NOT NULL REFERENCES Manufacturer(manufacturer_id),
  box_id            VARCHAR(10) NOT NULL REFERENCES StorageBox(box_id),
  cost_usd          DECIMAL(10,2) NOT NULL,
  current_value_usd DECIMAL(10,2) NOT NULL
);
