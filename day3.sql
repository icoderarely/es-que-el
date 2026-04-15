-- create tables
create table customers (
  customer_id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  age int not null,
  country varchar(50) not null
);

create table products (
  product_id serial primary key,
  product_name varchar(100) not null unique,
  price numeric(10,2) not null,
  category varchar(50) not null
);

create table orders (
  order_id serial primary key,
  customer_id int not null,
  product_id int not null,
  quantity int not null,
  order_date date not null,
  constraint fk_orders_customer_id
    foreign key (customer_id)
    references customers(customer_id),
  constraint fk_orders_product_id
    foreign key (product_id)
    references products(product_id)
);

create table payments (
  payment_id serial primary key,
  order_id int,
  payment_status varchar(20) not null default 'Pending',
  constraint fk_payments_order_id
    foreign key (order_id)
    references orders(order_id)
);

-- rules
alter table orders
drop constraint fk_orders_customer_id;

alter table orders
add constraint fk_orders_customer_id
foreign key (customer_id)
references customers(customer_id)
on delete cascade;

alter table orders
drop constraint fk_orders_product_id;

alter table orders
add constraint fk_orders_product_id
foreign key (product_id)
references products(product_id)
on delete restrict;

alter table payments
drop constraint fk_payments_order_id;

alter table payments
add constraint fk_payments_order_id
foreign key (order_id)
references orders(order_id)
on delete set null;

alter table products
add constraint chk_price_positive
check (price > 0);

alter table orders
add constraint chk_quantity_positive
check (quantity > 0);

alter table payments
add constraint chk_payment_status
check (payment_status in ('Pending', 'Paid', 'Failed'));

-- seed data
insert into customers (customer_id, first_name, last_name, age, country)
values
(1, 'John', 'Doe', 31, 'USA'),
(2, 'Robert', 'Fox', 22, 'USA'),
(3, 'David', 'Warner', 28, 'UK'),
(4, 'Lisa', 'Ray', 35, 'Canada'),
(5, 'Maria', 'Garcia', 30, 'Spain');

insert into products (product_id, product_name, price, category)
values
(1, 'Keyboard', 500, 'Electronics'),
(2, 'Mouse', 300, 'Electronics'),
(3, 'Monitor', 12000, 'Electronics'),
(4, 'Chair', 7000, 'Furniture'),
(5, 'Desk', 15000, 'Furniture');

insert into orders (order_id, customer_id, product_id, quantity, order_date)
values
(1, 1, 1, 2, '2024-01-01'),
(2, 1, 2, 1, '2024-01-02'),
(3, 2, 3, 1, '2024-01-03'),
(4, 3, 1, 1, '2024-01-04'),
(5, 4, 5, 1, '2024-01-05'),
(6, 5, 4, 2, '2024-01-06');

insert into payments (payment_id, order_id, payment_status)
values
(1, 1, 'Paid'),
(2, 2, 'Paid'),
(3, 3, 'Pending'),
(4, 4, 'Failed'),
(5, 5, 'Paid'),
(6, 6, 'Pending');

-- alter table task
alter table orders
add column order_total numeric(10,2);

update orders o
set order_total = o.quantity * p.price
from products p
where o.product_id = p.product_id;

-- final question
-- customer_name, product_name, order_total, payment_status, customers_who_bought_same_product
select
c1.first_name || ' ' || c1.last_name as customer_name,
pd.product_name,
o.order_total,
py.payment_status,
string_agg(
  c2.first_name || ' ' || c2.last_name, ', '
) as customers_who_bought_same_product

from orders o

inner join customers c1
on o.customer_id = c1.customer_id

inner join products pd
on o.product_id = pd.product_id

left join payments py
on o.order_id = py.order_id

-- self join on orders
left join orders o2
on o.product_id = o2.product_id
and o.customer_id <> o2.customer_id

left join customers c2
on o2.customer_id = c2.customer_id

group by
  c1.first_name,
  c1.last_name,
  pd.product_name,
  o.order_total,
  py.payment_status;

-- cross join
select
c.first_name,
p.category
from customers c
cross join (
  select distinct category from products
) p;

-- full outer join
select
c.first_name,
o.order_id,
py.payment_status
from customers c
full outer join orders o
on c.customer_id = o.customer_id
full outer join payments py
on o.order_id = py.order_id;