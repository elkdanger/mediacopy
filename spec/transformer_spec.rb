module MediaCopy
  module Transformers
    RSpec.describe Transformer do
      it 'can specify a location' do
        class T < Transformer
          copy_to :test
        end

        expect(T.location).to eq :test
      end

      it 'can specify a set of rules' do
        class T < Transformer
          rule /movie_1/
          rule /some other movie/
          rule /(<?name>[a-z].+?([0-9]{4}))/
        end

        expect(T.rules.length).to eq 3
      end

      it 'can specify a ruleset' do
        class T < Transformer
          use_ruleset :test
        end

        expect(T.ruleset).to eq :test
      end

      it 'can process files' do
        allow(Config).to receive(:options).and_return(
          locations: {
            transient: '/transient_location'
          }
        )

        class T < Transformer
          use_ruleset :transient
          copy_to :transient
        end

        output = T.new.transform ['./media/movie1.avi']

        expect(output).to eq ['/transient_location/movie1.avi']
      end

      it 'raises an error when no location is available' do
        allow(Config).to receive(:options).and_return(
          locations: {}
        )

        class T < Transformer
          use_ruleset :transient
          copy_to :transient
        end

        expect { T.new.transform [] }.to raise_error Exception, "No location available for 'transient'"
      end

      it "raises an error when the type doesn't implement on_matched" do
        class T < Transformer
          on_match :do_file
        end

        expect { T.new.transform [] }.to raise_error Exception, "T does not implement 'do_file'"
      end
    end

  end
end
