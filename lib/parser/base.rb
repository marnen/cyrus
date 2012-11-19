module Parser
  class Base
    GENDER = {'M' => :male, 'F' => :female}

    def initialize(data)
      @data = data
    end

    private

    attr_accessor :data
  end
end