class Frequency

  attr_reader :value

  def initialize(change_val)
    @base_change = change_val
    @value = Integer(change_val[1..])
    @value = @value * -1 if @base_change[0] == '-'
  end


end