class Brewery
	attr_accessor :brewery
def initialize(brewery)
@brewery = brewery
#@style = style
#@beer = beer
end

def find_brewery
	response = HTTParty.get("http://api.brewerydb.com/v2/search?q=#{@brewery}&type=brewery&key=181c714e2e3b0592a86e514652c5e727")
	@brewery_short = response["data"].first["nameShortDisplay"]
	our_brewery = response["data"].first["name"]
	description = response["data"].first["description"]
	puts our_brewery
	puts description
	find_beer
end

def find_beer
	response = HTTParty.get("https://api.brewerydb.com/v2/search?q=#{@brewery_short}&type=beer&key=181c714e2e3b0592a86e514652c5e727")
	beer_rand = response.length
	# beer_rando = beer_rand.shuffle
	# 
	i = 0
	while i < beer_rand do
		beer_name[i] = response["data"][i]["name"]
		beer_style[i] = response["data"][i]["style"]["name"]
		# beer_abv = response["data"].first
		beer_desc[i] = response["data"][i]["style"]["description"]
		#beers = []
		puts "Here are a selection of their beers"
		puts "Beer #{i}"
		puts beer_name[i]
		puts beer_style[i]
		puts beer_desc[i]
		i += 1
	end
	beer = Beer.new(beer_name, beer_style, beer_desc)
	
end

end