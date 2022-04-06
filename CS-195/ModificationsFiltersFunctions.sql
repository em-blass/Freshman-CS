/* 
	195
	Modifications, Filters and Functions
    Emmet Blassingame
*/
use customersandproducts;

#1a.
select fname, lname 
from customerContacts;

#1b.
select fname, lname 
from customerContacts where fname like 'A%' 
or fname like 'B%';

#1c.
select fname, lname 
from customerContacts where fname like '%a%'
and lname like 'L%';

#1d.
select fname, lname from customerContacts
where substring(fname, 1, 1) >= 'D'
and substring(fname, 1, 1) <= 'M';

#1e.
select fname, lname
from customerContacts
where fname like binary 'A%' and fname not like binary '%a%';

#2 write the SQL statement that will help you determine if in the customerContacts table there are any email addresses that end in something besides '.com'
select email 
from customerContacts 
where email not like '%.com';

#3


#4
select email 
from customerContacts 
where email like 'haw%';

#5
select fname, lname from customerContacts
where length(lname) <= 8
and lname like 'T%';

#6
select concat(upper(left(lname, 1)), 
lower(substring(lname, 2, length(lname) - 2)), 
upper(right(lname, 1))) as 'Revised Name'
from customerContacts;

#7
select date_format('2011-3-7', '%W, %M %e, %Y') AS result;
select date_format('2011-3-7', '%M %D, %Y') as result;
select date_format('2011-3-7 16:05:00', '%W %l:%i %p') as result;

#8
select date_format(date_add(curdate(), interval 1 month), '%m/%d/%y') as result;
select date_format(date_add(curdate(), interval 10 week), '%m/%d/%y') as result;
select date_format(date_add(curdate(), interval 40 day), '%m/%d/%y') as result;
select date_format(date_sub(curdate(), interval 40 day), '%m/%d/%y') as result;

#9
select date_format(addtime(curdate(), '100:00:00'), '%I:%i %p') as result;
select date_format(subtime(curdate(), '100:00:00'), '%I:%i %p') as result;

#10
select customerId, count(fname) from customerContacts
group by customerId;

#11 write the SQL statement that displays the number of orders from the orders table for each orderDate.
select orderDate, quantity from orderlines
join orders
on orderlines.orderId = orders.orderId
group by orderDate
order by orderDate asc;

#12 write the SQL statement that will display the first order for each company in each month.
select customerId, min(orderDate) from orders
join orderLines
on orderlines.orderId = orders.orderId
group by customerId;

#13 write the  SQL statement that displays the number of orders from the orders table for each orderDate, but only where there was more than 1 order on a given date.
select orderDate, quantity from orderlines
join orders
on orderlines.orderId = orders.orderId
where quantity > 1;
