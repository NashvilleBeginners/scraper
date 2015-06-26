require_relative '../scraper'

class Supervisor < Celluloid::SupervisionGroup
  pool Downloader, as: :downloader, size: 5
  supervise Scraper, as: :scraper
end

