require 'spec_helper'

describe FileParser do
  describe '#records' do
    it 'returns one record for each line in the input file' do
      count = rand(10) + 1
      file = Tempfile.open('file') do |file|
        count.times { file.puts "a line\n" }
        file
      end

      FileParser.new(file.path).records.count.must_equal count
    end
  end
end