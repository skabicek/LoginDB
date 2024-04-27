            ----- SEQUENCES -----


CREATE SEQUENCE UserID_Seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE Address_Seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE Logins_Seq START WITH 1 INCREMENT BY 1;


            ----- TABLES -----


CREATE TABLE Address (
    id NUMBER constraint pk_addressid primary key,
    Country VARCHAR2(50) CONSTRAINT country_notnull NOT NULL,
    City VARCHAR2(50) CONSTRAINT city_notnull NOT NULL,
    Street VARCHAR2(50),
    PostalCode VARCHAR2(15) CONSTRAINT psn_notnull NOT NULL
);

CREATE TABLE Users (
    id NUMBER constraint pk_userid primary key,
    Email VARCHAR2(100),
    RegistrationDate DATE,
    AddressID NUMBER,
    FOREIGN KEY (AddressID) REFERENCES Address(id)
);

CREATE TABLE LoginCredentials (
    UserID NUMBER PRIMARY KEY,
    Username VARCHAR2(50) UNIQUE CONSTRAINT username_notnull NOT NULL,
    Password VARCHAR2(50) CONSTRAINT chk_password_length CHECK (LENGTH(Password) >= 8),
    FOREIGN KEY (UserID) REFERENCES Users(ID) ON DELETE CASCADE
);

CREATE TABLE Logins (
    id NUMBER constraint pk_loginid primary key,
    UserID NUMBER,
    FOREIGN KEY (UserID) REFERENCES Users(id),
    LoginTime TIMESTAMP
);


            ----- TRIGGERS -----


-- Trigger 1

CREATE OR REPLACE TRIGGER users_set_id BEFORE INSERT ON Users FOR EACH ROW
BEGIN
  SELECT UserID_Seq.nextval INTO :new.id FROM dual;
END;
/


-- Trigger 2

CREATE OR REPLACE TRIGGER address_set_id BEFORE INSERT ON Address FOR EACH ROW
BEGIN
  SELECT Address_Seq.nextval INTO :new.id FROM dual;
END;
/


-- Trigger 3

CREATE OR REPLACE TRIGGER logins_set_id BEFORE INSERT ON Logins FOR EACH ROW
BEGIN
  SELECT Logins_Seq.nextval INTO :new.id FROM dual;
END;
/


            ----- TESTING DATA -----


INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('Czech Republic', 'Prague', 'Main Street 1', '12345');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('Czech Republic', 'Brno', 'Oak Street 2', '23456');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('Czech Republic', 'Ostrava', 'Maple Street 3', '34567');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('Germany', 'Berlin', 'Schlossallee 4', '98765');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('France', 'Paris', 'Rue de la Paix 5', '54321');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('Italy', 'Rome', 'Via Roma 6', '67890');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('Spain', 'Madrid', 'Calle de la Cruz 7', '45678');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('United Kingdom', 'London', 'Baker Street 8', '34567');
INSERT INTO Address (Country, City, Street, PostalCode) VALUES
('Japan', 'Tokyo', 'Shibuya Crossing 153', '78901');


INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user1@example.com', TO_DATE('2024-02-01', 'YYYY-MM-DD'), 1);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user2@example.com', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 2);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user3@example.com', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 3);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user4@example.com', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 4);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user5@example.com', TO_DATE('2024-01-20', 'YYYY-MM-DD'), 5);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user6@example.com', TO_DATE('2024-01-25', 'YYYY-MM-DD'), 6);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user7@example.com', TO_DATE('2024-01-30', 'YYYY-MM-DD'), 7);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user8@example.com', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 8);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user9@example.com', TO_DATE('2024-02-05', 'YYYY-MM-DD'), 9);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user10@example.com', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 1);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user11@example.com', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 2);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user12@example.com', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 3);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user13@example.com', TO_DATE('2024-02-25', 'YYYY-MM-DD'), 4);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user14@example.com', TO_DATE('2024-03-01', 'YYYY-MM-DD'), 5);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user15@example.com', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 6);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user16@example.com', TO_DATE('2024-02-10', 'YYYY-MM-DD'), 7);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user17@example.com', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 8);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user18@example.com', TO_DATE('2024-01-20', 'YYYY-MM-DD'), 9);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user19@example.com', TO_DATE('2024-02-25', 'YYYY-MM-DD'), 1);
INSERT INTO Users (Email, RegistrationDate, AddressID) VALUES
('user20@example.com', TO_DATE('2024-01-30', 'YYYY-MM-DD'), 2);

INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(1, 'user1', 'password1');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(2, 'user2', 'password2');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(3, 'user3', 'password3');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(4, 'user4', 'password4');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(5, 'user5', 'password5');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(6, 'user6', 'password6');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(7, 'user7', 'password7');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(8, 'user8', 'password8');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(9, 'user9', 'password9');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(10, 'user10', 'password10');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(11, 'user11', 'password11');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(12, 'user12', 'password12');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(13, 'user13', 'password13');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(14, 'user14', 'password14');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(15, 'user15', 'password15');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(16, 'user16', 'password16');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(17, 'user17', 'password17');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(18, 'user18', 'password18');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(19, 'user19', 'password19');
INSERT INTO LoginCredentials (UserID, Username, Password) VALUES
(20, 'user20', 'password20');


