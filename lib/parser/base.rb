require 'record'
require 'date'

module Parser
  class Base
    GENDER = {'M' => :male, 'F' => :female}

    def initialize(data)
      @data = data
    end

    def records
      @records ||= data.collect {|row| parse_row row }
    end

    def parse_row(row)
      raw_fields = row.split(self.class.delimiter)
      record = Record.new
      self.class.fields.each_with_index do |field_name, i|
        record.send "#{field_name}=", convert(raw_fields[i], field_name)
      end
      record
    end

    private

    attr_accessor :data

    def convert(value, field_name)
      value.strip!
      case field_name
      when :gender
        GENDER[value[0].upcase]
      when :date_of_birth
        month, day, year = value.split(/\D/).collect &:to_i
        Date.civil year, month, day
      else
        value
      end
    end
  end
end