# Booking2.0
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
2. Housing in a given city sorted by:
a) price
b) distance from the city center
c) housing rating
d) number of attractions nearby
4. Housing in a given city below a given price
5. Housing in a given city at distance X from me
6. Housing in a given city at a distance not less than X from the center
7. Housing in a given city with a rating not lower than X
8. Housing in a given city with the owner's rating not lower than X
9. Housing in a given city with the X facility
10. Housing with their rooms
11. All guests in the system and their personal data
12. All reservations with the type of facility
13. QA view

### Functions
1. Calculation of the average guest/host/housing/attraction rating
2. Calculation of the housing attractiveness index
3. Calculation of the number of avaliable housing in given dates
4. Calculation of the average length of stay
5. Checking if a given house is available on given dates.

### Triggers:
1. Updating view 2.a and 4 when changing the price per night in a given facility
2. Update of view 2.c and 7 when adding a new housing review
3. View 8 update when new host review is added
4. Checking if a given facility is available on the given dates when trying to book while updating views 3-9
5. Checking if a given property is available on given dates when trying to change booking dates while updating views 3-9

### Stored procedures
1. Addition: reviews of the housing, host, guest
2. Adding a question to the host
3. Adding an answer to the question
4. Making a reservation for a housing
5. Cancellation
6. Change of booking date
7. Changing the price of accommodation in a given housing
8. Avaliable housing in a given city for given dates [optionally with additional search constraints]

### Database maintenance strategy


### Common queries


