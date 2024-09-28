ALTER TABLE [dbo].[Books]
ADD [PictureUrl] NVARCHAR(500) NULL;

UPDATE [dbo].[Books]
SET [PictureUrl] = 
    CASE [Title]
        WHEN 'The Time that Remains' THEN 'Images/dummy1.jpg'
        WHEN 'In the Sands of Babylon' THEN 'Images/dummy2.jpg'
        WHEN 'Theeb' THEN 'Images/dummy3.jpg'
        WHEN 'The Traveller' THEN 'Images/dummy4.jpg'

        WHEN 'The Message' THEN 'Images/dummy1.jpg'
        WHEN 'Omar' THEN 'Images/dummy2.jpg'
        WHEN 'Paradise Now' THEN 'Images/dummy3.jpg'
        WHEN 'Captain Abu Raed' THEN 'Images/dummy4.jpg'

        WHEN 'Zinzana' THEN 'Images/dummy1.jpg'
        WHEN 'West Beirut' THEN 'Images/dummy2.jpg'
        WHEN 'Asmaa' THEN 'Images/dummy3.jpg'
        WHEN 'Capernaum' THEN 'Images/dummy4.jpg'

        WHEN 'Caramel' THEN 'Images/dummy1.jpg'
        WHEN 'The Blue Elephant' THEN 'Images/dummy2.jpg'
        WHEN 'Clash' THEN 'Images/dummy3.jpg'
        WHEN 'Barakah Meets Barakah' THEN 'Images/dummy4.jpg'

        WHEN 'Wadjda' THEN 'Images/dummy1.jpg'
        WHEN 'Timbuktu' THEN 'Images/dummy2.jpg'
        WHEN 'The Battle of Algiers' THEN 'Images/dummy3.jpg'
        WHEN 'The Night of Counting the Years' THEN 'Images/dummy4.jpg'

        WHEN 'The Nile Hilton Incident' THEN 'Images/dummy1.jpg'
        WHEN 'Rattle the Cage' THEN 'Images/dummy2.jpg'
        WHEN 'The Insult' THEN 'Images/dummy3.jpg'
        WHEN 'Omar' THEN 'Images/dummy4.jpg' 

        WHEN 'For Sama' THEN 'Images/dummy1.jpg'
        WHEN 'The Cave' THEN 'Images/dummy2.jpg'
        WHEN 'Five Broken Cameras' THEN 'Images/dummy3.jpg'
        WHEN 'The Square' THEN 'Images/dummy4.jpg'
    END
WHERE [PictureUrl] IS NULL;
