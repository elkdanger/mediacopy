require 'logger'
require 'mediacopy/config'

module MediaCopy
  # Handles logging to the console
  module Log
    PATH = MediaCopy::Config.home_path('output.log').freeze

    @log = Logger.new PATH, 10, 1_024_000

    # Writes an info message to the log
    def self.info(msg, name = '')
      @log.info msg if name == ''
      @log.info(name) { msg } unless name == ''
    end

    # Removes the log file
    def self.clear
      FileUtils.rm PATH
    end
  end
end
