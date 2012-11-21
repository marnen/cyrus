require 'parser/base'

class Parser::PipeDelimited < Parser::Base
  class << self
    def delimiter
      '|'
    end

    def fields
      [:last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth]
    end
  end
end