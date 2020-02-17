namespace school;
using { User, Country, managed } from '@sap/cds/common';


entity Students: managed {
	key ID: Integer;
	name  : String;
	birthDate: Date;
	enrollments: Association to many Enrollments on enrollments.student = $self;
}

entity Courses: managed{
	key ID: Integer;
	name: localized String;
	courseLoad: Integer;
	classRoom: Association to Classrooms;
	classes: Association to many Classes on classes.course = $self;
}

entity Classes: managed{
	key ID: Integer;
	name: String;
	beginDate: Date;
	finishDate: Date;
	course: Association to Courses;
	enrollments: Association to many Enrollments on enrollments.class = $self;
}

entity Enrollments: managed{
	key ID: UUID;
	student: Association to Students;
	class: Association to Classes;
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