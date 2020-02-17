





module.exports =  autoID = async (entity,tx) => {

   let selectQuery = "SELECT from school."+entity+"{max(ID) max}"
   let query = cds.parse.cql(selectQuery);
   let result = await tx.run(query);   
   
   return result[0].max + 1;
}