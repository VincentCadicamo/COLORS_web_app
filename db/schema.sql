CREATE TABLE IF NOT EXISTS Users (
    ID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL DEFAULT '',
    LastName  VARCHAR(50) NOT NULL DEFAULT '',
    Login     VARCHAR(50) NOT NULL DEFAULT '',
    Password  VARCHAR(50) NOT NULL DEFAULT '',
    PRIMARY KEY (ID)
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Colors (
    ID INT NOT NULL AUTO_INCREMENT,
    Name   VARCHAR(50) NOT NULL DEFAULT '',
    UserID INT NOT NULL DEFAULT 0,
    PRIMARY KEY (ID)
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Contacts (
    ID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL DEFAULT '',
    LastName  VARCHAR(50) NOT NULL DEFAULT '',
    Phone     VARCHAR(50) NOT NULL DEFAULT '',
    Email     VARCHAR(50) NOT NULL DEFAULT '',
    UserID INT NOT NULL DEFAULT 0,
    PRIMARY KEY (ID)
    ) ENGINE = InnoDB;

INSERT INTO Users (FirstName,LastName,Login,Password)
SELECT * FROM (VALUES
    ROW('Aashish','Yadavally','AYadavally','COP4331'),
    ROW('Sam','Hill','SamH','Test'),
    ROW('Aashish','Yadavally','AYadavally','5832a71366768098cceb7095efb774f2'),
    ROW('Sam','Hill','SamH','0cbc6611f5540bd0809a388dc95a615b')
) AS seed
WHERE NOT EXISTS (SELECT 1 FROM Users);

INSERT INTO Colors (Name,UserID)
SELECT * FROM (VALUES
    ROW('Blue',1),ROW('White',1),ROW('Black',1),ROW('gray',1),ROW('Magenta',1),
    ROW('Yellow',1),ROW('Cyan',1),ROW('Salmon',1),ROW('Chartreuse',1),ROW('Lime',1),
    ROW('Light Blue',1),ROW('Light Gray',1),ROW('Light Red',1),ROW('Light Green',1),
    ROW('Chiffon',1),ROW('Fuscia',1),ROW('Brown',1),ROW('Beige',1),
    ROW('Blue',3),ROW('White',3),ROW('Black',3),ROW('gray',3),ROW('Magenta',3),
    ROW('Yellow',3),ROW('Cyan',3),ROW('Salmon',3),ROW('Chartreuse',3),ROW('Lime',3),
    ROW('Light Blue',3),ROW('Light Gray',3),ROW('Light Red',3),ROW('Light Green',3),
    ROW('Chiffon',3),ROW('Fuscia',3),ROW('Brown',3),ROW('Beige',3)
) AS seed
WHERE NOT EXISTS (SELECT 1 FROM Colors);