create database mydb;
use mydb;
-- Create Volunteer Table
CREATE TABLE Volunteer (
    VolunteerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Region VARCHAR(50)
);

-- Create Campaign Table
CREATE TABLE Campaign (
    CampaignID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    FundraisingGoal DECIMAL(10, 2)
);

-- Create Donor Table
CREATE TABLE Donor (
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);

-- Create EnvironmentalResource Table
CREATE TABLE EnvironmentalResource (
    ResourceID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50),
    Description TEXT
);

-- Create ClimateImpact Table
CREATE TABLE ClimateImpact (
    ImpactID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    SeverityLevel INT
);

-- Create AirQualityData Table
CREATE TABLE AirQualityData (
    DataID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(100) NOT NULL,
    NitrogenDioxideLevel DECIMAL(5, 2),
    SulfurDioxideLevel DECIMAL(5, 2),
    ParticulateMatterLevel DECIMAL(5, 2),
    MeasurementDate DATE
);

-- Create DeforestationRate Table
CREATE TABLE DeforestationRate (
    RateID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(100) NOT NULL,
    SatelliteImage BLOB,
    MeasurementDate DATE,
    DeforestationPercentage DECIMAL(5, 2)
);

-- Create VolunteerActivity Table
CREATE TABLE VolunteerActivity (
    ActivityID INT AUTO_INCREMENT PRIMARY KEY,
    VolunteerID INT,
    CampaignID INT,
    ActivityType VARCHAR(100),
    ActivityDate DATE,
    FOREIGN KEY (VolunteerID) REFERENCES Volunteer(VolunteerID),
    FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID)
);

-- Create CampaignDonor Table
CREATE TABLE CampaignDonor (
    DonationID INT AUTO_INCREMENT PRIMARY KEY,
    CampaignID INT,
    DonorID INT,
    DonationAmount DECIMAL(10, 2),
    DonationDate DATE,
    FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID),
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID)
);

-- Create CampaignResource Table
CREATE TABLE CampaignResource (
    CampaignID INT,
    ResourceID INT,
    PRIMARY KEY (CampaignID, ResourceID),
    FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID),
    FOREIGN KEY (ResourceID) REFERENCES EnvironmentalResource(ResourceID)
);

-- Create ResourceImpact Table
CREATE TABLE ResourceImpact (
    ResourceID INT,
    ImpactID INT,
    PRIMARY KEY (ResourceID, ImpactID),
    FOREIGN KEY (ResourceID) REFERENCES EnvironmentalResource(ResourceID),
    FOREIGN KEY (ImpactID) REFERENCES ClimateImpact(ImpactID)
);

-- Insert data into Volunteer
INSERT INTO Volunteer (Name, Age, Gender, Email, Phone, Region) VALUES
('Alice Johnson', 28, 'Female', 'alice.johnson@example.com', '1234567890', 'North America'),
('Bob Smith', 35, 'Male', 'bob.smith@example.com', '0987654321', 'Europe'),
('Cathy Lee', 22, 'Female', 'cathy.lee@example.com', '2345678901', 'Asia'),
('David Brown', 42, 'Male', 'david.brown@example.com', '3456789012', 'Africa'),
('Eva Green', 30, 'Female', 'eva.green@example.com', '4567890123', 'South America'),
('Frank White', 26, 'Male', 'frank.white@example.com', '5678901234', 'Australia'),
('Grace Black', 33, 'Female', 'grace.black@example.com', '6789012345', 'Europe'),
('Henry Adams', 29, 'Male', 'henry.adams@example.com', '7890123456', 'North America'),
('Ivy Clark', 40, 'Female', 'ivy.clark@example.com', '8901234567', 'Asia'),
('Jack Davis', 24, 'Male', 'jack.davis@example.com', '9012345678', 'Africa'),
('Karen Hill', 31, 'Female', 'karen.hill@example.com', '0123456789', 'South America'),
('Leo King', 38, 'Male', 'leo.king@example.com', '1234567809', 'Australia');

-- Insert data into Campaign
INSERT INTO Campaign (Name, Description, StartDate, EndDate, FundraisingGoal) VALUES
('Clean Air Initiative', 'Campaign to improve air quality', '2023-01-01', '2023-06-30', 10000.00),
('Save the Rainforests', 'Campaign to stop deforestation', '2023-02-15', '2023-08-15', 15000.00),
('Ocean Cleanup', 'Campaign to clean the oceans', '2023-03-10', '2023-09-10', 20000.00),
('Climate Action Now', 'Campaign to address climate change', '2023-04-20', '2023-10-20', 25000.00),
('Protect Endangered Species', 'Campaign to protect endangered species', '2023-05-05', '2023-11-05', 30000.00),
('Renewable Energy Advocacy', 'Campaign to promote renewable energy', '2023-06-01', '2023-12-01', 35000.00),
('Plastic Free Future', 'Campaign to reduce plastic waste', '2023-07-01', '2023-12-31', 40000.00),
('Water Conservation Efforts', 'Campaign to conserve water resources', '2023-08-01', '2024-01-31', 45000.00),
('Urban Green Spaces', 'Campaign to create green spaces in urban areas', '2023-09-01', '2024-02-28', 50000.00),
('Sustainable Agriculture', 'Campaign to promote sustainable farming practices', '2023-10-01', '2024-03-31', 55000.00),
('Wildlife Protection', 'Campaign to protect wildlife habitats', '2023-11-01', '2024-04-30', 60000.00),
('Climate Education', 'Campaign to educate the public on climate issues', '2023-12-01', '2024-05-31', 65000.00);
INSERT INTO Campaign (Name, StartDate, EndDate, FundraisingGoal, Description) 
VALUES ('wildlife saver', '2024-06-05', CURDATE(), 5000.00, 'This is a new campaign aimed at raising awareness about climate change.');
INSERT INTO Campaign (Name, StartDate, EndDate, FundraisingGoal, Description) 
VALUES ('wildlife saver', '2024-06-05', '2024-08-05', 5000.00, 'This is a new campaign aimed at raising awareness about climate change.');

-- Insert data into Donor
INSERT INTO Donor (Name, Email, Phone, Address) VALUES
('John Doe', 'john.doe@example.com', '1234509876', '123 Main St, Anytown, USA'),
('Jane Smith', 'jane.smith@example.com', '2345609876', '456 Oak St, Anytown, USA'),
('Mike Johnson', 'mike.johnson@example.com', '3456709876', '789 Pine St, Anytown, USA'),
('Sara Connor', 'sara.connor@example.com', '4567809876', '101 Maple St, Anytown, USA'),
('Chris Evans', 'chris.evans@example.com', '5678909876', '202 Elm St, Anytown, USA'),
('Patricia Brown', 'patricia.brown@example.com', '6789009876', '303 Cedar St, Anytown, USA'),
('George White', 'george.white@example.com', '7890109876', '404 Birch St, Anytown, USA'),
('Laura Black', 'laura.black@example.com', '8901209876', '505 Walnut St, Anytown, USA'),
('Kevin Green', 'kevin.green@example.com', '9012309876', '606 Cherry St, Anytown, USA'),
('Linda King', 'linda.king@example.com', '0123409876', '707 Spruce St, Anytown, USA'),
('David Lee', 'david.lee@example.com', '1234509987', '808 Aspen St, Anytown, USA'),
('Nancy Adams', 'nancy.adams@example.com', '2345609987', '909 Hickory St, Anytown, USA');
INSERT INTO Donor (Name, Email, Phone, Address) VALUES 
('Linda King', 'linda.king@example.com', '0123409876', '707 Spruce St, Anytown, USA'),
('David Lee', 'david.lee@example.com', '1234509987', '808 Aspen St, Anytown, USA'),
('Nancy Adams', 'nancy.adams@example.com', '2345609987', '909 Hickory St, Anytown, USA');
-- Insert data into EnvironmentalResource
INSERT INTO EnvironmentalResource (Name, Type, Description) VALUES
('Air', 'Atmosphere', 'Air quality and atmospheric conditions'),
('Water', 'Hydrosphere', 'Water bodies and their conditions'),
('Soil', 'Lithosphere', 'Soil quality and land conditions'),
('Wildlife', 'Biosphere', 'Flora and fauna biodiversity'),
('Forests', 'Terrestrial Ecosystem', 'Forest cover and health'),
('Oceans', 'Marine Ecosystem', 'Ocean health and marine life'),
('Rivers', 'Freshwater Ecosystem', 'River health and freshwater life'),
('Mountains', 'Terrestrial Ecosystem', 'Mountain ecosystems and health'),
('Urban Areas', 'Anthropogenic', 'Urban environmental conditions'),
('Rural Areas', 'Anthropogenic', 'Rural environmental conditions'),
('Deserts', 'Terrestrial Ecosystem', 'Desert ecosystems and health'),
('Wetlands', 'Terrestrial Ecosystem', 'Wetland ecosystems and health');

