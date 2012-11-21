require 'spec_helper'

describe Parser::Base do
  describe '#records' do
    it 'parses each row and returns an array of the results' do
      data = ['Smith, John', 'Jones, Sarah']
      parser = Parser::Base.new data
      def parser.parse_row(row)
        "Parsed row: #{row}"
      end

      parser.records.must_equal data.collect {|row| parser.parse_row row }
    end
  end

  describe '#parse_row' do
    let(:base) { Class.new Parser::Base } # method stubbing trick with MiniTest, see http://carlosleon.info/articles/method-stub-with-minitest
    let(:parser) { base.new [] }

    before do
      def base.delimiter; '*'; end
    end

    it 'splits each row on the delimiter and strips whitespace' do
      def base.fields; [:last_name, :first_name]; end
      record = parser.parse_row 'Jones * Sarah'
      record.last_name.must_equal 'Jones'
      record.first_name.must_equal 'Sarah'
    end

    it 'assigns fields in order given by fields method' do
      def base.fields; [:first_name, :middle_initial, :last_name]; end
      record = parser.parse_row 'Andrew * D * Smith'
      record.first_name.must_equal 'Andrew'
      record.middle_initial.must_equal 'D'
      record.last_name.must_equal 'Smith'
    end

    it 'normalizes gender' do
      def base.fields; [:gender]; end
      parser.parse_row('M').gender.must_equal :male
      parser.parse_row('Female').gender.must_equal :female
    end

    it 'converts date of birth to an object' do
      def base.fields; [:date_of_birth]; end
      parser.parse_row('12-3/1980').date_of_birth.must_equal Date.civil 1980, 12, 3
    end
  end
end