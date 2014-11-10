# Folder Paths Constants
COFFEE_FOLDER = File.dirname(File.expand_path("..",__FILE__))
SCROLL_FOLDER = File.join(COFFEE_FOLDER, "scroll_files")
SYS_SCROLLS_FOLDER = File.join(SCROLL_FOLDER, "system_scrolls") #scroll images used by this app
THUMBNAIL_FOLDER = File.join(COFFEE_FOLDER, "public/images/thumbnails")

# It's likely you'll need to modify this path
CODE_FOLDER = "/home/pi/display16x32/rpi-rgb-led-matrix"

# Admin creds
UN = "admin"
PW = "coffee"

# Require passwords or allow the public to change the board?
PUBLIC_VIEW = true
PUBLIC_DELETE = false #todo
PUBLIC_UPLOAD = true
PUBLIC_CHANGE = true

# What's your LED board height?  16 or 32?
BOARD_HEIGHT = 16

# TODO: UI switches
SHOW_IMAGES = false
SHOW_DELETE_BUTTON = false