CoffeeBoard
===========

### A lovely billboard to hang over the coffee, powered by a simple Sinatra app on the Raspberry Pi.

#### Setup Steps

This simple website can be run on the Raspberry Pi to easily display amazing 16x32 LED scrolling images. Firstly, make sure you have [set up your 16x32 board](https://learn.adafruit.com/connecting-a-16x32-rgb-led-matrix-panel-to-a-raspberry-pi).

Also make sure you've installed imagemagick with `sudo apt-get install imagemagick`

Then make sure you have Ruby ready to roll.

#### Assure it runs on startup
When editing the `/etc/rc.local` to kick off the Sinatra app with this explicit command.
`sudo -u pi /home/pi/.rbenv/versions/2.1.2/bin/ruby /home/pi/.rbenv/versions/2.1.2/bin/rackup /home/pi/CoffeeBoard/config.ru`