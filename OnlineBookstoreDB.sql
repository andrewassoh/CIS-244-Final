CREATE DATABASE OnlineBookstoreDB;

CREATE TABLE `authors` (
   `AuthorID` int PRIMARY KEY,
   `AuthorFirstName` varchar(255) DEFAULT NULL,
   `AuthorLastName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `bookauthors` (
  `BookID` int PRIMARY KEY,
  `AuthorID` int PRIMARY KEY,
  FOREIGN KEY (BookID) REFERENCES books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES authors(AuthorID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `books` (
  `BookID` int PRIMARY KEY,
  `ISBN` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Binding` enum('hardcover','paperback') DEFAULT NULL,
  `ListPrice` double DEFAULT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `PublisherID` int DEFAULT NULL,
  `SectionID` int DEFAULT NULL,
  FOREIGN KEY (PublisherID) REFERENCES publishers(PublisherID),
  FOREIGN KEY (SectionID) REFERENCES sections(SectionID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customers` (
  `CustomerID` int PRIMARY KEY,
  `CustomerFirstName` varchar(255) DEFAULT NULL,
  `CustomerLastName` varchar(255) DEFAULT NULL,
  `ShippingAddress` varchar(255) DEFAULT NULL,
  `BillingAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `inventory` (
  `InventoryID` int PRIMARY KEY,
  `BookID` int DEFAULT NULL,
  `StockQuantity` int DEFAULT NULL,
  `VendorID` int DEFAULT NULL,
  `DateReceived` datetime DEFAULT NULL,
  `LifetimeSales` int DEFAULT NULL,
  FOREIGN KEY (BookID) REFERENCES books(BookID),
  FOREIGN KEY (VendorID) REFERENCES vendors(VendorID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoiceitems` (
  `InvoiceID` int PRIMARY KEY,
  `BookID` int PRIMARY KEY,
  FOREIGN KEY (InvoiceID) REFERENCES invoices(InvoiceID),
  FOREIGN KEY (BookID) REFERENCES books(BookID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoices` (
  `InvoiceID` int PRIMARY KEY,
  `OrderNumber` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `publishers` (
  `PublisherID` int PRIMARY KEY,
  `PublisherName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sections` (
  `SectionID` int PRIMARY KEY,
  `SectionName` enum('History', 'Children\'s', 'Young Adult', 'Mystery', 'Horror', 'Drama', 'Thriller', 'Science, Technology, & Math', 'Historical Fiction', 'Comics and Graphic Novel', 'Music') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vendors` (
  `VendorID` int PRIMARY KEY,
  `VendorName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
