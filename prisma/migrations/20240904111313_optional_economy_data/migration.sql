-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Economy" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "turnover" REAL,
    "unit" TEXT,
    "employees" INTEGER,
    "metadataId" INTEGER NOT NULL,
    CONSTRAINT "Economy_metadataId_fkey" FOREIGN KEY ("metadataId") REFERENCES "metadata" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Economy" ("employees", "id", "metadataId", "turnover", "unit") SELECT "employees", "id", "metadataId", "turnover", "unit" FROM "Economy";
DROP TABLE "Economy";
ALTER TABLE "new_Economy" RENAME TO "Economy";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;