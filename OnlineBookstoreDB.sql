CREATE DATABASE OnlineBookstoreDB;

CREATE TABLE authors (
   AuthorID int AUTO_INCREMENT PRIMARY KEY,
   AuthorFirstName varchar(255) DEFAULT NULL,
   AuthorLastName varchar(255) DEFAULT NULL
);

CREATE TABLE bookauthors (
  BookID int AUTO_INCREMENT PRIMARY KEY,
  AuthorID int PRIMARY KEY,
  FOREIGN KEY (BookID) REFERENCES books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES authors(AuthorID)
);

CREATE TABLE books (
  BookID int AUTO_INCREMENT PRIMARY KEY,
  ISBN varchar(255) DEFAULT NULL,
  Title varchar(255) DEFAULT NULL,
  Binding enum('hardcover','paperback') DEFAULT NULL,
  ListPrice double DEFAULT NULL,
  PublishDate datetime DEFAULT NULL,
  PublisherID int DEFAULT NULL,
  SectionID int DEFAULT NULL,
  FOREIGN KEY (PublisherID) REFERENCES publishers(PublisherID),
  FOREIGN KEY (SectionID) REFERENCES sections(SectionID)
);

CREATE TABLE customers (
  CustomerID int AUTO_INCREMENT PRIMARY KEY,
  CustomerFirstName varchar(255) DEFAULT NULL,
  CustomerLastName varchar(255) DEFAULT NULL,
  ShippingAddress varchar(255) DEFAULT NULL,
  BillingAddress varchar(255) DEFAULT NULL
);

CREATE TABLE inventory (
  InventoryID int AUTO_INCREMENT PRIMARY KEY,
  BookID int DEFAULT NULL,
  StockQuantity int DEFAULT NULL,
  VendorID int DEFAULT NULL,
  DateReceived datetime DEFAULT NULL,
  LifetimeSales int DEFAULT NULL,
  FOREIGN KEY (BookID) REFERENCES books(BookID),
  FOREIGN KEY (VendorID) REFERENCES vendors(VendorID)
);

CREATE TABLE invoiceitems (
  InvoiceID int AUTO_INCREMENT PRIMARY KEY,
  BookID int PRIMARY KEY,
  FOREIGN KEY (InvoiceID) REFERENCES invoices(InvoiceID),
  FOREIGN KEY (BookID) REFERENCES books(BookID)
);

CREATE TABLE invoices (
  InvoiceID int AUTO_INCREMENT PRIMARY KEY,
  OrderNumber int DEFAULT NULL,
  CustomerID int DEFAULT NULL,
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE publishers (
  PublisherID int AUTO_INCREMENT PRIMARY KEY,
  PublisherName varchar(255) DEFAULT NULL
);

CREATE TABLE sections (
  SectionID int AUTO_INCREMENT PRIMARY KEY,
  SectionName enum('History', 'Children\'s', 'Young Adult', 'Mystery', 'Horror', 'Drama', 'Thriller', 'Science, Technology, & Math', 'Historical Fiction', 'Comics and Graphic Novel', 'Music') DEFAULT NULL
);

CREATE TABLE vendors (
  VendorID int AUTO_INCREMENT PRIMARY KEY,
  VendorName varchar(255) DEFAULT NULL
);
