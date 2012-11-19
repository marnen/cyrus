class SpaceDelimited
  GENDER = {'M' => :male, 'F' => :female}

  def initialize(data)
    @data = data
  end

  def records
    @records ||= data.collect do |row|
      record = Record.new
      fields = row.strip.split ' '
      record.last_name = fields[0]
      record.first_name = fields[1]
      record.middle_initial = fields[2]
      record.gender = GENDER[fields[3]]
      date = fields[4].split(/\D/).collect &:to_i
      record.date_of_birth = Date.civil date[2], date[0], date[1]
      record.favorite_color = fields[5]
      record
    end
  end

  private

  attr_accessor :data
end