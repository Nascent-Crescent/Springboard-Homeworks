/* Welcome to the SQL mini project. You will carry out this project partly in
the PHPMyAdmin interface, and partly in Jupyter via a Python connection.

This is Tier 2 of the case study, which means that there'll be less guidance for you about how to setup
your local SQLite connection in PART 2 of the case study. This will make the case study more challenging for you: 
you might need to do some digging, aand revise the Working with Relational Databases in Python chapter in the previous resource.

Otherwise, the questions in the case study are exactly the same as with Tier 1. 

PART 1: PHPMyAdmin
You will complete questions 1-9 below in the PHPMyAdmin interface. 
Log in by pasting the following URL into your browser, and
using the following Username and Password:

URL: https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

In this case study, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */


/* QUESTIONS 
/* Q1: Some of the facilities charge a fee to members, but some do not.
Write a SQL query to produce a list of the names of the facilities that do. */


SELECT name FROM `Facilities` WHERE membercost > 0;


RESULT:
localhost/admin_springboard/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/table/sql&db=admin_springboard&table=Facilities

   Showing rows 0 -  4 (5 total, Query took 0.0007 seconds.)


SELECT name 
FROM `Facilities` 
WHERE membercost > 0;


name	
Tennis Court 1	
Tennis Court 2	
Massage Room 1	
Massage Room 2	
Squash Court	


/* Q2: How many facilities do not charge a fee to members? */

SELECT name FROM `Facilities` WHERE membercost = 0;

localhost/admin_springboard/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/table/sql&db=admin_springboard&table=Facilities

   Showing rows 0 -  3 (4 total, Query took 0.0007 seconds.)


SELECT name 
FROM `Facilities` 
WHERE membercost = 0;


name	
Badminton Court	
Table Tennis	
Snooker Table	
Pool Table	


/* Q3: Write an SQL query to show a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost.
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT facid, name, membercost, monthlymaintenance FROM `Facilities` WHERE membercost < (monthlymaintenance * 0.20);

localhost/admin_springboard/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/table/sql&db=admin_springboard&table=Facilities

   Showing rows 0 -  8 (9 total, Query took 0.0005 seconds.)


SELECT facid, name, membercost, monthlymaintenance 
FROM `Facilities` 
WHERE membercost < (monthlymaintenance * 0.20);


facid	name	membercost	monthlymaintenance	
0	Tennis Court 1	5.0	200	
1	Tennis Court 2	5.0	200	
2	Badminton Court	0.0	50	
3	Table Tennis	0.0	10	
4	Massage Room 1	9.9	3000	
5	Massage Room 2	9.9	3000	
6	Squash Court	3.5	80	
7	Snooker Table	0.0	15	
8	Pool Table	0.0	15	



/* Q4: Write an SQL query to retrieve the details of facilities with ID 1 and 5.
Try writing the query without using the OR operator. */

SELECT * FROM `Facilities` WHERE facid IN (1,5);

localhost/admin_springboard/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/&route=%2F&db=admin_springboard&table=Facilities

   Showing rows 0 -  1 (2 total, Query took 0.0006 seconds.)


SELECT * FROM `Facilities` WHERE facid IN (1,5);


facid	name	membercost	guestcost	initialoutlay	monthlymaintenance	expense_label	
1	Tennis Court 2	5.0	25.0	8000	200	NULL	
5	Massage Room 2	9.9	80.0	4000	3000	NULL	




/* Q5: Produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100. Return the name and monthly maintenance of the facilities
in question. */

SELECT name, monthlymaintenance,
CASE
	WHEN monthlymaintenance > 100 THEN 'expensive'
    ELSE 'cheap'
END AS expensiveness
FROM `Facilities`;

localhost/admin_springboard/Facilities/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/&route=%2F&db=admin_springboard&table=Facilities

   Showing rows 0 -  8 (9 total, Query took 0.0006 seconds.)


SELECT name, monthlymaintenance,
CASE
	WHEN monthlymaintenance > 100 THEN 'expensive'
    ELSE 'cheap'
END AS expensiveness
FROM `Facilities`;


name	monthlymaintenance	expensiveness	
Tennis Court 1	200	expensive	
Tennis Court 2	200	expensive	
Badminton Court	50	cheap	
Table Tennis	10	cheap	
Massage Room 1	3000	expensive	
Massage Room 2	3000	expensive	
Squash Court	80	cheap	
Snooker Table	15	cheap	
Pool Table	15	cheap	



/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Try not to use the LIMIT clause for your solution. */

SELECT firstname, surname, joindate FROM `Members` ORDER BY joindate DESC LIMIT 5;

localhost/admin_springboard/Members/		https://frankfletcher.co/springboard_phpmyadmin/index.php?route=/sql&pos=0&db=admin_springboard&table=Members

   Showing rows 0 -  4 (5 total, Query took 0.0008 seconds.) [joindate: 2012-09-26 18:08:45... - 2012-09-18 19:04:01...]


SELECT firstname, surname, joindate
FROM `Members`
ORDER BY joindate DESC
LIMIT 5;


firstname	surname	joindate   	
Darren	Smith	2012-09-26 18:08:45	
Erica	Crumpet	2012-09-22 08:36:38	
John	Hunt	2012-09-19 11:32:45	
Hyacinth	Tupperware	2012-09-18 19:32:05	
Millicent	Purview	2012-09-18 19:04:01	




/* Q7: Produce a list of all members who have used a tennis court.
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */




/* Q8: Produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30. Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */


/* Q9: This time, produce the same result as in Q8, but using a subquery. */


/* PART 2: SQLite

Export the country club data from PHPMyAdmin, and connect to a local SQLite instance from Jupyter notebook 
for the following questions.  

QUESTIONS:
/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

/* Q11: Produce a report of members and who recommended them in alphabetic surname,firstname order */


/* Q12: Find the facilities with their usage by member, but not guests */


/* Q13: Find the facilities usage by month, but not guests */

