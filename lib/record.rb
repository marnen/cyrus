Record = Struct.new :first_name, :middle_initial, :last_name, :gender, :favorite_color, :date_of_birth

class Record
  def to_s
    [
      last_name,
      first_name,
      display_gender,
      display_date_of_birth,
      favorite_color
    ].join ' '
  end

  private

  def display_gender
    display_gender = gender.to_s
    display_gender[0] = display_gender[0].upcase
    display_gender
  end

  def display_date_of_birth
    [date_of_birth.month, date_of_birth.day, date_of_birth.year].join '/'
  end
end