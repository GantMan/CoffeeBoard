![CoffeeBoard Logo](http://i.imgur.com/c401IwO.jpg)

### A lovely web-driven billboard to hang over the coffee, powered by a simple Sinatra app on the Raspberry Pi.

![CoffeeBoard](http://i.imgur.com/lZQFmTt.gif)

#### Setup Steps

* This simple website can be run on the Raspberry Pi to easily display amazing 16x32 LED scrolling images. Firstly, make sure you have [set up your 16x32 board](https://learn.adafruit.com/connecting-a-16x32-rgb-led-matrix-panel-to-a-raspberry-pi).

* Also make sure you've installed imagemagick with `sudo apt-get install imagemagick`

* Then make sure you have [Ruby ready to roll](http://www.iconoclastlabs.com/blog/ruby-on-rails-on-the-raspberry-pi-b-with-rbenv).

> To see more pictures/info/details on the process, you can see my release blog post here: [Coffe-Board a website powered social image scroller](http://www.iconoclastlabs.com/blog/website-powered-social-image-scroller-coffeeboard)

#### Assure it runs on startup
When editing the `/etc/rc.local` to kick off the Sinatra app with this explicit command.
`sudo -u pi /home/pi/.rbenv/versions/2.1.2/bin/ruby /home/pi/.rbenv/versions/2.1.2/bin/rackup /home/pi/CoffeeBoard/config.ru`

#### Roadmap
This is a playful low-priority project for me.  I hope to continue to advance features identified in the [issue tracker](https://github.com/GantMan/CoffeeBoard/issues)

Biggest roadmap item that is not an enhancement is to add tests.

#### If you use this project in any way, please let me know!  

