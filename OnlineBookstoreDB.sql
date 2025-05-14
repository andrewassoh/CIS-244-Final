CREATE DATABASE OnlineBookstoreDB;

CREATE TABLE authors (
   AuthorID int AUTO_INCREMENT PRIMARY KEY,
   AuthorFirstName varchar(255),
   AuthorLastName varchar(255)
);

CREATE TABLE bookauthors (
  BookID int,
  AuthorID int,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES authors(AuthorID)
);

CREATE TABLE books (
  BookID int AUTO_INCREMENT PRIMARY KEY,
  ISBN varchar(255),
  Title varchar(255),
  Binding enum('hardcover','paperback'),
  ListPrice double,
  PublishDate datetime,
  PublisherID int,
  SectionID int,
  FOREIGN KEY (PublisherID) REFERENCES publishers(PublisherID),
  FOREIGN KEY (SectionID) REFERENCES sections(SectionID)
);

CREATE TABLE customers (
  CustomerID int AUTO_INCREMENT PRIMARY KEY,
  CustomerFirstName varchar(255),
  CustomerLastName varchar(255),
  ShippingAddress varchar(255),
  BillingAddress varchar(255)
);

CREATE TABLE inventory (
  InventoryID int AUTO_INCREMENT PRIMARY KEY,
  BookID int,
  StockQuantity int,
  VendorID int,
  DateReceived datetime,
  LifetimeSales int,
  FOREIGN KEY (BookID) REFERENCES books(BookID),
  FOREIGN KEY (VendorID) REFERENCES vendors(VendorID)
);

CREATE TABLE invoiceitems (
  InvoiceID int,
  BookID int,
  PRIMARY KEY (InvoiceID, BookID),
  FOREIGN KEY (InvoiceID) REFERENCES invoices(InvoiceID),
  FOREIGN KEY (BookID) REFERENCES books(BookID)
);

CREATE TABLE invoices (
  InvoiceID int AUTO_INCREMENT PRIMARY KEY,
  OrderNumber int,
  CustomerID int,
  FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE publishers (
  PublisherID int AUTO_INCREMENT PRIMARY KEY,
  PublisherName varchar(255)
);

CREATE TABLE sections (
  SectionID int AUTO_INCREMENT PRIMARY KEY,
  SectionName enum('History', 'Children\'s', 'Young Adult', 'Mystery', 'Horror', 'Drama', 'Thriller', 'Science, Technology, & Math', 'Historical Fiction', 'Comics and Graphic Novel', 'Music') DEFAULT NULL
);

CREATE TABLE vendors (
  VendorID int AUTO_INCREMENT PRIMARY KEY,
  VendorName varchar(255)
);
