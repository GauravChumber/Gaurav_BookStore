CREATE TABLE [dbo].[Genre] (
    [GenreID]   INT            IDENTITY (1, 1) NOT NULL,
    [GenreName] NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([GenreID] ASC)
);

CREATE TABLE [dbo].[Books] (
    [BookID]  INT             IDENTITY (1, 1) NOT NULL,
    [Title]   NVARCHAR (255)  NOT NULL,
    [Author]  NVARCHAR (255)  NOT NULL,
    [Price]   DECIMAL (18, 2) NOT NULL,
    [GenreID] INT             NULL,
    PRIMARY KEY CLUSTERED ([BookID] ASC)
);

INSERT INTO Genre (GenreName)
VALUES ('Scientific'), ('Action'), ('Mystery'), ('Romance'), ('Historical'), ('Thriller'), ('Cartoon');

INSERT INTO Books (Title, Author, Price, GenreID)
VALUES 
    ('The Time that Remains', 'Elia Suleiman', 19.99, 1),
    ('In the Sands of Babylon', 'Mohamed Al-Daradji', 14.99, 1),
    ('Theeb', 'Naji Abu Nowar', 13.99, 1),
    ('The Traveller', 'Ahmed Maher', 17.99, 1),

    ('The Message', 'Moustapha Akkad', 15.99, 2),
    ('Omar', 'Hany Abu-Assad', 10.99, 2),
    ('Paradise Now', 'Hany Abu-Assad', 20.99, 2),
    ('Captain Abu Raed', 'Amin Matalqa', 12.99, 2),

    ('Zinzana', 'Majid Al Ansari', 14.99, 3),
    ('West Beirut', 'Ziad Doueiri', 13.99, 3),
    ('Asmaa', 'Amr Salama', 12.99, 3),
    ('Capernaum', 'Nadine Labaki', 25.99, 3),

    ('Caramel', 'Nadine Labaki', 9.99, 4),
    ('The Blue Elephant', 'Marwan Hamed', 11.99, 4),
    ('Clash', 'Mohamed Diab', 13.99, 4),
    ('Barakah Meets Barakah', 'Mahmoud Sabbagh', 14.99, 4),

    ('Wadjda', 'Haifaa Al-Mansour', 16.99, 5),
    ('Timbuktu', 'Abderrahmane Sissako', 14.99, 5),
    ('The Battle of Algiers', 'Gillo Pontecorvo', 13.99, 5),
    ('The Night of Counting the Years', 'Shadi Abdel Salam', 22.99, 5),

    ('The Nile Hilton Incident', 'Tarik Saleh', 13.99, 6),
    ('Rattle the Cage', 'Majid Al Ansari', 12.99, 6),
    ('The Insult', 'Ziad Doueiri', 15.99, 6),
    ('Omar', 'Hany Abu-Assad', 10.99, 6),

    ('For Sama', 'Waad Al-Kateab', 18.99, 7),
    ('The Cave', 'Feras Fayyad', 16.99, 7),
    ('Five Broken Cameras', 'Emad Burnat', 20.99, 7),
    ('The Square', 'Jehane Noujaim', 15.99, 7);

