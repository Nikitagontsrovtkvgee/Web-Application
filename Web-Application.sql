CREATE TABLE kontsert (
    konsertID INT IDENTITY(1,1) PRIMARY KEY,
    kontsertinimi NVARCHAR(50) NOT NULL,
    žanr NVARCHAR(50) NOT NULL
);

CREATE TABLE kontsertideTegevused (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Aeg TIME(7),
    Kasutaja NVARCHAR(50),
    Toiming DATETIME2(7),
    Andmed NVARCHAR(50),
    konsertID INT NOT NULL,
    CONSTRAINT FK_kontsertideTegevused_Kontsert FOREIGN KEY (konsertID)
        REFERENCES kontsert(konsertID)
);

ALTER TABLE kontsertLogi
DROP CONSTRAINT FK_Logi_Kontsert;

ALTER TABLE kontsertLogi
ADD CONSTRAINT FK_kontsertLogi_Kontsert
FOREIGN KEY (konsertID) REFERENCES kontsert(konsertID);

EXEC sp_rename 'logi', 'kontsertideTegevused';


DELETE FROM kontsert;

INSERT INTO kontsert (kontsertinimi, žanr)
VALUES 
('Rock kontsert', 'Rock'),
('Jazz õhtu', 'Jazz'),
('Pop muusika', 'Pop');


INSERT INTO kontsertideTegevused (aeg, kasutaja, toiming, andmed, konsertID)
VALUES
('18:00', 'admin', GETDATE(), 'Lisa kontsert', 1),
('20:00', 'user1', GETDATE(), 'Kontserdi külastus', 2),
('19:30', 'user2', GETDATE(), 'Kontsert algas', 3);

SELECT * FROM kontsertideTegevused;
