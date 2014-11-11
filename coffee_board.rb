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
    scroll_file params[:file]
    redirect back
  end

  post '/upload' do
    protected! unless PUBLIC_UPLOAD
    return "No file selected" if params[:file].nil?

    uploaded_file = params[:file][:tempfile].path
    name = get_file_name(params[:file][:filename])
    process_ppm(uploaded_file, name)

    redirect back
  end

  get '/delete/:file' do
    protected! unless PUBLIC_DELETE
    remove(params[:file])
    redirect back
  end

end
