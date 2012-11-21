require 'parser/base'

class Parser::SpaceDelimited < Parser::Base
  class << self
    def delimiter
      ' '
    end

    def fields
      [:last_name, :first_name, :middle_initial, :gender, :date_of_birth, :favorite_color]
    end
  end
end