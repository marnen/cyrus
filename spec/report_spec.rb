require 'spec_helper'
require 'tempfile'

describe Report do
  describe '#by_last_name_descending' do
    let(:file) do
      Tempfile.open 'comma_delimited' do |file|
        file.puts <<-EOF
Abercrombie, Neil, Male, Tan, 2/13/1943
Charlton, John, Male, White, 2/15/1980
Bishop, Timothy, Male, Yellow, 4/23/1967
        EOF
        file
      end
    end

    it 'sorts input names by last name, descending' do
      output = Report.new(file.path).by_last_name_descending
      ['Charlton', 'Bishop', 'Abercrombie'].each_with_index do |name, i|
        output[i].split(' ').first.chomp(',').must_equal name
      end
    end
  end
end