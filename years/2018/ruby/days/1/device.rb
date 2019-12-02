require_relative 'frequency'

class Device

  attr_reader :frequency, :frequency_history, :double_history

  def initialize
    @frequency = 0
    @frequency_history = [0]
    @double_history = []
  end

  def add_freq(frequency)
    @frequency += frequency.value
    add_to_history
  end

  def add_to_history
    @frequency_history.push(@frequency)
    @double_history.push(@frequency) if @frequency_history.count(@frequency) == 2
  end

  def process_input(path)
    File.open(path, 'r') do |file_handle|
      file_handle.each_line do |freq_change|
        freq = Frequency.new(freq_change)
        add_freq freq
      end
    end
  end
end