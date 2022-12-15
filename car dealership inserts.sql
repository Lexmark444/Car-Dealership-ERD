
-- Customer
insert into customer (customer_id, first_name,last_name,address,billing_info) 
values (1,'Krishna','Patel', '234 Nice Try Road, Old Bridge, NY, 10001', '4004-4304-4343-4444 04/24 444');
insert into customer (customer_id, first_name,last_name,address,billing_info) 
values (2,'Brandon','Apol', '404 Error Road, Hiding, AL, 80085', '1337-6969-4200-5555 01/23 456');

--Sales
insert into sales(staff_id, first_name, last_name) values (1, 'Schadre', 'Dent');
insert into sales(staff_id, first_name, last_name) values (2, 'Nicole', 'Shannon');

--Part
insert into part (part_id,part_desc,part_cost) values (1,'Brake pads', 150.00);
insert into part (part_id,part_desc,part_cost) values (2,'windshield', 399.99);

--Mechanic
insert into mechanic(mech_id, first_name, last_name, hourly_rate) values (1,'Bob', 'Ross', 60.00 );
insert into mechanic(mech_id, first_name, last_name, hourly_rate) values (2,'Grant', 'Cardone', 1000.00 );

-- Car
insert into car(vin, customer_id, staff_id,make,model,car_year, color
) values (1, 1, 1, 'Jeep', 'Grand Cherokee',2019, 'Black');
insert into car(vin, customer_id, staff_id,make,model,car_year, color) 
values (2, 2, 2, 'Hyundai', 'Santa Fe',2013, 'White');

--Service 
insert into service(service_id, mech_id, hours, total_cost) values (1,1,4.5,449.40);
insert into service(service_id, mech_id, hours, total_cost) values (2,1,2,556.40);

--Invoice
insert into invoice (invoice_id,customer_id,vin,staff_id,total_cost)
values(1,1,1,1,69000);
insert into invoice (invoice_id,customer_id,vin,staff_id,total_cost)
values(2,2,2,2,44000);

--Service Ticket
insert into service_ticket(ticket_id, vin, customer_id, part_id, service_id, total_cost)
values (1,1,1,1,1,449.40);
insert into service_ticket(ticket_id, vin, customer_id, part_id, service_id, total_cost)
values (2,2,2,2,2,556.40);

--Inserts with function
create or replace function add_sales(_staff_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin
	insert into sales(staff_id, first_name,last_name)
	values (_staff_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

--Call function 
select add_sales(3, 'Michael', 'Jackson');
select add_sales(4, 'Hee', 'Hee');

select * from sales