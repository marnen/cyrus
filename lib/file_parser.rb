class FileParser
  def initialize(path)
    @path = path
  end

  def records
    IO.readlines(path)
  end

  private

  attr_reader :path
end