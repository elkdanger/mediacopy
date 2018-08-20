require 'logger'

module MediaCopy
  # Handles logging to the console
  module Log
    # Writes an info message to the log
    def self.info(msg)
      @log.info msg
    end

    @log = Logger.new 'output.log', 10, 1_024_000
  end
end
