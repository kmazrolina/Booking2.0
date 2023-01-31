CREATE TABLE [user_data] (
  [id] integer IDENTITY(1,1) PRIMARY KEY ,
  [first_name] varchar(100),
  [last_name] varchar(100),
  [email] varchar(100),
  [phone] varchar(20),
  [gender] varchar(10)
)
GO

CREATE TABLE [rating_data] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [score] integer,
  [title] varchar(100),
  [description] varchar(2000)
)
GO

CREATE TABLE [guest] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [user_data_id] integer
)
GO

CREATE TABLE [guest_rating] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [guest_id] integer,
  [author_id] integer,
  [rating_data_id] integer
)
GO

CREATE TABLE [host] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [user_data_id] integer
)
GO

CREATE TABLE [host_rating] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [host_id] integer,
  [author_id] integer,
  [rating_data_id] integer
)
GO

CREATE TABLE [reservation] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [guest_id] integer,
  [housing_id] integer,
  [start_date] datetime,
  [end_date] datetime
)
GO

CREATE TABLE [reservation_details] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [reservation_id] integer,
  [room_id] integer,
  [cost] money
)
GO

CREATE TABLE [payment] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [value] money,
  [date] datetime,
  [sender_id] integer,
  [reservation_id] integer
)
GO

CREATE TABLE [housing] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [name] nvarchar(255),
  [housing_category_id] integer,
  [host_id] integer,
  [location] geometry
)
GO

CREATE TABLE [housing_category] (
  [id] integer PRIMARY KEY,
  [name] varchar(100)
)
GO

CREATE TABLE [housing_rating] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [housing_id] integer,
  [author_id] integer,
  [rating_data_id] integer
)
GO

CREATE TABLE [housing_question] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [housing_id] integer,
  [author_id] integer,
  [description] varchar(2000)
)
GO

CREATE TABLE [question_answer] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [question_id] integer,
  [description] varchar(2000)
)
GO

CREATE TABLE [facility] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
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
  [id] integer PRIMARY KEY,
  [name] varchar(100),
  [cost_per_night] money,
  [housing_id] integer
)
GO

CREATE TABLE [room_equipment_and_facilities] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [count] integer,
  [room_id] integer,
  [item_id] integer
)
GO

CREATE TABLE [item] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255),
  [category_id] integer
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
  [id] integer IDENTITY(1,1) PRIMARY KEY,
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
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [author_id] integer,
  [attraction_id] integer,
  [rating_data_id] integer
)
GO

ALTER TABLE [guest] ADD FOREIGN KEY ([user_data_id]) REFERENCES [user_data] ([id])
GO

ALTER TABLE [guest_rating] ADD FOREIGN KEY ([guest_id]) REFERENCES [guest] ([id])
GO

ALTER TABLE [guest_rating] ADD FOREIGN KEY ([author_id]) REFERENCES [host] ([id])
GO

ALTER TABLE [guest_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO

ALTER TABLE [host] ADD FOREIGN KEY ([user_data_id]) REFERENCES [user_data] ([id])
GO

ALTER TABLE [host_rating] ADD FOREIGN KEY ([host_id]) REFERENCES [host] ([id])
GO

ALTER TABLE [host_rating] ADD FOREIGN KEY ([author_id]) REFERENCES [guest] ([id])
GO

ALTER TABLE [host_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([guest_id]) REFERENCES [guest] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [reservation_details] ADD FOREIGN KEY ([reservation_id]) REFERENCES [reservation] ([id])
GO

ALTER TABLE [reservation_details] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([id])
GO

ALTER TABLE [payment] ADD FOREIGN KEY ([sender_id]) REFERENCES [guest] ([id])
GO

ALTER TABLE [payment] ADD FOREIGN KEY ([reservation_id]) REFERENCES [reservation] ([id])
GO

ALTER TABLE [housing] ADD FOREIGN KEY ([housing_category_id]) REFERENCES [housing_category] ([id])
GO

ALTER TABLE [housing] ADD FOREIGN KEY ([host_id]) REFERENCES [host] ([id])
GO

ALTER TABLE [housing_rating] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [housing_rating] ADD FOREIGN KEY ([author_id]) REFERENCES [guest] ([id])
GO

ALTER TABLE [housing_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO

ALTER TABLE [housing_question] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [housing_question] ADD FOREIGN KEY ([author_id]) REFERENCES [guest] ([id])
GO

ALTER TABLE [question_answer] ADD FOREIGN KEY ([question_id]) REFERENCES [housing_question] ([id])
GO

ALTER TABLE [facility] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [facility] ADD FOREIGN KEY ([facility_type_id]) REFERENCES [facility_type] ([id])
GO

ALTER TABLE [room] ADD FOREIGN KEY ([housing_id]) REFERENCES [housing] ([id])
GO

ALTER TABLE [room_equipment_and_facilities] ADD FOREIGN KEY ([room_id]) REFERENCES [room] ([id])
GO

ALTER TABLE [room_equipment_and_facilities] ADD FOREIGN KEY ([item_id]) REFERENCES [item] ([id])
GO

ALTER TABLE [item] ADD FOREIGN KEY ([category_id]) REFERENCES [item_category] ([id])
GO

ALTER TABLE [attraction] ADD FOREIGN KEY ([attraction_type_id]) REFERENCES [attraction_type] ([id])
GO

ALTER TABLE [attraction_rating] ADD FOREIGN KEY ([author_id]) REFERENCES [guest] ([id])
GO

ALTER TABLE [attraction_rating] ADD FOREIGN KEY ([attraction_id]) REFERENCES [attraction] ([id])
GO

ALTER TABLE [attraction_rating] ADD FOREIGN KEY ([rating_data_id]) REFERENCES [rating_data] ([id])
GO
