CREATE TABLE [user_data] (
  [id] integer PRIMARY KEY,
  [firstname] varchar(100),
  [lastname] varchar(100),
  [email] varchar(100),
  [phone] varchar(20),
  [gender]CHAR(10),
)
GO

CREATE TABLE [rating_data] (
  [id] integer PRIMARY KEY,
  [score] integer,
  [title] varchar(100),
  [description] varchar(2000)
)
GO

CREATE TABLE [tenant] (
  [id] integer PRIMARY KEY,
  [user_data_id] integer
)
GO

CREATE TABLE [guest_rating] (
  [id] integer PRIMARY KEY,
  [guest_id] integer,
  [author] integer,
  [rating_data_id] integer
)
GO

CREATE TABLE [host] (
  [id] integer PRIMARY KEY,
  [user_data_id] integer,
  
)
GO

CREATE TABLE [host_rating] (
  [id] integer PRIMARY KEY,
  [host_id] integer,
  [guest] integer,
  [rating_data_id] integer
)
GO


CREATE TABLE [reservation] (
  [id] integer PRIMARY KEY,
  [guest_id] integer,
  [housing_id] integer,
  [start_date] datetime,
  [end_date] datetime
)
GO

CREATE TABLE [reservation_details] (
  [id] integer PRIMARY KEY,
  [reservation_id] integer,
  [room_id] integer,
  [cost] MONEY
)
GO

CREATE TABLE [payment] (
  [id] integer PRIMARY KEY,
  [value] MONEY,
  [date] datetime,
  [sender_id] integer,
  [reservation_id] integer
)
GO

CREATE TABLE [housing] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255),
  [housing_category_id] integer,
  [owner_id] integer,
  [location] geometry
)
GO

CREATE TABLE [housing_category] (
  [id] integer PRIMARY KEY,
  [name] varchar(100)
)
GO

CREATE TABLE [housing_rating] (
  [id] integer PRIMARY KEY,
  [housing_id] integer,
  [author] integer,
  [rating_data_id] integer
)
GO

CREATE TABLE [housing_question] (
  [id] integer PRIMARY KEY,
  [housing_id] integer,
  [author] integer
)
GO

CREATE TABLE [facilitity] (
  [id] integer PRIMARY KEY,
  [count] integer,
  [housing_id] integer,
  [facility_type_id] integer
)
GO

CREATE TABLE [facility_type] (
  [id] integer PRIMARY KEY,
  [name] varchar(100)
)
GO

CREATE TABLE [room] (
  [id] integer,
  [name] varchar(100),
  [cost] float,
  [housing_id] integer
)
GO

CREATE TABLE [room_equipment] (
  [id] integer PRIMARY KEY,
  [count] integer,
  [room_id] integer,
  [item_id] integer
)
GO

CREATE TABLE [item] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255),
  [category] integer
)
GO

CREATE TABLE [item_category] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255)
)
GO

CREATE TABLE [country] (
  [id] integer PRIMARY KEY,
  [name] varchar(100),
  [location] geometry
)
GO

CREATE TABLE [city] (
  [id] integer PRIMARY KEY,
  [name] varchar(100),
  [population] integer,
  [location] geometry
)
GO

CREATE TABLE [attraction] (
  [id] integer PRIMARY KEY,
  [name] varchar(100),
  [description] varchar(500),
  [attraction_type_id] integer,
  [location] geometry
)
GO

CREATE TABLE [attraction_type] (
  [id] integer PRIMARY KEY,
  [name] varchar(100)
)
GO

CREATE TABLE [attraction_rating] (
  [id] integer PRIMARY KEY,
  [author] integer,
  [attraction_id] integer,
  [rating_data_id] integer
)
GO

ALTER TABLE [tenant] ADD FOREIGN KEY ([user_data_id]) REFERENCES [user_data] ([id])
GO

ALTER TABLE [tenant_rating] ADD FOREIGN KEY ([tenant_id]) REFERENCES [tenant] ([id])
GO

ALTER TABLE [tenant_rating] ADD FOREIGN KEY ([author]) REFERENCES [owner] ([id])
GO

ALTER TABLE [tenant_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO

ALTER TABLE [owner] ADD FOREIGN KEY ([user_data_id]) REFERENCES [user_data] ([id])
GO

ALTER TABLE [owner_rating] ADD FOREIGN KEY ([owner_id]) REFERENCES [owner] ([id])
GO

ALTER TABLE [owner_rating] ADD FOREIGN KEY ([author]) REFERENCES [tenant] ([id])
GO

ALTER TABLE [owner_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([tenant_id]) REFERENCES [tenant] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [reservation_details] ADD FOREIGN KEY ([reservation_id]) REFERENCES [reservation] ([id])
GO

ALTER TABLE [reservation_details] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([id])
GO

ALTER TABLE [payment] ADD FOREIGN KEY ([sender_id]) REFERENCES [tenant] ([id])
GO

ALTER TABLE [payment] ADD FOREIGN KEY ([reservation_id]) REFERENCES [reservation] ([id])
GO

ALTER TABLE [housing] ADD FOREIGN KEY ([housing_category_id]) REFERENCES [housing_category] ([id])
GO

ALTER TABLE [housing] ADD FOREIGN KEY ([owner_id]) REFERENCES [owner] ([id])
GO

ALTER TABLE [housing_rating] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [housing_rating] ADD FOREIGN KEY ([author]) REFERENCES [tenant] ([id])
GO

ALTER TABLE [housing_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO

ALTER TABLE [housing_question] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [housing_question] ADD FOREIGN KEY ([author]) REFERENCES [tenant] ([id])
GO

ALTER TABLE [facilitity] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [facilitity] ADD FOREIGN KEY ([facility_type_id]) REFERENCES [facility_type] ([id])
GO

ALTER TABLE [room] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [room_equipment] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([id])
GO

ALTER TABLE [room_equipment] ADD FOREIGN KEY ([item_id]) REFERENCES [item] ([id])
GO

ALTER TABLE [item] ADD FOREIGN KEY ([category]) REFERENCES [item_category] ([id])
GO

ALTER TABLE [attraction] ADD FOREIGN KEY ([attraction_type_id]) REFERENCES [attraction_type] ([id])
GO

ALTER TABLE [attraction_rating] ADD FOREIGN KEY ([author]) REFERENCES [tenant] ([id])
GO

ALTER TABLE [attraction_rating] ADD FOREIGN KEY ([attraction_id]) REFERENCES [attraction] ([id])
GO

ALTER TABLE [attraction_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO
