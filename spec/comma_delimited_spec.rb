require 'spec_helper'

describe CommaDelimited do
  describe '#records' do
    let(:data) { ['Abercrombie, Neil, Male, Tan, 2/13/1943'] }
    let(:record) { CommaDelimited.new(data).records.first }

    it 'creates Record objects' do
      record.must_be_kind_of Record
    end

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
end