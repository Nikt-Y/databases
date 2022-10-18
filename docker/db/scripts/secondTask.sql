CREATE TABLE "stationPersonel" (
  "pers_nr" SERIAL PRIMARY KEY,
  "name_num" int,
  "station" int
);

CREATE TABLE "caregiver" (
  "pers_nr" SERIAL PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctor" (
  "pers_nr" SERIAL PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "patient" (
  "patient_nr" SERIAL PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "doctor" int
);

CREATE TABLE "room" (
  "room_nr" SERIAL PRIMARY KEY,
  "beds_num" int,
  "station" int
);

CREATE TABLE "station" (
  "stat_nr" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "admission" (
  "id" SERIAL PRIMARY KEY,
  "patient" int,
  "room" int,
  "from_date" timestamp,
  "to_date" timestamp
);

ALTER TABLE "stationPersonel" ADD FOREIGN KEY ("station") REFERENCES "station" ("stat_nr");

ALTER TABLE "patient" ADD FOREIGN KEY ("doctor") REFERENCES "doctor" ("pers_nr");

ALTER TABLE "room" ADD FOREIGN KEY ("station") REFERENCES "station" ("stat_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient") REFERENCES "patient" ("patient_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("room") REFERENCES "room" ("room_nr");