module MediaCopy
  # A basic filter for filtering out non-media files
  class BasicFilter
    def filter(file_list)
      raise 'file_list must be an array' unless file_list.respond_to?('each')

      file_list.select do |file|
        file =~ /(\.mp4|\.avi)$/
      end
    end
  end
end
