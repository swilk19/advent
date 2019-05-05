require_relative 'package'

class Scanner

  attr_accessor :boxes, :three_count_list, :two_count_list, :prototype_ids

  def initialize()
    @boxes = []
    @two_count_list = []
    @three_count_list = []
    @prototype_ids = []
  end

  def add_box(package)
    @boxes.push(package)
    @two_count_list.push(package) if package.two_count?
    @three_count_list.push(package) if package.three_count?
  end

  def process_input(path)
    File.open(path, 'r') do |file_handle|
      file_handle.each_line do |box|
        box = Package.new(box)
        add_box box
      end
    end
  end

  def find_prototypes
    @boxes.each do |box|
      @boxes.each do |box2|
        off_index = box.off_by_one box2
        next unless off_index != -1

        intersection = box.checksum
        intersection[off_index] = ''
        @prototype_ids.push intersection unless @prototype_ids.include? intersection
      end
    end
  end
end