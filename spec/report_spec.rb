require 'spec_helper'
require 'tempfile'

describe Report do
  let(:files) do
    [:pipe, :comma, :space].collect do |type|
      Tempfile.open(type.to_s) {|file| file.puts self.send(type); file }
    end
  end

  let(:pipe) { <<-PIPE }
F | Steve | D | M | Red | 3-3-1985
B | Radek | S | M | Green | 6-3-1975
H | Francis | G | M | Blue | 6-3-1975
  PIPE

  let(:comma) { <<-COMMA }
A, Neil, Male, Tan, 2/13/1943
C, John, Male, White, 2/15/1980
E, Timothy, Male, Yellow, 4/23/1967
  COMMA

  let(:space) { <<-SPACE }
D Anna F F 6-3-1975 Red
G Martina M F 4-2-1979 Green
I Monica H F 12-2-1973 Black
  SPACE

  let(:report) { Report.new files.collect &:path }

  describe '#by_last_name_descending' do
    it 'sorts input names by last name, descending' do
      output = report.by_last_name_descending
      ('A'..'I').to_a.reverse.each_with_index do |name, i|
        output[i].split(' ').first.chomp(',').must_equal name
      end
    end
  end

  describe '#full_output' do
    # TODO: remove duplication
    let(:pipe) { <<-PIPE }
F | Steve | D | M | Red | 3-3-1985
B | Radek | S | M | Green | 6-3-1975
H | Francis | G | M | Blue | 6-3-1975
    PIPE

    let(:comma) { <<-COMMA }
A, Neil, Male, Tan, 2/13/1943
C, John, Male, White, 2/15/1980
E, Timothy, Male, Yellow, 4/23/1967
    COMMA

    let(:space) { <<-SPACE }
D Anna F F 6-3-1975 Red
G Martina M F 4-2-1979 Green
I Monica H F 12-2-1973 Black
    SPACE

    it 'returns by_last_name_descending as output 3' do
      report.full_output.must_include "Output 3:\n#{report.by_last_name_descending.join "\n"}"
    end
  end
end