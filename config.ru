# So this file can be run from any folder
Dir.chdir(File.dirname(File.expand_path(__FILE__)))

require 'rubygems'
require 'bundler'

Bundler.require

require './coffee_board'
use Rack::Static, :urls => ["/css", "/images"], :root => "public"
run CoffeeBoard