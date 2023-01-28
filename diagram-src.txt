// ==================== USERS ====================

// ========== ABSTRACT CLASSES ==========

Table user_data {
  id integer [pk]
  first_name varchar (100)
  last_name varchar (100)
  email varchar (100)
  phone varchar (20)
  gender varchar(10)
}

Table rating_data {
  id integer [pk]
  score integer
  title varchar (100)
  description varchar (2000)
}

// ========== GUEST ==========

Table guest {
  id integer [pk]
  user_data_id integer [ref: > user_data.id]
}

// check: whether host had contact with this guest
Table guest_rating {
  id integer [pk]
  guest_id integer [ref: > guest.id]
  author_id integer [ref: > host.id]
  rating_data_id integer [ref: > rating_data.id]
}

// proposal: remove as it does not posess any significant role 
// and we have 24 tables already
// Table guest_favorite {
//   id integer [pk]
//   guest_id integer [ref: > guest.id]
//   housing_id integer [ref: > housing.id]
// }

// ========== host ==========

Table host{
  id integer [pk]
  user_data_id integer [ref: > user_data.id]
}

// check: whether guest had contact with this host
Table host_rating {
  id integer [pk]
  host_id integer [ref: > host.id]
  author_id integer [ref: > guest.id]
  rating_data_id integer [ref: > rating_data.id]
}

// ==================== RESERVATION ====================

// ========== RESERVATION ==========

Table reservation {
  id integer [pk]
  guest_id integer [ref: > guest.id]
  housing_id integer [ref: > housing.id]
  start_date timestamp
  end_date timestamp
}

Table reservation_details {
  id integer [pk]
  reservation_id integer [ref: > reservation.id]
  room_id integer [ref: > room.id]
  cost float
}

// check1: sender_id and reservation_id.guest_id must match
// check2: date must be before reservation_id.start_date
Table payment {
  id integer [pk]
  value float
  date datetime
  sender_id integer [ref: > guest.id]
  reservation_id integer [ref: > reservation.id]
}

// ========== HOUSING ==========

Table housing {
  id integer [pk]
  name varchar
  housing_category_id integer [ref: > housing_category.id]
  host_id integer [ref: > host.id]
  location geometry
}

Table housing_category {
  id integer [pk]
  name varchar (100)
}

// check: whether guest really was there
Table housing_rating {
  id integer [pk]
  housing_id integer [ref: > housing.id]
  author_id integer [ref: > guest.id]
  rating_data_id integer [ref: > rating_data.id]
}

Table housing_question {
  id integer [pk]
  housing_id integer [ref: > housing.id]
  author integer [ref: > guest.id]
}

// ========== FACILITY ==========

Table facility {
  id integer [pk]
  housing_id integer [ref: > housing.id]
  facility_type_id integer [ref: > facility_type.id]
}

Table facility_type {
  id integer [pk]
  name varchar (100)
}

// ========== ROOM ==========

Table room {
  id integer 
  name varchar(100)
  cost_per_night money
  housing_id integer [ref: > housing.id]
}

Table room_equipment_and_facilities {
  id integer [pk]
  count integer
  room_id integer [ref: > room.id]
  item_id integer [ref: > item.id]
}

Table item {
  id integer [pk]
  name varchar
  category_id integer [ref: > item_category.id]
}

Table item_category {
  id integer [pk]
  name varchar
}

// ==================== PLACE ====================

Table country {
  id integer [pk]
  name varchar (100)
  location geometry
}

Table city {
  id integer [pk]
  name varchar (100)
  population integer
  location geometry
}

Table attraction {
  id integer [pk]
  name varchar (100)
  description varchar (500)
  attraction_type_id integer [ref: > attraction_type.id]
  location geometry
}

Table attraction_type {
  id integer [pk]
  name varchar (100)
}

Table attraction_rating {
  id integer [pk]
  author integer [ref: > guest.id]
  attraction_id integer [ref: > attraction.id]
  rating_data_id integer [ref: > rating_data.id]
}
