-- Team #4: Katheryn Uzmanzor, Darcy Harper
-- ITEC 3200
-- This database is designed for a restaurant that hosts dinners for newlyweds. It keeps track of which couple is assigned to each room, along with the menu items they want served, and
-- their phone numbers for further communication about the details. Rooms are set up with the amount of tables and seats required to host each dinner. The database also manages
-- waiters' room assignments with each room potentially containing multiple waiters, depending on the size of each dinner hosted.

DROP SCHEMA IF EXISTS Section3_Team04;
CREATE SCHEMA Section3_Team04;
USE Section3_Team04;

CREATE TABLE Menu(
MenuID INT,
MainEntree VARCHAR(45) NOT NULL,
Appetizer VARCHAR(45),
Side VARCHAR(45) NOT NULL,
Side2 VARCHAR(45),
Dessert VARCHAR(45),
CONSTRAINT PRIMARY KEY(MenuID)); 

INSERT INTO Menu VALUES (123, 'Chicken Parmesan', 'Garlic Knots', 'Green Beans', 'Mashed Potatos', 'Tiramisu');
INSERT INTO Menu VALUES (124, 'Maple Salmon', NULL, 'Brown Rice', 'Mixed Vegetables', 'German Chocolate Cake');
INSERT INTO Menu VALUES (125, 'Sirloin Steak', 'House Salad', 'Loaded Baked Potatos', NULL, 'Banana Pudding');
INSERT INTO Menu VALUES (126, 'Beef Lasagna', NULL, 'Gnocchi Soup', 'Caesar Salad', NULL);
INSERT INTO Menu VALUES (127, 'Grilled Chicken Breast', NULL, 'Asparagus', NULL, NULL);
INSERT INTO Menu VALUES (128, 'Shrimp Scampi', 'Garlic Bread', 'Green Beans', NULL, 'Raspberry Cheesecake');
INSERT INTO Menu VALUES (129, 'Meatloaf', NULL, 'Garlic Mashed Potatos', 'Roasted Carrots', 'Peach Pie');

CREATE TABLE Room(
RoomID INT,
Tables INT NOT NULL,
Seats INT NOT NULL,
CONSTRAINT PRIMARY KEY(RoomID));

INSERT INTO Room VALUES(1, 5, 40);
INSERT INTO Room VALUES(2, 8, 64);
INSERT INTO Room VALUES(3, 7, 35);
INSERT INTO Room VALUES(4, 5, 41);
INSERT INTO Room VALUES(5, 6, 48);
INSERT INTO Room VALUES(6, 7, 38);
INSERT INTO Room VALUES(7, 8, 64);

CREATE TABLE Waiter(
WaiterID INT,
FirstName VARCHAR(45) NOT NULL,
LastName VARCHAR(45),
CONSTRAINT PRIMARY KEY(WaiterID));

INSERT INTO Waiter VALUES(1,'Charlie', 'Johnson');
INSERT INTO Waiter VALUES(2, 'Sarah', 'Martin');
INSERT INTO Waiter VALUES(3, 'Charlotte', 'Newton');
INSERT INTO Waiter VALUES(4, 'Gary', 'Spellmen');
INSERT INTO Waiter VALUES(5,'Kyle', 'Burt');
INSERT INTO Waiter VALUES(6, 'Lydia', 'Porter');
INSERT INTO Waiter VALUES(7, 'Alex', 'Amos');
INSERT INTO Waiter VALUES(8, 'Adam', 'Ramsey');
INSERT INTO Waiter VALUES(9, 'Katy', 'Woods');
INSERT INTO Waiter VALUES(10, 'Carter', 'Newton');


CREATE TABLE Waiter_has_Room(
WaiterID INT,
RoomID INT,
CONSTRAINT FOREIGN KEY(WaiterID) REFERENCES Waiter(WaiterID),
CONSTRAINT FOREIGN KEY(RoomID) REFERENCES Room(RoomID));

INSERT INTO Waiter_has_Room VALUES(1, 1);
INSERT INTO Waiter_has_Room VALUES(2, 4);
INSERT INTO Waiter_has_Room VALUES(3, 2);
INSERT INTO Waiter_has_Room VALUES(4, 3);
INSERT INTO Waiter_has_Room VALUES(5, 7);
INSERT INTO Waiter_has_Room VALUES(6, 5);
INSERT INTO Waiter_has_Room VALUES(7, 6);
INSERT INTO Waiter_has_Room VALUES(8, 1);
INSERT INTO Waiter_has_Room VALUES(9, 7);
INSERT INTO Waiter_has_Room VALUES(10, 4);
INSERT INTO Waiter_has_Room VALUES(1, 3);
INSERT INTO Waiter_has_Room VALUES(10, 6);
INSERT INTO Waiter_has_Room VALUES(2, 5);
INSERT INTO Waiter_has_Room VALUES(3, 2);
INSERT INTO Waiter_has_Room VALUES(8, 2);



CREATE TABLE Couple(
Couple_ID INT,
LastName VARCHAR(45),
PhoneNumber VARCHAR(10),
MenuID INT,
RoomID INT,
CONSTRAINT PRIMARY KEY(Couple_ID),
CONSTRAINT FOREIGN KEY(MenuID) REFERENCES Menu(MenuID),
CONSTRAINT FOREIGN KEY(RoomID) REFERENCES Room(RoomID));

INSERT INTO Couple VALUES(100,'Harper-Firchow', '5675676789', 123, 1);
INSERT INTO Couple VALUES(101, 'Miller', '2342344567', 124, 2);
INSERT INTO Couple VALUES(102,'Henderson', '1231233456', 125, 3);
INSERT INTO Couple VALUES(103,'Park', '4564566789', 126, 4);
INSERT INTO Couple VALUES(104,'Rodriguez', '8004563456', 127, 5);
INSERT INTO Couple VALUES(105,'Smith', '4078005600', 128,  6);
INSERT INTO Couple VALUES(106,'Barlowe', '6784567890', 129, 7);
