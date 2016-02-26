require 'httparty'
require 'pry'

class Brewery

def initialize(brewery)
@brewery = brewery
#@style = style
#@beer = beer
end

def find_brewery
	response = HTTParty.get("http://api.brewerydb.com/v2/search?q=#{@brewery}&type=brewery&key=181c714e2e3b0592a86e514652c5e727")
	our_brewery1 = response
	#our_brewery = response["data"]["name"]
	binding.pry
	#puts our_brewery
end

end

brewery = Brewery.new("trve").find_brewery