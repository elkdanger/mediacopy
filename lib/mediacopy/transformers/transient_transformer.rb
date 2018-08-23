require 'mediacopy/config'

module MediaCopy
  module Transformers
    # Processes files that live in the 'transient' folder
    class TransientTransformer < Transformer
      use_ruleset :transient
      copy_to :transient
    end
  end
end
