using { school, sap.common } from '../db/data-model';

service AdminService {
   entity Students as projection on school.Students{
   	*,
   	registrations: redirected to Registrations,
   };
   entity Courses as projection on school.Courses;
   	
   entity Registrations as projection on school.Registrations{
   	 *,
        class: redirected to Classes,
        student: redirected to Students,
   };
   entity ClassRooms as projection on school.Classrooms;
   
   entity Classes as projection on school.Classes;

   view StudentByCourses as SELECT  from school.Courses course{
		key ID,
		name, 
      classes.registrations.student.name as studentName
		
	};

}

