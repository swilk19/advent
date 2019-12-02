class Claim

    attr_reader :id, :left_edge, :top_edge, :width, :height

    def initialize(claim_str)
        # Example: #1 @ 755,138: 26x19
        # Regex example: #(\d+)\s@\s(\d+),(\d+):\s(\d+)x(\d+)
        match_data = /(\d+)\s@\s(\d+),(\d+):\s(\d+)x(\d+)/.match(claim_str)
        # id 1
        # puts match_data
        # puts match_data[1]
        @id = Integer(match_data[1])
        # 755 from left edge
        @left_edge = Integer(match_data[2])
        # 138 from top edge
        @top_edge = Integer(match_data[3])
        # 26 wide
        @width = Integer(match_data[4])
        # 19 tall
        @height = Integer(match_data[5])
    end
end