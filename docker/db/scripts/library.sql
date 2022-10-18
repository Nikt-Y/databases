CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "year" int,
  "title" varchar,
  "author" varchar,
  "page_num" int,
  "publisher" varchar
);

CREATE TABLE "publisher" (
  "pub_name" varchar PRIMARY KEY,
  "address" varchar
);

CREATE TABLE "copy" (
  "copy_num" int PRIMARY KEY,
  "ISBN" int,
  "shelf_place" varchar
);

CREATE TABLE "reader" (
  "reader_id" int PRIMARY KEY,
  "address" varchar,
  "birthday" timestamp,
  "first_name" varchar,
  "last_name" varchar
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY
);

CREATE TABLE "borrow" (
  "id" SERIAL PRIMARY KEY,
  "copy_num" int,
  "reader_id" int,
  "return_date" timestamp
);

CREATE TABLE "bookCategory" (
  "id" SERIAL PRIMARY KEY,
  "ISBN" int,
  "name" varchar
);


CREATE TABLE "categoryTree" (
  "id" SERIAL PRIMARY KEY,
  "child" varchar,
  "parent" varchar
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher") REFERENCES "publisher" ("pub_name");

ALTER TABLE "copy" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "borrow" ADD FOREIGN KEY ("copy_num") REFERENCES "copy" ("copy_num");

ALTER TABLE "borrow" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("reader_id");

ALTER TABLE "bookCategory" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "bookCategory" ADD FOREIGN KEY ("name") REFERENCES "category" ("name");

ALTER TABLE "categoryTree" ADD FOREIGN KEY ("child") REFERENCES "category" ("name");

ALTER TABLE "categoryTree" ADD FOREIGN KEY ("parent") REFERENCES "category" ("name");