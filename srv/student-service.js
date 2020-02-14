/**
 * Implementation for StudentService defined in ./student-service.cds
 */
module.exports = (srv) => {

  srv.before ('CREATE','Registrations', async (req) => {
  	
  	console.log(req);
  	
  })
  
}
