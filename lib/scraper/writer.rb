require 'fileutils'

class Writer
  include Celluloid

  attr_reader :dir

  def initialize(*)
    @dir = 'downloads/'
    super
  end

  def write(file_name, data)
    uri = URI.parse(file_name)
    path = File.expand_path(File.join(dir, "#{uri.host}#{uri.path}"))
    FileUtils.mkdir_p File.dirname(path) unless Dir.exists?(File.dirname(path))
    File.write(path, data) if data
  end
end