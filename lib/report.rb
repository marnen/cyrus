class Report
  def initialize(path)
    @path = path
  end

  def by_last_name_descending
    File.open path do |file|
      file.readlines.sort {|a, b| b <=> a }
    end
  end

  private

  attr_reader :path
end