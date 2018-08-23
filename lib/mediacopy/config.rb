require 'fileutils'
require 'yaml'
require 'mediacopy/transformers/transformer'

module MediaCopy
  # Holds configuration settings
  module Config
    # The home directory where database and additional config is stored
    HOME = File.expand_path('~/.mediacopy').freeze

    # Sets up the configuration system
    def self.setup
      template_path = File.expand_path(File.join(__dir__, '..', '..', 'example_config.yml'))

      # Path to the configuration file
      @config_path = home_path('config.yml').freeze

      # Replace the config file if it's not available
      FileUtils.cp(template_path, @config_path) unless File.exist? @config_path

      @options = YAML.load_file(@config_path).freeze
    end

    def self.remove
      FileUtils.rm @config_path
    end

    def self.options
      @options
    end

    # Constructs a file path to this gem's home directory,
    # creating it if it doesn't already exist.
    def self.home_path(*parts)
      File.expand_path(File.join(HOME, parts))
    end
  end


end
