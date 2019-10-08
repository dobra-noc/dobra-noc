require 'rpi_gpio'

class Led

  def initialize(red, green, blue)
    clean_up_pins
    RPi::GPIO.set_numbering :board

    @red = red
    @green = green
    @blue = blue

    set_pins
  end

  def set_pins
    [@red, @green, @blue].each { |color| RPi::GPIO.setup color, :as => :output, :initialize => :low }
  end

  def turn_off_pins
    [@red, @green, @blue].each { |color| RPi::GPIO.set_low color }
  end

  def working(timer = 0.5)
    RPi::GPIO.set_high @green
    sleep timer
    RPi::GPIO.set_low @green
  end

  def not_working(timer = 0.5)
    RPi::GPIO.set_high @red
    sleep timer
    RPi::GPIO.set_low @red
    sleep timer
  end

  def disconnected(timer = 0.1)
    RPi::GPIO.set_high @red
    sleep timer
    RPi::GPIO.set_low @red
    sleep timer
  end

  def out_of_disk_space(timer = 0.5)
    RPi::GPIO.set_high @blue
    sleep timer
    RPi::GPIO.set_high @red
    sleep timer
    RPi::GPIO.set_low @red
    RPi::GPIO.set_low @blue
  end

  def device_not_connected
    RPi::GPIO.set_high @red
  end

  def clean_up_pins
    RPi::GPIO.clean_up
  end
end
