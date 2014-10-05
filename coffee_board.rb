class CoffeeBoard < Sinatra::Base
  SCROLL_FOLDER = "./scroll_files"

  get '/' do
    @image_files = get_all_scrollers
    haml :index, :format => :html5, :layout => :simple_layout
  end

  get '/set_scroll/:file' do
    # kill previous runs
    `sudo pkill led-matrix`
    # run in a forked process
    command = "sudo /home/pi/display16x32/rpi-rgb-led-matrix/led-matrix 1 #{SCROLL_FOLDER}/#{params[:file]}"
    fork { exec command }

    redirect back
  end

  def get_all_scrollers
    images = ["#{SCROLL_FOLDER}/*.ppm"]
    FileList[*images].map {|file| file.match('([^\/]+)\..+$')[0]}
  end

  post '/upload' do
    return "No file selected" if params[:file].nil?

    filename = File.join(SCROLL_FOLDER, params[:file][:filename])
    File.write(filename, params[:file][:tempfile].read)
    redirect back
  end


  helpers do
    def link_to(url,text=url,opts={})
      attributes = ""
      opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
      "<a href=\"#{url}\" #{attributes}>#{text}</a>"
    end
  end
end
