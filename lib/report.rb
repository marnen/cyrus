class Report
  def initialize(paths)
    @paths = *paths
  end

  def by_last_name_descending
    records.sort {|a, b| b <=> a }
  end

  def full_output
    "Output 3:\n#{by_last_name_descending.join "\n"}"
  end

  private

  attr_reader :paths

  def records
    @records ||= paths.inject([]) {|array, path| array + FileParser.new(path).records }
  end
end