-- Insert data into ClimateImpact
INSERT INTO ClimateImpact (Name, Description, SeverityLevel) VALUES
('Global Warming', 'Increase in Earth’s average temperature', 10),
('Ocean Acidification', 'Decrease in pH levels of the Earth’s oceans', 9),
('Sea Level Rise', 'Increase in the level of the world’s oceans', 8),
('Extreme Weather', 'Increased frequency of extreme weather events', 7),
('Loss of Biodiversity', 'Decline in global biodiversity', 6),
('Melting Ice Caps', 'Reduction in size of polar ice caps and glaciers', 9),
('Droughts', 'Extended periods of low precipitation', 7),
('Floods', 'Increased frequency and severity of floods', 6),
('Heat Waves', 'Extended periods of excessively hot weather', 5),
('Deforestation', 'Large-scale removal of forests', 8),
('Pollution', 'Contamination of the natural environment', 7),
('Soil Erosion', 'Wearing away of topsoil', 5);

-- Insert data into AirQualityData
INSERT INTO AirQualityData (Location, NitrogenDioxideLevel, SulfurDioxideLevel, ParticulateMatterLevel, MeasurementDate) VALUES
('New York', 40.5, 30.2, 25.4, '2023-01-01'),
('Los Angeles', 45.0, 35.1, 30.6, '2023-01-01'),
('Chicago', 50.2, 40.3, 35.7, '2023-01-01'),
('Houston', 55.3, 45.4, 40.8, '2023-01-01'),
('Phoenix', 60.4, 50.5, 45.9, '2023-01-01'),
('Philadelphia', 65.5, 55.6, 50.0, '2023-01-01'),
('San Antonio', 70.6, 60.7, 55.1, '2023-01-01'),
('San Diego', 75.7, 65.8, 60.2, '2023-01-01'),
('Dallas', 80.8, 70.9, 65.3, '2023-01-01'),
('San Jose', 85.9, 76.0, 70.4, '2023-01-01'),
('Austin', 90.0, 81.1, 75.5, '2023-01-01'),
('Jacksonville', 95.1, 86.2, 80.6, '2023-01-01');

