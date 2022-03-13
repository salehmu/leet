﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;

CREATE TABLE "Authors" (
    _id integer GENERATED BY DEFAULT AS IDENTITY,
    "Name" text NOT NULL,
    "Url" text NOT NULL,
    CONSTRAINT "PK_Authors" PRIMARY KEY (_id)
);

CREATE TABLE "Tags" (
    tag text NOT NULL,
    CONSTRAINT "PK_Tags" PRIMARY KEY (tag)
);

CREATE TABLE "Books" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "Title" text NOT NULL,
    "Description" text NOT NULL,
    "PublishedOn" timestamp with time zone NOT NULL,
    "Price" numeric NOT NULL,
    "ImageUrl" text NOT NULL,
    "BookAuthor_id" integer NOT NULL,
    CONSTRAINT "PK_Books" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Books_Authors_BookAuthor_id" FOREIGN KEY ("BookAuthor_id") REFERENCES "Authors" (_id) ON DELETE CASCADE
);

CREATE TABLE "BookTag" (
    "Tagstag" text NOT NULL,
    "booksId" integer NOT NULL,
    CONSTRAINT "PK_BookTag" PRIMARY KEY ("Tagstag", "booksId"),
    CONSTRAINT "FK_BookTag_Books_booksId" FOREIGN KEY ("booksId") REFERENCES "Books" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_BookTag_Tags_Tagstag" FOREIGN KEY ("Tagstag") REFERENCES "Tags" (tag) ON DELETE CASCADE
);

CREATE TABLE "Reviews" (
    "ReviewId" integer GENERATED BY DEFAULT AS IDENTITY,
    "WriterName" text NOT NULL,
    "ReviewText" text NOT NULL,
    "BookId" integer NULL,
    CONSTRAINT "PK_Reviews" PRIMARY KEY ("ReviewId"),
    CONSTRAINT "FK_Reviews_Books_BookId" FOREIGN KEY ("BookId") REFERENCES "Books" ("Id")
);

CREATE INDEX "IX_Books_BookAuthor_id" ON "Books" ("BookAuthor_id");

CREATE INDEX "IX_BookTag_booksId" ON "BookTag" ("booksId");

CREATE INDEX "IX_Reviews_BookId" ON "Reviews" ("BookId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20220310044207_q', '6.0.3');

COMMIT;

START TRANSACTION;

ALTER TABLE "Books" ADD fo integer NULL;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20220310044921_vxz', '6.0.3');

COMMIT;
