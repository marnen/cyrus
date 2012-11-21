require 'parser/base'

class Parser::CommaDelimited < Parser::Base
  class << self
    def delimiter
      ','
    end

    def fields
      [:last_name, :first_name, :gender, :favorite_color, :date_of_birth]
    end
  end
end