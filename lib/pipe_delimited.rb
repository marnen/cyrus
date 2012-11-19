class PipeDelimited
  GENDER = {'M' => :male, 'F' => :female}

  def initialize(data)
    @data = data
  end

  def records
    unless @records
      @records = []
      data.each do |row|
        record = Record.new
        fields = row.split('|').collect &:strip
        record.last_name = fields[0]
        record.first_name = fields[1]
        record.middle_initial = fields[2]
        record.gender = GENDER[fields[3]]
        record.favorite_color = fields[4]
        date = fields[5].split(/\D/).collect &:to_i
        record.date_of_birth = Date.civil date[2], date[0], date[1]
        @records << record
      end
    end
    @records
  end

  private

  attr_accessor :data
end