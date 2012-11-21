module Parser
  class Base
    GENDER = {'M' => :male, 'F' => :female}

    def initialize(data)
      @data = data
    end

    def records
      @records ||= data.collect {|row| parse_row row }
    end

    private

    attr_accessor :data
  end
end