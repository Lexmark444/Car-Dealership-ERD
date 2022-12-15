CREATE TABLE customer (
  customer_id SERIAL primary key,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  address VARCHAR(150),
  billing_info VARCHAR(150)
);

CREATE TABLE sales (
  staff_id SERIAL primary key,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);


CREATE TABLE part (
  part_id SERIAL primary key,
  part_desc VARCHAR(300),
  part_cost NUMERIC(8,2)
);

CREATE TABLE mechanic (
  mech_id SERIAL primary key,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  hourly_rate NUMERIC(6,2)
);


CREATE TABLE car (
  vin SERIAL primary key,
  customer_id INTEGER,
  staff_id INTEGER,
  make VARCHAR(50),
  model VARCHAR(50),
  car_year VARCHAR(50),
  color VARCHAR(50),
  foreign key(customer_id) references customer(customer_id),
  foreign key(staff_id) references sales(staff_id)
  
);


CREATE TABLE service (
  service_id SERIAL primary key,
  mech_id INTEGER,
  hours NUMERIC(4,2),
  total_cost NUMERIC(8,2),
  foreign key(mech_id) references mechanic(mech_id)
);


CREATE TABLE invoice (
  invoice_id SERIAL primary key,
  customer_id INTEGER,
  vin INTEGER,
  staff_id INTEGER,
  invoice_date DATE default CURRENT_DATE,
  total_cost NUMERIC(10,2),
  foreign key(customer_id) references customer(customer_id),
  foreign key(vin) references car(vin),
  foreign key(staff_id) references sales(staff_id)
);



CREATE TABLE service_ticket (
  ticket_id SERIAL primary key,
  vin INTEGER,
  customer_id INTEGER,
  part_id INTEGER,
  service_id INTEGER,
  service_date DATE default CURRENT_DATE,
  total_cost NUMERIC(10,2),
  foreign key(customer_id) references customer(customer_id),
  foreign key(vin) references car(vin),
  foreign key(service_id) references service(service_id),
  foreign key(part_id) references part(part_id)
);











