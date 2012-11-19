require 'spec_helper'

describe FileParser do
  describe '#records' do
    let(:file) do
      Tempfile.open('file') do |file|
        file.puts data
        file
      end
    end
    let(:records) { FileParser.new(file.path).records }

    describe 'general properties' do
      let(:count) { rand(10) + 1 }
      let(:data) { "a line\n" * count }

      it 'returns one record for each line in the input file' do
        records.count.must_equal count
      end

      it 'returns an array of Record objects' do
        records.each {|record| record.must_be_kind_of Record }
      end
    end
  end
end