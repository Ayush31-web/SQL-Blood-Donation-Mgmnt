CREATE TABLE Donor (
    DonorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    BloodGroup VARCHAR(5),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

CREATE TABLE Donation (
    DonationID INT PRIMARY KEY AUTO_INCREMENT,
    DonorID INT,
    DonationDate DATE,
    BloodGroup VARCHAR(5),
    Quantity INT, -- in ml
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID)
);

CREATE TABLE Recipient (
    RecipientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    BloodGroup VARCHAR(5),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

CREATE TABLE BloodRequest (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    RecipientID INT,
    RequestDate DATE,
    BloodGroup VARCHAR(5),
    Quantity INT, -- in ml
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (RecipientID) REFERENCES Recipient(RecipientID)
);

-- Insert into Donor
INSERT INTO Donor (FirstName, LastName, Gender, DOB, BloodGroup, ContactNumber, Email, Address)
VALUES ('Anisha', 'S', 'Male', '1990-05-15', 'O+', '1234567890', 'anisha.s@example.com', '4 , Delhi');

-- Insert into Donation
INSERT INTO Donation (DonorID, DonationDate, BloodGroup, Quantity)
VALUES (1, '2024-12-01', 'O+', 500);

-- Insert into Recipient
INSERT INTO Recipient (FirstName, LastName, Gender, BloodGroup, ContactNumber, Email, Address)
VALUES ('Ayush', 'Kash', 'Female', 'A+', '0987654321', 'ayush.k@example.com', '5 , Bengaluru');

-- Insert into BloodRequest
INSERT INTO BloodRequest (RecipientID, RequestDate, BloodGroup, Quantity)
VALUES (1, '2024-12-02', 'A+', 300);



-- Retrieve all donor
 SELECT * FROM Donor;

-- Check total blood donated by group
SELECT BloodGroup, SUM(Quantity) AS TotalQuantity
FROM Donation
GROUP BY BloodGroup;

-- Get Pending Blood Requests
SELECT R.FirstName, R.LastName, B.RequestDate, B.BloodGroup, B.Quantity
FROM BloodRequest B
JOIN Recipient R ON B.RecipientID = R.RecipientID
WHERE B.Status = 'Pending';

