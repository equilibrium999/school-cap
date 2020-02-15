/**
 * Implementation for StudentService defined in ./student-service.cds
 */

module.exports = (srv) => {

  srv.before ('CREATE','Registrations', async (req) => {
    
    //Get transaction of the request
    const tx = cds.transaction(req);

    //Search using CQL, parsing to CQN
    //MOre infos in https://cap.cloud.sap/docs/cds/cql
    let selectQuery = "SELECT from school.Registrations{count(student_ID) as count} where course_ID = " + req.data.course_ID;
    let query = cds.parse.cql(selectQuery);
    let studentCount = await tx.run(query);
    studentCount = studentCount[0];
    
    //Using CQN to read Courses
    //More infos in https://cap.cloud.sap/docs/cds/cqn
    let courses = await tx.read('school.Courses').where({ID:req.data.course_ID});
    let classRoomId = courses[0].classRoom_ID;

    // Using CQN SELECT to read maxClassRoom
    let maxClassRoom = await tx.run(SELECT('maxStudents').from('school.Classrooms').where({ID:classRoomId}));
    maxClassRoom = maxClassRoom[0];

    //Check Max Number of Students in ClassRoom
    if((studentCount.count + 1) > maxClassRoom.maxStudents)
      req.error(409,'Turma cheia');
  	
  })
  
}
