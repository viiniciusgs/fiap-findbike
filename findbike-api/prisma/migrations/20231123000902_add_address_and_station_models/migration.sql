-- CreateTable
CREATE TABLE "Address" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "postalCode" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "latitude" REAL NOT NULL,
    "longitude" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Station" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "addressId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Station_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
