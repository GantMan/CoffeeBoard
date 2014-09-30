class CoffeeBoard < Sinatra::Base
  SCROLL_FOLDER = "./scroll_files"

  get '/' do
    @image_files = get_all_scrollers(SCROLL_FOLDER) || []
    p @image_files
    haml :index, :format => :html5, :layout => :simple_layout
  end

  def get_all_scrollers folder
    images = %w[ppm PPM]
    images.map! {|ext| "#{folder}/*.#{ext}" }
    FileList[*images]
  end
end
