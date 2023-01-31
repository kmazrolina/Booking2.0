#!/bin/sh

PWD=$MSSQL_SA_PASSWORD

echo "starting database setup"

# create database
echo "creating database"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -i /db/create_database.sql

# create tables
echo "creating tables"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/create_tables.sql

# users
echo "inserting user data"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/users/user_data.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/users/guest.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/users/host.sql

# geo
echo "inserting geographic data"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/geo/country.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/geo/city.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/geo/attraction_category.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/geo/attraction.sql

# housing
echo "inserting housing data"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/housing_category.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/housing.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/facility_type.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/facility.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/item_category.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/item.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/room.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/room_equipment_and_facilities.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/housing_question.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/stays/question_answer.sql

# reservation
echo "inserting reservation data"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/reserv/reservation.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/reserv/reservation_details.sql

# rating
echo "inserting rating data"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/rating/rating_data.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/rating/attraction_rating.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/rating/host_rating.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/rating/housing_rating.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$PWD" -d "booking2" -i /db/data/rating/guest_rating.sql

echo "database setup finished successfully"