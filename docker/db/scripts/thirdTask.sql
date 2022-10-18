CREATE TABLE "train"
(
    "train_nr"      SERIAL PRIMARY KEY,
    "length"        int,
    "start_station" varchar,
    "end_station"   varchar
);

CREATE TABLE "city"
(
    "region" varchar,
    "name"   varchar,
    PRIMARY KEY ("region", "name")
);

CREATE TABLE "trainStation"
(
    "station_name" varchar PRIMARY KEY,
    "track_num"    int,
    "region"       varchar,
    "city_name"    varchar
);

CREATE TABLE "connected"
(
    "id"                int PRIMARY KEY,
    "departure"         timestamp,
    "arrival"           timestamp,
    "train_nr"          int,
    "arrival_station"   varchar,
    "departure_station" varchar
);

ALTER TABLE "train"
    ADD FOREIGN KEY ("start_station") REFERENCES "trainStation" ("station_name");

ALTER TABLE "train"
    ADD FOREIGN KEY ("end_station") REFERENCES "trainStation" ("station_name");

ALTER TABLE "connected"
    ADD FOREIGN KEY ("train_nr") REFERENCES "train" ("train_nr");

ALTER TABLE "connected"
    ADD FOREIGN KEY ("arrival_station") REFERENCES "trainStation" ("station_name");

ALTER TABLE "connected"
    ADD FOREIGN KEY ("departure_station") REFERENCES "trainStation" ("station_name");

ALTER TABLE "trainStation"
    ADD FOREIGN KEY ("city_name", "region") REFERENCES "city" ("name", "region");