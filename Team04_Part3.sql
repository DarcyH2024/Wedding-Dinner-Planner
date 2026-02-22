-- Katheryn Umanzor and Darcy Harper
-- ITEC 3200 Fall 2024

USE section3_team04;

-- Query 1
-- Couples that have room number (100-104) OR room ID < 3
SELECT LastName AS "Couple",  Couple_ID AS "Couple ID"
	FROM couple
     WHERE  Couple_ID < 105
		OR RoomID < 3
        ORDER BY 1;

-- Query 2	
-- Set menus with an "o" in the main entree.         
SELECT MenuID AS "Menu Number" , concat(MainEntree, ' with ', Side) AS "Set Menu"
	FROM menu
  WHERE MainEntree LIKE '%o%'
  ORDER BY MenuID; 

-- Query 3
-- Lists Waiters with IDs 5 - 9 
  SELECT WaiterID AS "Waiter Number", concat(FirstName,' ', LastName) AS "Full Name" 
	FROM waiter
	WHERE WaiterID between 5 and 9
    ORDER BY 1;

-- Query 4    
-- Couples with their set menu and waiter IDs. Only displays the couples that have two sides.
     SELECT b.WaiterID AS "Waiter", a.LastName AS "Couple",
    concat(c.MainEntree, ' with ', c.Side, ' and ', c.Side2) AS "Menu", c.Appetizer AS 'Appetizers',
    c.Dessert AS 'Desserts' 
		FROM couple a JOIN waiter_has_room b
		ON a.RoomID = b.RoomID 
        JOIN menu c ON c.MenuID = a.MenuID
        WHERE c.side2 IS NOT NULL
        ORDER BY WaiterID desc;
        
-- Query 5        
-- The total amount of equipment in each room
SELECT	RoomID As "Room Number", Tables + Seats AS "Total equipment needed" 
	FROM room
    order by RoomID;
    
-- Query 6		
-- Number of rooms each waiter has    
 SELECT waiterID AS "Waiter ID", 
	count(roomID) AS "Number of Rooms"
	from waiter_has_room
    group by WaiterID
    order by WaiterID;

-- Query 7  
SELECT menuID as "Menu Number" , MainEntree , Side
	FROM menu
	WHERE side = 
    (SELECT side FROM menu WHERE menuID IN (123));
	
    

    
    

        
        