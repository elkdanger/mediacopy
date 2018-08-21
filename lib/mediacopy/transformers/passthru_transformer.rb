module MediaCopy
  module Transformers
    # A simple transformer which simply returns the same list of files that was
    # given. Useful as a fallback mechanism after all the other transformers.
    class PassThruTransformer
      def transform(files)
        files
      end
    end
  end
end
