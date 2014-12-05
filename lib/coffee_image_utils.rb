module CoffeeImageUtils

  def get_file_name file_path
    file_path.match('([^\/]+)\..+$')[1]
  end
  module_function :get_file_name

  def process_ppm file, name
    image = MiniMagick::Image.open(file)
    # second variable needed so JPEG artifacts are not passed on
    thumbnail = MiniMagick::Image.open(file)

    #First make thumbnail
    thumbnail.format "JPEG"
    thumbnail.write "#{THUMBNAIL_FOLDER}/#{name}.jpg"

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

  def make_and_scroll_ip_file
    ip_address = `hostname -I`
    blank_file = SYS_SCROLLS_FOLDER + "/blank.ppm"
    ip_file = SYS_SCROLLS_FOLDER + "/ip.ppm"
    `convert -background black -fill white -gravity center -size 200x30 caption:"#{ip_address}" #{blank_file} +swap -composite -resize 222x32 #{ip_file}`
    scroll_file("ip", SYS_SCROLLS_FOLDER)
  end
  module_function :make_and_scroll_ip_file

  def scroll_file (file_name, folder=SCROLL_FOLDER)
    # kill previous runs
    `sudo pkill led-matrix`
    # run in a separate process
    case CODE_ENGINE
    when :adafruit
      command = "sudo #{CODE_FOLDER}/led-matrix 1 '#{folder}/#{file_name}.ppm'"
    when :hzeller
      command = "sudo #{CODE_FOLDER}/led-matrix -r #{BOARD_HEIGHT} -D 1 '#{SCROLL_FOLDER}/#{file_name}.ppm'"
    end

    fork { exec command }
  end
  module_function :scroll_file

end