module DayTwo
  class Opcode
    def initialize(opcode : Int32)
      @action = opcode

      raise InvalidOpcode.new("Opcode must be 1, 2, or 99") unless [1, 2, 99].includes?(@action)
      raise EndOfExecution.new if @action == 99
    end

    def action : Proc(Int32, Int32, Int32)
      if @action == 1
        ->(x : Int32, y : Int32) { x + y }
      else
        ->(x : Int32, y : Int32) { x * y }
      end
    end
  end

  class InvalidOpcode < Exception; end

  class EndOfExecution < Exception; end
end
