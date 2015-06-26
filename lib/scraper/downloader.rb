class Downloader
  include Celluloid

  def download(url)
    return if Actor[:link_state].downloaded?(url)

    Actor[:link_state].async.downloaded!(url)
    contents = open(url).read
    Actor[:writer].async.write(url, contents)
    Actor[:parser].async.parse(url, contents)
  end
end