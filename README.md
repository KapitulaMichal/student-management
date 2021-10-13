Student management

Application presents simple student management system for gathering the list of students and courses to which those students are enrolled and saving those information in the database. It uses an annotation based configuration.

## TOOLS & TECHNOLOGIES
	1. Java
	2. Spring MVC
	3. Spring JDBC
	4. MySQL
<br/>


As the first thing in the application user must log in into the teacher account using email and password. After that presented is the table of students currently present in the database. From there user can add new students, edit and delete existing ones. The insertion of new data is validated with the Spring Validation API. 

The other part of the application are the existing courses. User is presented the list of courses from which he can choose one and see, which students are enrolled into that course. From here one can freely enroll students into the current class or delete them from it. Each student can be enrolled into any course creating the many-to-many relation in the database.