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
      let(:data) { "Abercrombie, Neil, Male, Tan, 2/13/1943\n" * count }

      it 'returns one record for each line in the input file' do
        records.count.must_equal count
      end

      it 'returns an array of Record objects' do
        records.each {|record| record.must_be_kind_of Record }
      end
    end

    describe 'parsing' do
      let(:record) { records.first }

      describe 'comma-delimited' do
        let(:data) { 'Abercrombie, Neil, Male, Tan, 2/13/1943' }

        it 'parses the first name' do
          record.first_name.must_equal 'Neil'
        end

        it 'parses the last name' do
          record.last_name.must_equal 'Abercrombie'
        end

        it 'parses the gender' do
          record.gender.must_equal :male
        end

        it 'parses the favorite color' do
          record.favorite_color.must_equal 'Tan'
        end

        it 'parses the date of birth' do
          record.date_of_birth.must_equal Date.civil 1943, 2, 13
        end
      end

      describe 'pipe-delimited' do
        let(:data) { 'Seles Monica H F 12-2-1973 Black' }

        it 'parses the first name' do
          record.first_name.must_equal 'Monica'
        end

        it 'parses the middle initial' do
          record.middle_initial.must_equal 'H'
        end

        it 'parses the last name' do
          record.last_name.must_equal 'Seles'
        end

        it 'parses the gender' do
          record.gender.must_equal :female
        end

        it 'parses the favorite color' do
          record.favorite_color.must_equal 'Black'
        end

        it 'parses the date of birth' do
          record.date_of_birth.must_equal Date.civil 1973, 12, 2
        end
      end
    end
  end
end