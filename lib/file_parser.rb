require_relative 'comma_delimited'
require_relative 'space_delimited'

class FileParser
  PARSERS = {comma: CommaDelimited, space: SpaceDelimited}

  def initialize(path)
    @path = path
  end

  def records(parsers = {})
    unless @records
      parsers = PARSERS.merge parsers
      @records = parsers[format].new(data).records
    end
    @records
  end

  private

  attr_reader :path

  def data
    @data ||= IO.readlines(path)
  end

  def format
    unless @format
      @format = data.first.include?(',') ? :comma : :space
    end
    @format
  end
end