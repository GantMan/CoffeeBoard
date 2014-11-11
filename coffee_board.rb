class CoffeeBoard < Sinatra::Base
  include CoffeeImageUtils
  helpers CoffeeHelpers

  get '/' do
    protected! unless PUBLIC_VIEW
    @image_files = get_all_scrollers
    haml :index, :format => :html5, :layout => :simple_layout
  end

  get '/set_scroll/:file' do
    protected! unless PUBLIC_CHANGE
    # kill previous runs
    `sudo pkill led-matrix`
    # run in a separate process
    case CODE_ENGINE
    when :adafruit
      command = "sudo #{CODE_FOLDER}/led-matrix 1 '#{SCROLL_FOLDER}/#{params[:file]}.ppm'"
      fork { exec command }
    when :hzeller
      command = "sudo #{CODE_FOLDER}/led-matrix -d -D 1 '#{SCROLL_FOLDER}/#{params[:file]}.ppm'"
    end

    redirect back
  end

  post '/upload' do
    protected! unless PUBLIC_UPLOAD
    return "No file selected" if params[:file].nil?

    uploaded_file = params[:file][:tempfile].path
    name = get_file_name(params[:file][:filename])
    CoffeeImageUtils::process_ppm(uploaded_file, name)

    redirect back
  end

  get '/delete/:file' do
    protected! unless PUBLIC_DELETE
    CoffeeImageUtils::remove(params[:file])
    redirect back
  end

end
