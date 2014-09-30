class CoffeeBoard < Sinatra::Base
  get '/' do
    haml :index, :format => :html5
  end
end
