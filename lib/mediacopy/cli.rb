require 'thor'
require 'mediacopy/file_ledger'
require 'mediacopy/basic_filter'
require 'mediacopy/copy_engine'

module MediaCopy
  # mediacopy CLI entry point
  class CLI < Thor
    desc 'process <input path|file> <output path>',
         'Processes the input directory or file into the output path'
    def process(input, output)
      raise 'Output path must be a directory' unless File.directory?(output)

      if File.directory? input
        glob = File.join input, '**', '*'
        paths = Dir[glob]
        file_list = BasicFilter.new.filter(paths)

        engine = CopyEngine.new file_list, output

        engine.do_copy

      elsif File.file? input
        raise 'Not yet implemented'
      end
    end

    desc 'destroy', 'Destroys the ledger cache'
    def destroy
      Ledger.destroy
    end
  end
end
