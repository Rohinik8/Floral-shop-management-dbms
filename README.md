# Floral-shop-management-dbms
1.	Install SQLite, PyCharm and Qt designer.
2.	Create a Database containing DDL and DML Statements for the Problem statement in the SQLite (.db file)
3.	Import SQLite database in PyCharm by following the below steps.
Steps:
•	Go to database in PyCharm select accordingly as shown below.

•	Now type file name which you want to import.
                Copy the path of .db file and paste it in File as shown below.
 
•	Click on OK.
•	Now Required database is successfully imported to PyCharm application. It is visible in database section.
 


4.	Create .ui file in the Qt designer on the basis of our requirements.
5.	Save the .ui file where we have python project folder.
  For example:\Users\Dell Laptop\PycharmProjects\pythonProject
6.	 open PyCharm application.
7.	Now .ui fie is visible in the PyCharm  application that is in the venv folder .
 
8.	Run .ui file in the terminal by giving name of your .ui file and give any name for .py file using the following command.
pyuic5 -x filename -o program file
 ex: pyuic5 -x DBA_Project.ui -o Project.py
 

9.	After step 7 Project.py visible in venv folder where .ui file is present. Click on that file code is automatically visible for the  Qt design. Do Changes in code on the basis of Your Requirement.
10. Run the .py file then it will prompt Qt design.
 


Inserting new Employee details:
 
Deleting Details of Particular Employee using Employee ID:
 

Searching for a particular Employee details using employee ID:
 

Displaying data:
 
