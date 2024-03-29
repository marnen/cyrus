require 'parser/pipe_delimited'
require 'parser/comma_delimited'
require 'parser/space_delimited'

class FileParser
  PARSERS = {pipe: Parser::PipeDelimited, comma: Parser::CommaDelimited, space: Parser::SpaceDelimited}

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
      first_line = data.first
      if first_line.include? ','
        @format = :comma
      elsif first_line.include? '|'
        @format = :pipe
      else
        @format = :space
      end
    end
    @format
  end
end