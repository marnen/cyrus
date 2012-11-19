require 'spec_helper'

describe Record do
  describe '#to_s' do
    it 'writes the fields in order last name, first name, gender, date of birth, favorite color' do
      record = Record.new
      record.first_name = 'First'
      record.middle_initial = 'M'
      record.last_name = 'Last'
      record.gender = :female
      record.date_of_birth = Date.civil 1980, 5, 1
      record.favorite_color = 'Green'

      record.to_s.must_equal 'Last First Female 5/1/1980 Green'
    end
  end
end