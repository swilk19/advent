module DayTwo
  class Opcode
    OPTION_TYPES = {
      1 => Number.+,
      2 => :multiply,
      99 => :exit
    }

    getter action

    def initialize(opcode : Int32)
      @action = OPTION_TYPES.fetch(opcode, nil)

      raise InvalidOpcode if action == nil
    end
  end

  class InvalidOpcode < Exception; end
end