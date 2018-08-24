require 'mediacopy/config'

module MediaCopy
  module Transformers
    # Mixin for transformer types
    class Transformer
      class << self
        attr_reader :location, :ruleset, :on_matched
      end

      def self.rules
        @rules ||= []
      end

      # Adds a match handler
      def self.rule(rule)
        rules << rule
      end

      def self.use_ruleset(ruleset)
        @ruleset = ruleset
      end

      # Sets the location to copy the files
      def self.copy_to(location)
        @location = location
      end

      # Specifies a function to call when a match is found
      def self.on_match(func)
        raise 'Cannot call your handler "process"' if func == :process
        @on_matched = func
      end

      # Processes a given set of files
      def transform(files)
        @files = files

        if self.class.on_matched.nil?
          process_default
        else
          process_on_matched
        end
      end

      private

      # Processes files where an 'on_matched' handler has been provided
      def process_on_matched
        unless respond_to? self.class.on_matched
          raise Exception, "#{self.class.name.split('').last} does not implement '#{self.class.on_matched}'"
        end

        @files.map do |file|
          public_send(self.class.on_matched, file)
        end
      end

      # Processes files using a default processor
      def process_default
        config_location = Config.options[:locations][self.class.location]

        raise Exception, "No location available for '#{self.class.location}'" if config_location.nil?

        @files.map do |file|
          filename = File.basename(file)
          # raise 'No output location available' if config_location.nil?
          File.expand_path File.join(config_location, filename)
        end
      end
    end
  end
end
