using { school, sap.common } from '../db/data-model';




service StudentService {

  @readonly entity Courses as SELECT from school.Courses{
  	*, classRoom.name as ClassRoomName
  };
   
  entity Enrollments as projection on school.Enrollments;
  entity Students as projection on school.Students;
  
  @readonly entity ClassRooms as projection on school.Classrooms;
  @readonly entity Classes as projection on school.Classes{
    *, course.name as courseName
  };
  
}