require 'httparty'
require 'pry'
require_relative 'beer.rb'
require_relative 'brewery.rb'

brewery = Brewery.new("Austin Beerworks").find_brewery

# https://api.brewerydb.com/v2/search?q=trve&type=beer&key=181c714e2e3b0592a86e514652c5e727

