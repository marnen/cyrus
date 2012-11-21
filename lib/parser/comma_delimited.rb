require 'parser/base'

class Parser::CommaDelimited < Parser::Base
  private

  def parse_row(row)
    record = Record.new
    fields = row.strip.split /,\s*/
    record.last_name = fields[0]
    record.first_name = fields[1]
    record.gender = fields[2].downcase.to_sym
    record.favorite_color = fields[3]
    date = fields[4].split(/\D/).collect &:to_i
    record.date_of_birth = Date.civil date[2], date[0], date[1]
    record
  end
end