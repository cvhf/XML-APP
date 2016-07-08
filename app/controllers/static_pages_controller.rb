class StaticPagesController < ApplicationController

	require 'BaseXClient.rb'
  	require 'SparqlQuery.rb'
  	require 'duck_duck_go'

	def about	
	end

	def help
		ddg = DuckDuckGo.new
		bart = ddg.zeroclickinfo("Bartpflege") # ZeroClickInfo object
		@bartpflege = zci.abstract_text
		@quelle=zci.abstract_url
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

    # create BaseX-Session
    #session = BaseXClient::Session.new("localhost", 1984, "admin", "admin")

    #randomNr = 1 +rand(13000)
  	begin
     	# create query instance
  		#@input = "//obj[position()<6]/*/a8000/text()"
  		#@input2 ="for $obj in subsequence(db:open('DBXML')/root/obj,"+randomNr+", 10) let $per := $obj/objektid return $per"

  		#session.execute("open DBXML")
  		#@query = session.query(@input2)
  		# close query instance
  		#print query.close()
  		
  		#rescue Exception => e
  			# print exception
 				#puts e
 			end

 		# close session
 		# session.close
  		
 		end

  	def contact
  	end

end
