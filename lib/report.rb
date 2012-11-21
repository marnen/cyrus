require 'file_parser'

class Report
  def initialize(paths)
    @paths = *paths
  end

  def by_date_of_birth
    records.sort_by &:date_of_birth
  end

  def by_gender_and_last_name
    records.sort_by {|record| [record.gender, record.last_name] }
  end

  def by_last_name_descending
    records.sort_by(&:last_name).reverse
  end

  def full_output
    unless @full_output
      @full_output = ''
      outputs.each_with_index do |output, i|
        @full_output << "Output #{i + 1}:\n"
        @full_output << self.send(output).join("\n")
        @full_output << "\n\n"
      end
    end
    @full_output
  end

  private

  attr_reader :paths

  def outputs
    [:by_gender_and_last_name, :by_date_of_birth, :by_last_name_descending]
  end

  def records
    @records ||= paths.inject([]) {|array, path| array + FileParser.new(path).records }
  end
end