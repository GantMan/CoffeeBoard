class CoffeeBoard < Sinatra::Base
  get '/' do
    haml :index, :format => :html5, :layout => :simple_layout
  end
end
