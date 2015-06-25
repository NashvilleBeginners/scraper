ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'nokogiri'
require 'celluloid'
require 'celluloid/io'
require File.expand_path('../../lib/scraper', __FILE__)
