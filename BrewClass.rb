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
	our_brewery = response["data"].first["name"]
	description = response["data"].first["description"]
	binding.pry
	puts our_brewery
	puts description
end

end

brewery = Brewery.new("trve").find_brewery