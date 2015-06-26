class LinkState
  include Celluloid

  attr_reader :urls

  def initialize
    @urls = Hash.new { |h, k| h[k] = false }
  end

  def downloaded?(url)
    urls[url]
  end

  def downloaded!(url)
    urls[url] = true
  end
end