class StaticPagesController < ApplicationController

	require 'BaseXClient.rb'
  	require 'SparqlQuery.rb'
  	require 'duck_duck_go'

	def about	
	end

	def help
		ddg = DuckDuckGo.new
		bart = ddg.zeroclickinfo("Bartpflege") # ZeroClickInfo object
		@bartpflege = bart.abstract_text
		@quelle=bart.abstract_url
	end
  
  def home	
  end

  def news
       
    xml_doc = File.read(Rails.root + 'public/xml/PortraitData.xml')
    @xml_obj = Nokogiri::XML(xml_doc)
    @test = "HAllO"

    @person = [1,2,3,4,5]
    @paginatable_array = Kaminari.paginate_array(@person).page(params[:page]).per(1)

    # create and execute SparqlQuery, then store result
    @mg = SparqlQuery.new  
    list = @mg.createQueryList
    dbp_query = @mg.chooseQuery(list)
    @result = @mg.runQueryAgainstDBPedia(dbp_query)


    @objektname =  @xml_obj.xpath("//obj/objektname").collect  {|node| node.text.strip}
    @objektid =  @xml_obj.xpath("//obj/objektid").collect  {|node| node.text.strip}
    @name =  @xml_obj.xpath("//obj/name").collect  {|node| node.text.strip}
    @birth =  @xml_obj.xpath("//obj/birth").collect  {|node| node.text.strip}
    @death =  @xml_obj.xpath("//obj/death").collect  {|node| node.text.strip}

    #create BaseX-Session
    session = BaseXClient::Session.new("localhost", 1984, "admin", "admin")

    
    
  	begin
     	 #create query instance
  		
  		@input2 ="xquery count(//obj/objektid)"

		puts "#{@input2}"
  		session.execute("open dbxml")
		@dbObjectCount = session.execute(@input2)
   		
		puts @dbObjectCount
  		query = session.query(@input2)
  		# close query instance
  		print query.close()
  		
		#puts query
  		rescue Exception => e
  			 #print exception
 				puts e
 			end

 		 #close session
 		 session.close
  		
 		end


  	def contact
  	end

end
