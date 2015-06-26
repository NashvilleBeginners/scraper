ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
$:.unshift File.expand_path('../../lib/scraper', __FILE__)
require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'scraper'
