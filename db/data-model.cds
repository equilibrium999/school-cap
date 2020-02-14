namespace school;
using { User, Country, managed } from '@sap/cds/common';


entity Students: managed {
	key ID: Integer;
	name  : String;
	birthdate: Date;
	registrations: Association to many Registrations on registrations.student = $self;
}

entity Courses: managed{
	key ID: Integer;
	name: localized String;
	courseLoad: Integer;
	registrations: Association to many Registrations on registrations.course = $self;
	classRoom: Association to Classrooms;
	
}

entity Registrations: managed{
	key ID: UUID;
	student: Association to Students;
	course: Association to Courses;
	Date: Date;
}

entity Classrooms: managed{
	key ID: Integer;
	name: String;
	maxStudents: Integer;
	courses: Association to many Courses on courses.classRoom = $self;
	
}


/*

entity Books {
  key ID : Integer;
  title  : localized String;
  author : Association to Authors;
  stock  : Integer;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders : managed {
  key ID  : UUID;
  book    : Association to Books;
  country : Country;
  amount  : Integer;
}
*/