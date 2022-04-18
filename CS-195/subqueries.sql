/*
    195
	Subqueries
    Emmet Blassingame
*/

#1)	Display the customerName for any customer that placed an order on or after Feb. 5, 2006.
use customersandproducts;

select customerName from customers 
where customerId in 
	(select distinct customerId from orders 
	where orderId in 
		(select orderId from orderLines 
		where orderDate >= '2006-02-05')
);

#2)	Display the email address for any customer that placed an order on or after Feb. 5, 2006.
select email from customerContacts 
where customerId in
	(select customerId from orders 
	where orderId in 
		(select orderId from orderLines 
        where orderDate >= '2006-02-05')
);

#3)	Show the productId for all products sold to MXLDR, without repetition.
select productId from products 
where productId in
	(select productId from orderLines 
	where orderId in 
		(select orderId from orders 
        where customerId = 'MXLDR')
);

#4)	Show all information for all products with a greater price than the average price of the products.
select * from products as p1
where price >
(
select avg(price)
from products as p2
);

#5)	Show, without repetitions, the customerName for all customers for whom we have no email.
select customerName from customers
where customerId not in
	(select customerId
    from customerContacts
);
    
#6)	Show the customerName for all customers that have not placed an order.
select customerName from customers
where customerId not in
	(select customerId
    from orders);

#7)	Show the productName for all products that have not been sold (at all).
select productName from products
where productId not in
	(select productId
    from orderLines
);

#8)	Show the orderId for any larger than average  size order, measured as # of items ordered.
select orderId, quantity from orderLines as ol1
where quantity >
(
select avg(quantity)
from orderLines as ol2
);

#9)	Show one (and only one) customerId and email address for each customer that bought a MINI.
select customerId, email from customerContacts
where customerId in
	(select distinct customerId from orders 
	where orderId in 
		(select orderId from orderLines 
        where productId = 'MINI')
);

#10)	Display all the emails for the company where Marie Curie works.
select email
from customerContacts
where customerId =
	(select customerId
	from customerContacts
	where fname = 'Marie' 
and lname = 'Curie'
);

#11)	Display all the people and emails for whatever company has 'gershwin@MSCRUS.com' as one of its emails.
select fname, lname, email
from customerContacts
where customerId =
	(select customerId
	from customerContacts
	where email like 'gershwin@MSCRUS.com'
);

#12)	Create another table called duplicateOrders. Populate it with some of the same information from the  original orders table, and add some other different info of your own creation.
	#a)	Write a query that shows what information is duplicated between the two tables. You'll have to use a subquery with something like: 
		#select … where (orderId, customerId, orderDate) in (subquery here)
select distinct * from orders
where (orderId, customerId, orderDate) in 
	(select distinct *
    from duplicateOrders
);

	#b)	Now write a version of the query that tells you how many duplicate orders you have.
select *, count(*)
from orders
where (orderId, customerId, orderDate) in 
	(select *
    from duplicateOrders
    group by orderId, customerId, orderDate
    having count(orderId)
    and count(customerId)
    and count(orderDate)
);

#13)	Show all the students in Calc III that are also in CS I
use studentsteachersandclasses;

select studentId, stuName from students
where studentId in
	(select studentId from studentsxclasses 
	where classId in 
		(select classId from classes 
        where className = 'CS I' 
        and className = 'Calc III')
);

#14)	Show all the students in Calc III that are not in CS 1.
select studentId, stuName from students
where studentId in
	(select studentId from studentsxclasses 
	where classId in 
		(select classId from classes 
        where not className = 'CS I'
			and className = 'Calc III')
);

#15)	Show all the class names that are not taught by K Fix.
select className from classes
where classId in
	(select classId from teachersxclasses 
	where teacherId in 
		(select teacherId from teachers 
        where not teachName = 'K Fix')
);

#16)	Show all the students that are not taught by K Fix.
select stuName from students
where studentId in
	(select studentId from studentsxclasses 
	where classId in 
		(select classId from teachersxclasses 
        where teacherId in
        (select teacherId from teachers 
        where not teachName = 'K Fix'))
);

#17)	Show the names of all classes with above average enrollment.
select className from classes as p1
where classId in
	(select classId from studentsxclasses
	where studentId >
		(select avg(studentId)
		from students as p2)
);

#18)	Show the students for all classes with above average enrollment. 
select * from students
where studentId in
	(select studentId from studentsxclasses
	where classId in
		(select classId from studentsxclasses
		where studentId >
			(select avg(studentId)
			from students as p2))
);

#19)	What students are taught by both K Fix and HKeck? 
select stuName from students
where studentId in
	(select studentId from teachersxclasses 
	where teacherId in 
		(select teacherId from teachers 
        where teachName = 'K Fix'
			and teachName = 'H Keck')
);

#20)	What students are in classes with Dan or Meghan?
select stuName from students
where studentId in
	(select studentId from studentsxclasses
	where classId in	
		(select classId from classes
		where classId in
			(select classId from studentsxclasses
			where studentId in
				(select studentId from students
				where stuName = 'Dan'
					or stuName = 'Meghan')))
);

#21)	What students are not in classes with either Dan or Meghan?
select stuName from students
where stuName not  in ( 
    select stuName
    from students join studentsXclasses join classes
    on students.studentId = studentsXclasses.studentId
        and studentsXclasses.classId = classes.classId
    where className in (
        select className
        from students join studentsXclasses join classes
        on students.studentId = studentsXclasses.studentId
            and studentsXclasses.classId = classes.classId
        where stuName = 'Meghan' 
			or stuName = 'Dan'
    )
);

#22)	What students are in classes with both Dan and Meghan?
select stuName from students
where studentId in
	(select studentId from studentsxclasses
	where classId in	
		(select classId from classes
		where classId in
			(select classId from studentsxclasses
			where studentId in
				(select studentId from students
				where stuName = 'Dan'
					and stuName = 'Meghan')))
);


