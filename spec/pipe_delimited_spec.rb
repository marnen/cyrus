require 'spec_helper'

describe PipeDelimited do
  describe '#records' do
    let(:data) { ['Smith | Steve | D | M | Red | 3-3-1985'] }
    let(:record) { PipeDelimited.new(data).records.first }

    it 'creates Record objects' do
      record.must_be_kind_of Record
    end

    it 'parses the first name' do
      record.first_name.must_equal 'Steve'
    end

    it 'parses the middle initial' do
      record.middle_initial.must_equal 'D'
    end

    it 'parses the last name' do
      record.last_name.must_equal 'Smith'
    end

    it 'parses the gender' do
      record.gender.must_equal :male
    end

    it 'parses the favorite color' do
      record.favorite_color.must_equal 'Red'
    end

    it 'parses the date of birth' do
      record.date_of_birth.must_equal Date.civil 1985, 3, 3
    end
  end
end