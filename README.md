timeclock
=========
The time clock application must be built using plain Ruby. No Rails, ActiveRecord or any other MVC framework. We want to see your database and querying skills also.
* Build an application that allows employees to enter an ID into a form and then click a button to clock-in/out.
* The clock-in and out times should be saved in a MySQL database and the program should keep track of an employee’s status, whether clocked in/out so that the next time they access the system it will know to do a clock-
out vs. a clock-in and vice-versa.
* An employee cannot clock-in when they are already clocked-in or clock-
out when they already are.
* When the employee clocks in and out, they should get a confirmation that the action was successful and the time they clocked in/out, the total amount they just worked, and any other information you’d like to display on the screen. 
* Also create a way to add and remove employees. 
* You should be able to add an employee’s first name, last name, ID and set if the particular user is an “employee” or an “administrator”. 
* When an administrator clocks in, the interface should clock them in and keep track of their time (just like a normal employee), however, the interface will ALSO display ALL of the other employees and their times worked over the last 7 days.  
* This report is only shown when an administrator clocks in. 
* You do not need to create a secure login or anything to access the script. 
* Add a report button for employees so that they can generate a simple report of their time worked over the last 7 days. 
* Write the unit and functional tests for all models and controllers. Use RSpec for unit testing.
* Use CSS to organize the UI.

Important: Use git for source code management, and COMMIT OFTEN. We'd like to see the changes as you progress.

Bonus: Write integration tests.

Deliverables: The application in Github with all the necessary codes, SQL dump of the tables and tests to run on anybody's machine that has Ruby on Rails on it. (We need to be able to run it in our machine).
