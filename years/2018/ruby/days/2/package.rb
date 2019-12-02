class Package

  attr_accessor :checksum, :three_count, :two_count

  def initialize(checksum)
    @checksum = String.new(checksum)
    @two_count = false
    @three_count = false
    @checksum = @checksum.strip
    checksum.each_char do |letter|
      @two_count = true if checksum.count(letter) == 2
      @three_count = true if checksum.count(letter) == 3
    end
  end

  def two_count?
    @two_count
  end

  def three_count?
    @three_count
  end

  def off_by_one(other_box)
    off_by_one = -1
    @checksum.chars.each_with_index do |char, index|
      next if char == other_box.checksum[index]

      return -1 if off_by_one != -1

      off_by_one = index
    end
    off_by_one
  end
end