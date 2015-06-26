require 'logger'

class AsyncLogger
  include Celluloid

  attr_reader :loggers

  def initialize(*)
    @loggers = [::Logger.new($stdout), ::Logger.new('logs/the.log')]
    super
  end

  [:debug, :info, :error].each do |level|
    define_method level do |message|
      loggers.each do |logger|
        logger.send level, message
      end
    end
  end
end