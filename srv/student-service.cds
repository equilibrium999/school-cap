using { school, sap.common } from '../db/data-model';




service StudentService {

  @readonly entity Courses as SELECT from school.Courses{
  	*, classRoom.name as ClassRoomName
  };
   
  entity Registrations as projection on school.Registrations;
  
  entity ClassRooms as projection on school.Classrooms;
  
}