require 'nokogiri'
require 'celluloid'
require 'celluloid/io'
require 'open-uri'
require 'downloader'
require 'link_state'
require 'async_logger'
require 'writer'
require 'parser'

class Scraper < Celluloid::SupervisionGroup
  pool Downloader, as: :downloader_pool, size: 10
  pool Writer, as: :writer, size: 10
  supervise AsyncLogger, as: :logger
  supervise Parser, as: :parser
  supervise LinkState, as: :link_state
end
