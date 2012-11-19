class FileParser
  def initialize(path)
    @path = path
  end

  def records
    unless @records
      case format
      when :comma
        @records = CommaDelimited.new(path).records
      when :space
        @records = SpaceDelimited.new(path).records
      end
    end
    @records
  end

  private

  attr_reader :path

  def format
    unless @format
      @format = File.open(path) {|file| file.gets }.include?(',') ? :comma : :space
    end
    @format
  end
end