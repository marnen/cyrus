module Parser
  class Base
    def initialize(data)
      @data = data
    end

    private

    attr_accessor :data
  end
end