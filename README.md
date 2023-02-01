# Booking 2.0
![sea-2720593_960_720](https://user-images.githubusercontent.com/121491288/216061686-f35e1d31-b4e8-48a3-be84-09578039102f.jpg)

This project is a hotel-booking database that offers a variety of accommodation options including hotels, holiday houses, apartaments and more, located in four countries: Poland, Slovakia, Czech Republic, and Hungary. The database encompasses 15 cities and provides a map-based search feature, making it easy for users to find the perfect place to stay. Queries such as proximity to city centers and price ranges can be used to refine search results. The database is equipped with a range of functionalities including searching with different constraints (price, date, location, and rating), making reservations, changing or deleting reservations, and rating houses, their owners, and tourist attractions. Additionally, owners have the ability to rate guests who have stayed in their housing.

## Database diagram

### dbdiagram.io

- [Link to diagram](https://dbdiagram.io/d/63d96b3b296d97641d7d76f9) (view only)
- [Source file](./docs/diagram_src.txt)

## Docker + VSCode setup

Setup with SQL server as docker container and VSCode as GUI.

1. Requirements: Docker, VSCode with [SQL Server](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql) extension.
1. Go to `docker/` directory and execute `sh start.sh` command.
1. Wait for mssql to setup.
1. Connect via extension using below values:
   - hostname: `localhost`
   - database: `booking2`
   - authentication type: `SQL Login`
   - username: `sa`
   - password: `zaq1@WSX`

## Countries and cities map

Countries and cities polygons with complete explanation and guide for adding new ones can be found in [docs/wtk.md](./docs/wkt.md).

In order to recreate map in database following programs were used (more on that in above mentioned file):

- [OpenStreetMap](https://www.openstreetmap.org/)
- [Polygons.OpenStreetMap](https://polygons.openstreetmap.fr/)

## Tabels
- user_data
- rating_data
- guest
- guest_rating
- host
- host_rating
- reservation
- reservation_details
- housing
- housing_category
- housing_rating
- housing_question
- question_answer
- facility
- facility_type
- room
- room_equipment_and_facilities
- item
- item_category
- country
- city
- attraction
- attraction_type
- attraction_rating

### Aspects that change over time
The database contains the following parameters that may change over time: prices for accommodation, availability of housing and ratings of housing, hosts, guests and attractions. In our model, the number of housing, attractions, cities and countries is constant, and the details of housing, rooms and users remain unchanged. However, it is possible to add appropriate functionalities to allow editing of these elements. Sets of categories, such as the housing category (hotel, apartment, etc.) and the categories of room furnishings (furniture, household appliances, etc.), are invariant by design.

To manage aspects that change over time, the following strategies have been applied:
- the price per night is saved in the reservation_details at the time of booking
- created triggers allow for updateing data in the entire database after introducing changes in one of the tables
- the ITENTITY() property allows for adding new data without breaking the primary key constraints

### Views
1. Housing in a given city
2. Housing in a given city with details (name, rating, rooms, room name, room price)
3. Housing in a given city with prices per night (only cheapest room in a given housing)
4. Housing in a given city with its rating
5. Housing in a given city with its facilities
6. Housing with its rooms
7. All guests in the system and their personal data
8. All reservations with the type of facility
9. QA view
10. Best cities
11. Best attractions
12. Ongoing reservations

### Functions
1. Calculation of the average guest/host/housing/attraction rating
2. Calculation of the number of avaliable housing in given dates
3. Calculation of the average length of stay
4. Checking if a given house is available on given dates
5. Calculating the distance between given housing and city center

### Triggers:
1. Checking if a given facility is available on the given dates when trying to book
2. Checking if a given property is available on given dates when trying to change booking dates
3. Updating view 'Housing in a given city with prices per night' when changing price of a room in a given housing
4. Updating view 'QA view' when a new question about housing is asked
5. Updating view 'Housing in a given city per rating' when a new housing rating is added

### Stored procedures
1. Addiing tarings of the housing, host, guest
2. Adding a question regardng housing
3. Adding an answer to the question
4. Adding a reservation for a housing
5. Cancellation of a reservation
6. Change of booking dates for a reservation
7. Changing the price of accommodation in a given housing
8. Avaliable housing in a given city for given dates sorted by rating/distance from city center/price
9. Selecting avaliable housing for given city in given dates
10. Deleting an object of any type from the database
11. Adding a new user

## Database maintenance strategy
**Regular Backups:** Regularly backing up the database to ensure data preservation and disaster recovery.

**Data Integrity:** Implementing data validation and consistency checks to maintain data accuracy and completeness. 
For instance housing have to be located in one of the countries in one of the cities. 

**Security Measures:** Implementing security measures to protect sensitive data, such as encryption, authentication, and authorization.
For instance user data should be protected and only visible to the users themselves.

**Data Archiving:** Archiving older, rarely accessed data to free up storage space and improve database performance.
For example past reservations could be compressed while outdated user data could be deleted. 

### Example queries
1. Selecting avaliable housing in a given city in given dates in given price range
2. Selecting avaliable housing in a given category in a given city in given dates 
3. Selecting all reservations of guest of given id
4. Selecting all reservations of objects owned by a host by given id
5. Selecting all reviews of given housing ordered by date/score
