require File.expand_path('../config/boot', __FILE__)

class Runner
  attr_reader :scraper

  def initialize
    @scraper = Scraper.run!
  end

  def bootstrap
    scraper[:downloader_pool].async.download('http://www.presidency.ucsb.edu/2016_election.php')
  end

  class << self
    def bootstrap
      new.bootstrap
    end
  end
end

