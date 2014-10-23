module CoffeeImageUtils

  def get_file_name file_path
    file_path.match('([^\/]+)\..+$')[1]
  end
  module_function :get_file_name

  def process_ppm file, name
    image = MiniMagick::Image.open(file)

    #First make thumbnail
    image.format "JPEG"
    image.write "#{THUMBNAIL_FOLDER}/#{name}.jpg"

    # Assure format converted to PPM
    image.format "PPM" unless image.type == "PPM"
    # Assure size is at least 16 high
    image.resize "x#{BOARD_HEIGHT}" if image.height > BOARD_HEIGHT
    image.write "#{SCROLL_FOLDER}/#{name}.ppm"


  end
  module_function :process_ppm

  def get_all_scrollers
    images = ["#{SCROLL_FOLDER}/*.ppm"]
    FileList[*images].map {|file| get_file_name file}
  end

  def remove file
    File.delete("#{SCROLL_FOLDER}/#{file}.ppm")
    File.delete("#{THUMBNAIL_FOLDER}/#{file}.jpg")
  end
  module_function :remove

end