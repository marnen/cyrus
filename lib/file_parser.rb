class FileParser
  def initialize(path)
    @path = path
  end

  def records
    IO.readlines(path).collect {|line| Record.new }
  end

  private

  attr_reader :path
end