require 'mediacopy/config'

module MediaCopy
  module Transformers
    RSpec.describe TransientTransformer do
      it 'can specify a ruleset' do
        expect(TransientTransformer.ruleset).to eq :transient
      end

      it 'can define a location' do
        expect(TransientTransformer.location).to eq :transient
      end
    end
  end
end
