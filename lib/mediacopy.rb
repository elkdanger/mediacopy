require 'fileutils'
require 'mediacopy/file_ledger'
require 'mediacopy/config'

# Performs initial set up for mediacopy module
module MediaCopy
  # Set up the home directory
  FileUtils.mkdir_p(Config::HOME) unless Dir.exist? Config::HOME

  # Set up the configuration system
  Config.setup

  # Set up the copy ledger
  Ledger.setup
end
