class CoffeeBoard < Sinatra::Base
  include CoffeeImageUtils

  SCROLL_FOLDER = "./scroll_files"
  CODE_FOLDER = "/home/pi/display16x32/rpi-rgb-led-matrix"

  get '/' do
    @image_files = get_all_scrollers
    haml :index, :format => :html5, :layout => :simple_layout
  end

  get '/set_scroll/:file' do
    # kill previous runs
    `sudo pkill led-matrix`
    # run in a forked process
    command = "sudo #{CODE_FOLDER}/led-matrix 1 #{SCROLL_FOLDER}/#{params[:file]}.ppm"
    fork { exec command }

    redirect back
  end

  def get_all_scrollers
    images = ["#{SCROLL_FOLDER}/*.ppm"]
    FileList[*images].map {|file| get_file_name file}
  end

  post '/upload' do
    return "No file selected" if params[:file].nil?

    uploaded_file = params[:file][:tempfile].path
    name = get_file_name(params[:file][:filename])
    CoffeeImageUtils::process_ppm(uploaded_file, name)

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
