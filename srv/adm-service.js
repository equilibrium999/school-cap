/**
 * Implementation for StudentService defined in ./student-service.cds
 */

const util = require('./util/util.js');


module.exports = (srv) => {


  srv.before('CREATE', 'Students', async (req) => {

    //Get transaction of the request
    const tx = cds.transaction(req);
    
    if (!req.data.ID) {      
      req.data.ID = await autoID('Students', tx);
      console.log(req.data);      
    }


  });

  srv.before('CREATE', 'Courses', async (req) => {

    //Get transaction of the request
    const tx = cds.transaction(req);
    
    if (!req.data.ID) {      
      req.data.ID = await autoID('Courses', tx);
      console.log(req.data);      
    }


  });


  srv.before('CREATE', 'ClassRooms', async (req) => {

    //Get transaction of the request
    const tx = cds.transaction(req);
    
    if (!req.data.ID) {      
      req.data.ID = await autoID('ClassRooms', tx);
      console.log(req.data);      
    }


  });


  srv.before('CREATE', 'Classes', async (req) => {

    //Get transaction of the request
    const tx = cds.transaction(req);
    
    if (!req.data.ID) {      
      req.data.ID = await autoID('Classes', tx);
      console.log(req.data);      
    }


  });


}
