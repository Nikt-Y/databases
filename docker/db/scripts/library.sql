CREATE TABLE "Reader" (
  "ID" SERIAL PRIMARY KEY,
  "LastName" varchar,
  "FirstName" varchar,
  "Address" varchar,
  "BirthDate" varchar
);

CREATE TABLE "Book" (
  "ISBN" int PRIMARY KEY,
  "Title" varchar,
  "Author" varchar,
  "PagesNum" int,
  "PubYear" int,
  "PubName" varchar
);

CREATE TABLE "Publisher" (
  "PubName" varchar PRIMARY KEY,
  "PubAdress" varchar
);

CREATE TABLE "Category" (
  "CategoryName" varchar PRIMARY KEY,
  "ParentCat" varchar
);

CREATE TABLE "Copy" (
  "ISBN" int,
  "CopyNumber" int,
  "ShelfPosition" int,
  PRIMARY KEY ("ISBN", "CopyNumber")
);

CREATE TABLE "Borrowing" (
  "ReaderNr" int,
  "ISBN" int,
  "CopyNumber" int,
  "ReturnDate" date,
  PRIMARY KEY ("ISBN", "CopyNumber")
);

CREATE TABLE "BookCat" (
  "ISBN" int,
  "CategoryName" varchar,
  PRIMARY KEY ("ISBN", "CategoryName")
);

ALTER TABLE "Copy" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Book" ADD FOREIGN KEY ("PubName") REFERENCES "Publisher" ("PubName");

ALTER TABLE "Category" ADD FOREIGN KEY ("ParentCat") REFERENCES "Category" ("CategoryName");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("ReaderNr") REFERENCES "Reader" ("ID");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("ISBN") REFERENCES "Copy" ("ISBN");

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("CopyNumber") REFERENCES "Copy" ("CopyNumber");

ALTER TABLE "BookCat" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "BookCat" ADD FOREIGN KEY ("CategoryName") REFERENCES "Category" ("CategoryName");