-- Insert data into DeforestationRate
INSERT INTO DeforestationRate (Location, SatelliteImage, MeasurementDate, DeforestationPercentage) VALUES
('Amazon', LOAD_FILE('/path/to/amazon.jpg'), '2023-01-01', 5.2),
('Congo Basin', LOAD_FILE('/path/to/congo.jpg'), '2023-02-15', 4.8),
('Southeast Asia', LOAD_FILE('/path/to/sea.jpg'), '2023-03-10', 3.7),
('Eastern Australia', LOAD_FILE('/path/to/ea.jpg'), '2023-04-20', 6.1),
('Central America', LOAD_FILE('/path/to/ca.jpg'), '2023-05-05', 4.2),
('Madagascar', LOAD_FILE('/path/to/madagascar.jpg'), '2023-06-01', 3.9),
('West Africa', LOAD_FILE('/path/to/wa.jpg'), '2023-07-01', 5.7),
('Himalayas', LOAD_FILE('/path/to/himalayas.jpg'), '2023-08-01', 2.8),
('Rocky Mountains', LOAD_FILE('/path/to/rockies.jpg'), '2023-09-01', 1.5),
('Pacific Northwest', LOAD_FILE('/path/to/pnw.jpg'), '2023-10-01', 2.3),
('Southern Europe', LOAD_FILE('/path/to/se.jpg'), '2023-11-01', 1.7),
('Northern Africa', LOAD_FILE('/path/to/na.jpg'), '2023-12-01', 4.0);

-- Insert data into VolunteerActivity
INSERT INTO VolunteerActivity (VolunteerID, CampaignID, ActivityType, ActivityDate) VALUES
(1, 1, 'Clean Air Awareness', '2023-01-20'),
(2, 2, 'Tree Planting', '2023-02-25'),
(3, 3, 'Beach Cleanup', '2023-03-30'),
(4, 4, 'Climate March', '2023-04-15'),
(5, 5, 'Wildlife Survey', '2023-05-20'),
(6, 6, 'Solar Panel Installation', '2023-06-25'),
(7, 7, 'Plastic Collection', '2023-07-30'),
(8, 8, 'Water Conservation Workshop', '2023-08-15'),
(9, 9, 'Urban Garden Setup', '2023-09-20'),
(10, 10, 'Organic Farming Training', '2023-10-25'),
(11, 11, 'Wildlife Protection Patrol', '2023-11-30'),
(12, 12, 'Climate Education Seminar', '2023-12-15');

-- Insert data into CampaignDonor
INSERT INTO CampaignDonor (CampaignID, DonorID, DonationAmount, DonationDate) VALUES
(1, 1, 1000.00, '2023-01-10'),
(2, 2, 1500.00, '2023-02-15'),
(3, 3, 2000.00, '2023-03-20'),
(4, 4, 2500.00, '2023-04-25'),
(5, 5, 3000.00, '2023-05-30'),
(6, 6, 3500.00, '2023-06-10'),
(7, 7, 4000.00, '2023-07-15'),
(8, 8, 4500.00, '2023-08-20'),
(9, 9, 5000.00, '2023-09-25'),
(10, 10, 5500.00, '2023-10-30'),
(11, 11, 6000.00, '2023-11-05'),
(12, 12, 6500.00, '2023-12-10');
INSERT INTO CampaignDonor (CampaignID, DonorID, DonationAmount, DonationDate) VALUES
(1, 7, 1000.00, '2023-01-10'),
(2, 8, 1500.00, '2023-02-15'),
(3, 9, 2000.00, '2023-03-20');
-- Insert data into CampaignResource
INSERT INTO CampaignResource (CampaignID, ResourceID) VALUES
(1, 1),
(2, 5),
(3, 6),
(4, 1),
(4, 2),
(5, 4),
(6, 1),
(6, 3),
(7, 1),
(8, 2),
(9, 11),
(10, 12),
(11, 4),
(12, 11);

-- Insert data into ResourceImpact
INSERT INTO ResourceImpact (ResourceID, ImpactID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 10),
(6, 4),
(7, 12),
(8, 12),
(9, 3),
(10, 5),
(11, 1),
(12, 7);
-- ---------------------------------------------
SELECT
    d.Name,
    cd.DonationAmount,
    cd.DonationDate
FROM
    Donor d,
    CampaignDonor cd
WHERE
    d.DonorID = cd.DonorID
    AND cd.CampaignID = 1
