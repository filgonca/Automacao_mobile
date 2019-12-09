# frozen_string_literal: true

# sobe em memoria as gems informadas
require "appium_console"
require "appium_lib"
require "cucumber"
require "pry"
require "report_builder"
require "rspec"

require_relative File.expand_path('../BaseScreen/base_screen.rb', __dir__)

# carrega arquivo de capacidades
if ENV['PLATFORM'].nil?
    ENV['PLATFORM'] = 'android'
    caps = Appium.load_appium_txt file: File.expand_path('../../android_cap.txt', __dir__), verbose: true
elsif ENV['PLATFORM'] == 'android'
    caps = Appium.load_appium_txt file: File.expand_path('../../android_cap.txt', __dir__), verbose: true
end

# configuracao do driver Appium
Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
