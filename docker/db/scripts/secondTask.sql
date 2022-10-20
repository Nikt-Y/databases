CREATE TABLE "StationPersonel" (
  "PersNr" SERIAL PRIMARY KEY,
  "NameNum" int,
  "StationNr" int
);

CREATE TABLE "Caregiver" (
  "PersNr" SERIAL PRIMARY KEY,
  "Qualifications" varchar
);

CREATE TABLE "Doctor" (
  "ID" SERIAL PRIMARY KEY,
  "PersNr" int,
  "Area" varchar,
  "Rank" varchar
);

CREATE TABLE "Patient" (
  "PatientNr" SERIAL PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar,
  "DoctorID" int
);

CREATE TABLE "Admission" (
  "ID" SERIAL PRIMARY KEY,
  "PatientID" int,
  "RoomID" int,
  "From" date,
  "To" date
);

CREATE TABLE "Room" (
  "RoomNr" SERIAL PRIMARY KEY,
  "BedsNum" int,
  "StationNr" int
);

CREATE TABLE "Station" (
  "StationNr" SERIAL PRIMARY KEY,
  "Name" varchar
);

ALTER TABLE "StationPersonel" ADD FOREIGN KEY ("StationNr") REFERENCES "Station" ("StationNr");

ALTER TABLE "Caregiver" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonel" ("PersNr");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonel" ("PersNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("DoctorID") REFERENCES "Doctor" ("ID");

ALTER TABLE "Admission" ADD FOREIGN KEY ("PatientID") REFERENCES "Patient" ("PatientNr");

ALTER TABLE "Admission" ADD FOREIGN KEY ("RoomID") REFERENCES "Room" ("RoomNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("StationNr") REFERENCES "Station" ("StationNr");
