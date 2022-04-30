/*
    195
    Emmet Blassingame
    Exam 3
*/

use CustomersAndProducts;

#1) The orderLines table contains quantity information. Display the quantity and next to it the 
#word 'Poor', 'Good' or 'Great' where a quantity <= 5 is 'Poor', <=10 is 'Good' and otherwise 
#is 'Great'.


#2) Show the orderId, total value of the order and customerName for each order with the 
#column names as shown.


#3) Using a subquery, display names and email contacts for any company that placed an in 
#February.

select fname, lname, email from customerContacts
where customerId in (
	select customerId from orders
    where orderDate >= '2006-02-01'
    and orderDate < '2006-03-01');
    
#4) Show the customerName for every customer that ordered only in February.


#5) Show the customerName and emails for all companies that bought the Medium Product. 
#Note: you must start with 'Medium Product', not 'MIDI'.

select customerName, email from customers
join customerContacts
on customers.customerId = customerContacts.customerId
where customerContacts.customerId in
	(select orders.customerId from orders
    where orderId in
		(select orderId from orderLines
        where productId in
			(select productId from products
            where productName like 'Medium Product')));

#6) For each customer and each item, show the largest quantity order. Produced the output 
#shown below exactly. 

select customerName, productId, quantity as 'Max Quantity' from
customers join orderLines;

#7) Show the customerName and orderId for all customers that placed a larger than average 
#size order, measured as the total value of items sold on that order.
#StudentsTeachersAndClasses


 use StudentsTeachersAndClasses;

#8) Show the class name for the classes Meghan is in.

select className
from students join studentsXclasses join classes
on students.studentId = studentsXclasses.studentId
            and studentsXclasses.classId = classes.classId
where stuName = 'Meghan';

#9) Show the teacher names for Meghan's teachers.

select distinct teachName
from students join studentsXclasses
	join classes join teachersXclasses join teachers
on students.studentId = studentsXclasses.studentId
	and studentsXclasses.classId = classes.classId
    and classes.classId = teachersXclasses.classId
    and teachersXclasses.teacherId = teachers.teacherId
where stuName = 'Meghan';

#10) Show the student name for students that Heidi is teaching and Kim is not teaching.

select distinct stuName
from students join studentsXclasses join classes join teachersXclasses join teachers
on students.studentId = studentsXclasses.studentId and studentsXclasses.classId = classes.classId
	and classes.classId = teachersXclasses.classId and teachersXclasses.teacherId = teachers.teacherId
	where teachName = 'H Keck' and stuName not in
		(select distinct stuName
		from students join studentsXclasses join classes join teachersXclasses join teachers
		on students.studentId = studentsXclasses.studentId and studentsXclasses.classId = classes.classId
			and classes.classId = teachersXclasses.classId and teachersXclasses.teacherId = teachers.teacherId
			where teachName = 'K Fix');

#11) Show how many students are in Automata.

select className, count(*) as '# of students'
from students join studentsXclasses join classes
on students.studentId = studentsXclasses.studentId
	and studentsXclasses.classId = classes.classId
where className like 'Automata';

#12) Show students that are not in classes with either Dan or Meghan.
 
select stuName from students
where stuName not in
(
    select distinct stuName
    from students join studentsXclasses join classes
    on students.studentId = studentsXclasses.studentId and studentsXclasses.classId = classes.classId
    where className in
		(select distinct classname
		from students join studentsXclasses join classes
		on students.studentId = studentsXclasses.studentId and studentsXclasses.classId = classes.classId
		where (stuName = 'Dan' or stuname = 'Meghan')
		)
);

#13) Display the names of all students that contain an 'd' but do not contain a 'e' or an 'n'. 
#Upper/lower case is ignored.

select stuName
from students
where stuName like '%d%'
	and stuName not like '%e%'
	and stuName not like '%n%';

#14) Create a view showing each stuName, studId, className and classId of the classes they 
#took. Using another SQL statement that uses that view to show the stuName and the 
#classNames, in order by stuName.
 
 
#15) Create a stored procedure with one in parameter, the name of a student.  The procedure 
#lists the class names for all classes that student is in.


#17) Display the date one month + one week from today.


#18) Use SQL functions to display 'sAmUel ' properly capitalized as 'Samuel'.

select trim(concat(upper(left('sAmUel ', 1)), 
lower(substring('sAmUel ', 2)))) as 'Revised Name';

