require 'rubygems'
require 'bundler'

Bundler.require

require './coffee_board'
use Rack::Static, :urls => ["/css", "/images"], :root => "public"
run CoffeeBoard