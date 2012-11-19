require 'spec_helper'

describe FileParser do
  describe '#records' do
    let(:file) do
      Tempfile.open('file') do |file|
        file.puts data
        file
      end
    end
    let(:parsers) { {} }
    let(:records) { FileParser.new(file.path).records(parsers) }

    describe 'general properties' do
      let(:count) { rand(10) + 1 }
      let(:data) { "Abercrombie, Neil, Male, Tan, 2/13/1943\n" * count }

      it 'returns one record for each line in the input file' do
        records.count.must_equal count
      end

      it 'returns an array of Record objects' do
        records.each {|record| record.must_be_kind_of Record }
      end
    end

    describe 'parsing' do
      let(:records_mock) { [Record.new] }
      let(:parser_mock) { OpenStruct.new records: records_mock }
      let(:parser_class_mock) do
        mock = MiniTest::Mock.new
        mock.expect :new, parser_mock, [["#{data}\n"]]
      end

      describe 'pipe-delimited' do
        let(:parsers) { {pipe: parser_class_mock} }
        let(:data) { 'Smith | Steve | D | M | Red | 3-3-1985' }

        it 'uses the pipe-delimited data parser' do
          records.must_equal records_mock
          parser_class_mock.verify
        end
      end

      describe 'comma-delimited' do
        let(:parsers) { {comma: parser_class_mock} }
        let(:data) { 'Abercrombie, Neil, Male, Tan, 2/13/1943' }

        it 'uses the comma-delimited data parser' do
          records.must_equal records_mock
          parser_class_mock.verify
        end
      end
    end
  end
end