INSERT INTO Logins (UserID, LoginTime) VALUES (1, TIMESTAMP '2024-03-18 02:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (2, TIMESTAMP '2024-03-26 19:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (3, TIMESTAMP '2024-03-13 20:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (4, TIMESTAMP '2024-03-29 13:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (5, TIMESTAMP '2024-03-12 10:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (6, TIMESTAMP '2024-03-18 08:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (7, TIMESTAMP '2024-04-07 11:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (8, TIMESTAMP '2024-03-04 02:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (9, TIMESTAMP '2024-03-11 06:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (10, TIMESTAMP '2024-03-13 10:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (11, TIMESTAMP '2024-03-25 20:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (12, TIMESTAMP '2024-04-15 04:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (13, TIMESTAMP '2024-04-03 11:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (14, TIMESTAMP '2024-04-05 05:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (15, TIMESTAMP '2024-04-03 00:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (16, TIMESTAMP '2024-03-26 03:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (17, TIMESTAMP '2024-04-12 01:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (18, TIMESTAMP '2024-03-08 02:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (19, TIMESTAMP '2024-03-18 02:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (20, TIMESTAMP '2024-03-08 12:00:00.000000');

INSERT INTO Logins (UserID, LoginTime) VALUES (1, TIMESTAMP '2024-03-05 08:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (18, TIMESTAMP '2024-03-08 20:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (12, TIMESTAMP '2024-03-14 03:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (3, TIMESTAMP '2024-03-17 12:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (1, TIMESTAMP '2024-03-20 06:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (2, TIMESTAMP '2024-03-25 14:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (2, TIMESTAMP '2024-03-29 18:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (12, TIMESTAMP '2024-04-02 21:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (2, TIMESTAMP '2024-04-06 04:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (1, TIMESTAMP '2024-04-11 10:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (5, TIMESTAMP '2024-04-15 16:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (16, TIMESTAMP '2024-04-02 22:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (10, TIMESTAMP '2024-04-14 02:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (17, TIMESTAMP '2024-04-15 08:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (17, TIMESTAMP '2024-03-03 12:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (11, TIMESTAMP '2024-04-08 02:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (4, TIMESTAMP '2024-04-12 06:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (7, TIMESTAMP '2024-03-16 14:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (14, TIMESTAMP '2024-03-20 18:00:00.000000');
INSERT INTO Logins (UserID, LoginTime) VALUES (20, TIMESTAMP '2024-03-24 22:00:00.000000');


            ----- SELECT COMMANDS -----


-- Select 1: selects users from the Czech Republic who have logged in more than 2 times in the last month

SELECT
    u.id AS UserID,
    COUNT(l.id) AS LoginCount
FROM Users u
JOIN Address a ON u.AddressID = a.id
JOIN Logins l ON u.id = l.UserID
WHERE a.Country = 'Czech Republic' AND l.LoginTime >= ADD_MONTHS(SYSDATE, -1)
GROUP BY u.id
HAVING COUNT(l.id) > 2;


-- Select 2: selects and orders amount of logins grouped by country

SELECT 
    a.Country,
    COUNT(l.id) AS LoginCount
FROM 
    Users u
JOIN 
    Address a ON u.AddressID = a.id
JOIN 
    Logins l ON u.id = l.UserID
GROUP BY 
    a.Country
ORDER BY 
    COUNT(l.id) DESC;


-- Select 3: query that counts the total number of logins for each month, sorts the results in descending order, and filters out the months where the number of logins is zero

SELECT
    TO_CHAR(l.LoginTime, 'MM/YYYY') AS MonthYear,
    COUNT(*) AS NumberOfLogins
FROM
    Logins l
GROUP BY
    TO_CHAR(l.LoginTime, 'MM/YYYY')
HAVING
    COUNT(*) > 0
ORDER BY
    NumberOfLogins DESC;



            ----- BLOCK WITH CURSOR -----


-- PL/SQL block that uses a cursor to iterate through the logins of all persons from the Czech Republic and adds 'p_threshold' hours to each login time


CREATE OR REPLACE PROCEDURE UpdateLoginTimes(p_threshold NUMBER) IS
    CURSOR c_logins IS
        SELECT
            l.id,
            l.LoginTime
        FROM
            Logins l
            JOIN
            Users u ON l.UserID = u.id
            JOIN
            Address a ON u.AddressID = a.id
        WHERE
            a.Country = 'Czech Republic';
BEGIN
    -- Cursor to fetch login IDs and times for users from Czech Republic
    FOR login_rec IN c_logins LOOP
        -- Update the login time in Logins table
        UPDATE Logins
        -- Add the specified number of hours to each login time
        SET LoginTime = login_rec.LoginTime + INTERVAL '1' HOUR * p_threshold
        WHERE id = login_rec.id;

        -- Output the updated login time
        DBMS_OUTPUT.PUT_LINE('Updated login time for login ID ' || login_rec.ID || ' to ' || TO_CHAR(login_rec.LOGINTIME, 'YYYY-MM-DD HH24:MI:SS'));
    END LOOP;
END;
/


-- CALLING PROCEDURE WITH PARAMETER p_threshold = 2

CALL UPDATELOGINTIMES(2);

