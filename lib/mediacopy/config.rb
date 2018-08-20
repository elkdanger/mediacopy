require 'fileutils'

module MediaCopy
  # Holds configuration settings
  module Config
    # The home directory where database and additional config is stored
    HOME = File.expand_path('~/.mediacopy').freeze

    # Constructs a file path to this gem's home directory,
    # creating it if it doesn't already exist.
    def self.home_path(*parts)
      FileUtils.mkdir_p(HOME) unless Dir.exist? HOME

      File.expand_path(File.join(HOME, parts))
    end
  end
end
