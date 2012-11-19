require 'spec_helper'

describe SpaceDelimited do
  describe '#records' do
    let(:data) { ['Seles Monica H F 12-2-1973 Black'] }
    let(:record) { SpaceDelimited.new(data).records.first }

    it 'creates Record objects' do
      record.must_be_kind_of Record
    end

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