using { school, sap.common } from '../db/data-model';

service AdminService {
   entity Students as projection on school.Students{
   	*,
   	registrations: redirected to Registrations,
   };
   entity Courses as projection on school.Courses{
   	*,
   	registrations: redirected to Registrations,
   };
   entity Registrations as projection on school.Registrations{
   	 *,
        course: redirected to Courses,
        student: redirected to Students,
   };
   entity ClassRooms as projection on school.Classrooms;
   
   
   view StudentByCourses as SELECT  from school.Courses course{
		key ID,
		name, 
		registrations.student.name as studentName
	};

}

