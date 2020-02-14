/**
 * Implementation for StudentService defined in ./student-service.cds
 */
module.exports = (srv)=>{
	
	
	// Use reflection to get the csn definition of Registration
  //const {Registration} = cds.entities
	
	  // Reduce stock of books upon incoming orders
  srv.before ('CREATE','Registrations', async (req)=>{
  	
  	console.log(req);
  	
  )}
  
}
    
  //  //const tx = cds.transaction(req), reg = req.data;
    
  //  if (reg.course){
    	
    	
    	
  //  	const affectedRows = reg.course.map(item => 
  //  		cds.read(Registrations).where({course.ID:item.course_id})
  //  	)
    	
  //  	//contar quantos registros tem para o curso e verificar se a quantidade é maior que o maximo de alunos da turma
    	
  //  	let totalRegistration = cds.read(Registrations).where({course:reg.course});
    	
  //  }
    
    
    
  //  let registration = SELECT.from('Registrations').where({course_id:'bar'})
    
    
    
    
    
    
    
  //  if (order.Items) {
  //    const affectedRows = await tx.run(order.Items.map(item =>
  //      UPDATE(Books) .where({ID:item.book_ID})
  //        .and(`stock >=`, item.amount)
  //        .set(`stock -=`, item.amount)
  //      )
  //    )
  //    if (affectedRows.some(row => !row)) req.error(409, 'Sold out, sorry')
  //  }
  //})
	
	
//}