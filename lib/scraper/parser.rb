class Parser
  include Celluloid

  def parse(page_url, raw_page)
    page = Nokogiri::HTML(raw_page)
    process_hrefs(page_url, page)
  end

  def process_hrefs(page_url, page)
    page.css('a').each do |link|
      absolute_uri = URI.join(page_url, link["href"]).to_s
      Actor[:downloader_pool].async.download(absolute_uri)
    end
  end
end