module CoffeeImageUtils

  SCROLL_FOLDER = "./scroll_files"
  CODE_FOLDER = "/home/pi/display16x32/rpi-rgb-led-matrix"

  def get_file_name file_path
    file_path.match('([^\/]+)\..+$')[1]
  end
  module_function :get_file_name

  def process_ppm file, name
    image = MiniMagick::Image.open(file)

    # Assure format converted to PPM
    image.format "PPM" unless image.type == "PPM"

    # Assure size is at least 16 high
    image.resize "x16" if image.height > 16

    image.write "#{SCROLL_FOLDER}/#{name}.ppm"
  end
  module_function :process_ppm

  def get_all_scrollers
    images = ["#{SCROLL_FOLDER}/*.ppm"]
    FileList[*images].map {|file| get_file_name file}
  end

end