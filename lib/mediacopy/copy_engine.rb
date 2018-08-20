require 'fileutils'
require 'mediacopy/log'

module MediaCopy
  # Masters copying files from one place to another
  class CopyEngine
    attr_reader :files, :output_path

    def initialize(files, output_path)
      raise 'Invalid file list specified' if files.nil? ||
                                             !files.respond_to?('each')

      raise 'Invalid output path' unless output_path

      @files = files
      @output_path = output_path
    end

    def do_copy
      @files.each do |file|
        Log.info "Copying #{file} to #{@output_path}", 'copy_engine'
        FileUtils.cp file, @output_path
      end
    end
  end
end
