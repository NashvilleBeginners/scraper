require File.expand_path('../scraper/downloader', __FILE__)

class Scraper
  include Celluloid
  attr_reader :base, :start_page, :downloader, :links, :logger

  def initialize
    @base = 'http://www.presidency.ucsb.edu/'
    @start_page = '2016_election.php'
    @downloader = Downloader.pool
    @links = Hash.new {|h, k| h[k] = false}
    @links[@start_page] = false
    @logger = ::Logger.new($stdout)
    bootstrap

    super
  end

  def bootstrap
    process_links(get_links(parse_page(get_page(start_page))))
  end

  def get_page(url)
    logger.info "GETTING: #{base}#{url}"
    downloader.download("#{base}#{url}", logger)
  end

  def parse_page(page)
    Nokogiri::HTML(page)
  end

  def get_links(page)
    page.css('a')
  end

  def process_links(links)
    logger.info "Number of links: #{links.length}"
    links.each do |link|
      process_link(link)
    end
  end

  def process_link(link)
    url = link["href"]
    begin
      unless self.links[url]
        raw_page = get_page(url).read
        page = parse_page(raw_page)
        links = get_links(page)
        self.links[url] = true
        File.write(File.join('downloads/', url.gsub(/\.\.\//, '')), raw_page) if raw_page
        process_links(links)
      end
    rescue
      nil
    end
  end
end
