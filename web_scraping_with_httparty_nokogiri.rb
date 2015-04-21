### WEB-SCRAPING WITH HTTPARTY, NOKOGIRI ###

require 'httparty'
	#puts HTTParty.methods.sort

response = HTTParty.get('http://graph.facebook.com/jeff.shapiro')

## RESPONSE IS A SPECIAL CLASS OF HTTPARTY ##
	# p response.class
	# p "RESPONSE: ",response
	# p "RESPONSE CLASS: ",response.class
	# p "RESPONSE METHODS: ",response.methods
	# p "RESPONSE CODE: ",response.code
	# p "RESPONSE HEADER: ",response.headers
	# p "RESPONSE BODY: ",response.body

## HEADER IS A SPECIAL CLASS OF HTTPARTY (HASH-LIKE TRAITS) ##
		# p response.headers
		# p response.headers["content-type"]

## RESPONSE BODY IS A STRING ##
		# p response.body
		# p response.body.class

require 'json' #=> gem included with ruby by default to convert string to json
		# p JSON
		# p JSON.class
		# puts JSON.methods.sort

parsed_body = JSON.parse(response.body) #=> converts response.body from string to hash
		# p parsed_body.class
		# p parsed_body["first_name"] #=> hash is easier to reference for values
		# puts "My FB ID is #{parsed_body["id"]}"   			#=> example of how to use parsed body for output
		# puts "My FB Name is #{parsed_body["name"]}"			#=> example of how to use parsed body for output
							
							### PARSED_BODY ALSO CONTAINS ALL PROFILE INFO ###
							### FB DOES NOT RESPOND TO PUSH/PULL REQUESTS ###

### TO TEST PUSH/PULL, SEE: http://requestb.in/ ###

data = {first_name: 'JEFF', username: 'CODESHEFF'}
		# 	# HTTParty.post('http://requestb.in/1c51ozc1', {body: data})  #=> url created at requestb.in for testing (usually for new items)
		# 	# HTTParty.put('http://requestb.in/1c51ozc1', {body: data})		#more/less same as above (usually for updates)

				 		### FOR REQUESTBIN RESULTS SEE DOCS > MY PICS > CODING PICS> REQUESTBIN_OUTPUT ###

json_data = JSON.dump(data)
		# 	# HTTParty.post('http://requestb.in/1c51ozc1', {body: json_data}) #=> will be interpreted as a string, not as JSON

						### FOR REQUESTBIN RESULTS SEE DOCS > MY PICS > CODING PICS> REQUESTBIN_OUTPUT_2 ###

		# 	headers = { 'Content-Type' => 'application/json' }
		# 	HTTParty.post('http://requestb.in/1c51ozc1', {body: json_data, headers: headers})

						### FOR REQUESTBIN RESULTS SEE DOCS > MY PICS > CODING PICS> REQUESTBIN_OUTPUT_3 ###

response2 = HTTParty.get('http://finance.yahoo.com/q?s=AAPL')
					# p response2.code, response2.headers
					# puts response2.body 											#=> shows that data is in text/html and xml
					# puts response2.body.class

require 'nokogiri'	#=> nokogiri translates from HTML/XML
		# p Nokogiri.class
		# puts Nokogiri.methods.sort

dom = Nokogiri::HTML(response2.body)
		# p "CLASS",dom.class
		# puts dom.methods.sort
		# p dom.xpath("//*")  			#=> this will take a moment to run
		# p dom.xpath("//*").size		#=> this is why

## ON http://finance.yahoo.com/q?s=AAPL RIGHT-CLICK TICKER > INSPECT ELEMENT ##
		## TICKER -> span id="yfs_l84_aapl" ##
		# puts dom.xpath("//span").methods.sort	
		# p dom.xpath("//span").size		#=> less than above
		# p dom.xpath("//span[@id='yfs_l84_aapl']")
		# p dom.xpath("//span[@id='yfs_l84_aapl']").class

price_span = dom.xpath("//span[@id='yfs_l84_aapl']")
		# p price_span
		# 		### Check docs for Nokogiri::XML::Element for method to view text in element ###
		# p price_span.first
		# p price_span.first.content

live_price = price_span.first.content
		puts "Apple stock is currently trading at #{price_span.first.content}"

