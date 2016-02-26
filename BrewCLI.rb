require 'httparty'
require 'pry'
require_relative 'beer.rb'

class Brewery

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
	#select random 10 goes here
	beer_name = response["data"].first["name"]
	beer_style = response["data"].first["style"]["name"]
	# beer_abv = response["data"].first
	beer_desc = response["data"].first["style"]["description"]
	beers = []
	beer = Beer.new(beer_name, beer_style, beer_desc)
	puts beer.name
	puts beer.style
	puts beer.description
end

end

brewery = Brewery.new("Austin Beerworks").find_brewery

# https://api.brewerydb.com/v2/search?q=trve&type=beer&key=181c714e2e3b0592a86e514652c5e727