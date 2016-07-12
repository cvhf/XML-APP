class SparqlQuery
  
  require 'sparql/client'
  require 'sparql'	
  require 'linkeddata' 
  
def createQueryList

     queries = Array.new(7)

    
     queries[0] = createAbstractQuery("Barthaar")
     queries[1] = createAbstractQuery("Barbier")  
     queries[2] = createAbstractQuery("Koteletten")
     queries[3] = createAbstractQuery("Dreitagebart")
     queries[4] = createAbstractQuery("Knebelbart")
     queries[5] = createAbstractQuery("Schnurrbart")
     queries[6] = createAbstractQuery("Soul_Patch")
     

     
     queries
  end  
  
  def createAbstractQuery(name)
        
	result = "
		prefix dbpedia: <http://de.dbpedia.org/resource/>
		prefix dbpedia-owl: <http://dbpedia.org/ontology/>

		select ?#{name} where { 
  			dbpedia:#{name} dbpedia-owl:abstract ?#{name} .
		}
		"
       result 
  end
  
  def chooseQuery(queryList)
    random = 1 + rand(queryList.length)
    queryList[random-1] 	
  end
  

  def runQueryAgainstDBPedia(query)
      
      client = SPARQL::Client.new("http://de.dbpedia.org/sparql")
      result = client.query(query)
      result = result.to_html
      result = result.html_safe
      result
  end


  if __FILE__ == $0
    @mg = SparqlQueryGenerator.new    
    list = @mg.createQueryList
    query = @mg.chooseQuery(list)
    #@mg.runQueryAgainstDBPedia(query)
    
  end
end


