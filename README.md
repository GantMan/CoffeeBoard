![CoffeeBoard Logo](http://i.imgur.com/c401IwO.jpg)

### A lovely web-driven billboard to hang over the coffee, powered by a simple Sinatra app on the Raspberry Pi.

![CoffeeBoard](http://i.imgur.com/lZQFmTt.gif)

#### Setup Steps

This simple website can be run on the Raspberry Pi to easily display amazing 16x32 or 32x32 LED scrolling images. To set up your own CoffeeBoard, follow these simple steps.

* Firstly, make sure you have your LED matrix set up correctly.  You can follow this tutorial for [setting up a 16x32 board](https://learn.adafruit.com/connecting-a-16x32-rgb-led-matrix-panel-to-a-raspberry-pi).

* You then need to switch your C app to [the updated version](https://github.com/hzeller/rpi-rgb-led-matrix) and connect GPIO Pin 10 to address D if you're using a 32x32 display.
![32x32 LED GPIO](https://raw.githubusercontent.com/GantMan/CoffeeBoard/master/_art/pins.png)

* Make sure you've installed imagemagick with `sudo apt-get install imagemagick`

* Then make sure you have [Ruby ready to roll on your Pi](http://www.iconoclastlabs.com/blog/ruby-on-rails-on-the-raspberry-pi-b-with-rbenv).

* Pull down this code and modify `config/settings` to fit your particulars.

**That's it!**  Run by typing `rackup` in the CoffeeBoard folder

> To see more pictures/info/details on the process, you can see my release blog post here: [Coffe-Board a website powered social image scroller](http://www.iconoclastlabs.com/blog/website-powered-social-image-scroller-coffeeboard)

#### Assure it runs on startup
When editing the `/etc/rc.local` to kick off the Sinatra app with this explicit command.
`sudo /home/pi/.rbenv/versions/2.1.2/bin/ruby /home/pi/.rbenv/versions/2.1.2/bin/rackup -p 80 /home/pi/CoffeeBoard/config.ru`

#### Presentation
Slides: http://slides.com/gantlaborde/coffeeboard/live#/

#### Roadmap
This is a playful low-priority project for me.  I hope to continue to advance features identified in the [issue tracker](https://github.com/GantMan/CoffeeBoard/issues)

Biggest roadmap item that is not an enhancement is to add tests.

#### I enjoy seeing my code in the wild!  Please email me pics of yours!

