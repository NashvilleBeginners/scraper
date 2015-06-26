require 'open-uri'
require 'celluloid'
class Downloader
  include Celluloid

  def download(url, logger)
    logger.info "OMG: #{url}"
    open(url)
  end
end