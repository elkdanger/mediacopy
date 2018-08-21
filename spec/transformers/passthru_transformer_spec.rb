module MediaCopy
  module Transformers
    RSpec.describe PassThruTransformer do

      before(:each) do
        @transformer = PassThruTransformer.new
      end

      it 'returns the same list that was passed in' do
        files = [
          '~/file1.mp4',
          '~/file2.mkv',
          '~/file3.avi'
        ]

        expect(@transformer.transform(files)).to eq files
      end
    end
  end
end