ORDER BY
    cd.DonationAmount DESC
LIMIT 10;
-- ---------------------------------------------

SELECT
    v.Name,
    COUNT(va.CampaignID) AS CampaignCount
FROM
    Volunteer v
JOIN
    VolunteerActivity va ON v.VolunteerID = va.VolunteerID
GROUP BY
    v.VolunteerID, v.Name;
-- ---------------------------------------------

SELECT
    Name,
    EndDate
FROM
    Campaign
WHERE
    EndDate > CURDATE();
-- --------------------------------------------
SELECT
    d.Name,
    COUNT(cd.CampaignID) AS CampaignCount
FROM
    Donor d
JOIN
    CampaignDonor cd ON d.DonorID = cd.DonorID
GROUP BY
    d.DonorID, d.Name
HAVING
    COUNT(cd.CampaignID) > 1;
-- ---------------------------------------------

SELECT
    d.Name,
    AVG(cd.DonationAmount) AS AvgDonationAmount
FROM
    Donor d
JOIN
    CampaignDonor cd ON d.DonorID = cd.DonorID
GROUP BY
    d.DonorID, d.Name;
-- ---------------------------------------------

SELECT
    ci.Name,
    COUNT(cr.CampaignID) AS CampaignCount
FROM
    ClimateImpact ci
JOIN
    ResourceImpact ri ON ci.ImpactID = ri.ImpactID
JOIN
    CampaignResource cr ON ri.ResourceID = cr.ResourceID
GROUP BY
    ci.ImpactID, ci.Name;
-- ---------------------------------------------

SELECT
    v.Name,
    SUM(cd.DonationAmount) AS TotalRaised
FROM
    Volunteer v
JOIN
    VolunteerActivity va ON v.VolunteerID = va.VolunteerID
JOIN
    CampaignDonor cd ON va.CampaignID = cd.CampaignID
GROUP BY
    v.VolunteerID, v.Name
HAVING
    SUM(cd.DonationAmount) > 1000.0;
-- ---------------------------------------------

SELECT
    c.Name,
    c.FundraisingGoal,
    COALESCE(SUM(cd.DonationAmount), 0) AS TotalRaised,
    DATEDIFF(c.EndDate, CURDATE()) AS DaysRemaining
FROM
    Campaign c
LEFT JOIN
    CampaignDonor cd ON c.CampaignID = cd.CampaignID
GROUP BY
    c.CampaignID, c.Name, c.FundraisingGoal, c.EndDate
HAVING
    COALESCE(SUM(cd.DonationAmount), 0) < c.FundraisingGoal
    AND DATEDIFF(c.EndDate, CURDATE()) < 4;

-- ---------------------------------------------

SELECT
    er.Name,
    COUNT(cr.CampaignID) AS CampaignCount
FROM
    EnvironmentalResource er
JOIN
    CampaignResource cr ON er.ResourceID = cr.ResourceID
GROUP BY
    er.ResourceID, er.Name
ORDER BY
    COUNT(cr.CampaignID) DESC
LIMIT 10;
-- ---------------------------------------------

SELECT
    c.Name,
    COALESCE(SUM(cd.DonationAmount), 0) AS AmountRaised,
    COUNT(DISTINCT va.VolunteerID) AS TotalVolunteers,
    COUNT(DISTINCT cd.DonorID) AS TotalDonors
FROM
    Campaign c
LEFT JOIN
    CampaignDonor cd ON c.CampaignID = cd.CampaignID
LEFT JOIN
    VolunteerActivity va ON c.CampaignID = va.CampaignID
GROUP BY
    c.CampaignID, c.Name
HAVING
    COUNT(DISTINCT va.VolunteerID) > 0
    AND COUNT(DISTINCT cd.DonorID) > 0
ORDER BY
    TotalVolunteers DESC
LIMIT 3;
-- ---------------------------------------------
