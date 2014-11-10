# So this file can be run from any folder
Dir.chdir(File.dirname(File.expand_path(__FILE__)))

require 'rubygems'
require 'bundler'

Bundler.require

# require all lib files and subfolder files
Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }
require './config/settings.rb'
require './coffee_board'

use Rack::Static, :urls => ["/css", "/images", "/javascript"], :root => "public"
run CoffeeBoard

# Show current IP address on startup
CoffeeImageUtils::make_ip_file
`sudo pkill led-matrix` # kill process if it is running
command = "sudo #{CODE_FOLDER}/led-matrix 1 '#{SYS_SCROLLS_FOLDER}/ip.ppm'"
fork { exec command }