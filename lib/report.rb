class Report
  def initialize(paths)
    @paths = *paths
  end

  def by_date_of_birth
    records.sort_by &:date_of_birth
  end

  def by_last_name_descending
    records.sort_by(&:last_name).reverse
  end

  def full_output
    <<-"EOF"
Output 2:
#{by_date_of_birth.join "\n"}

Output 3:
#{by_last_name_descending.join "\n"}
    EOF
  end

  private

  attr_reader :paths

  def records
    @records ||= paths.inject([]) {|array, path| array + FileParser.new(path).records }
  end
end