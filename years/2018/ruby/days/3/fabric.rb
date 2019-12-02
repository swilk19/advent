require_relative 'fabric_piece'
require_relative 'claim'

class Fabric

    attr_reader :disputed_claims, :undisputed_claims

    def initialize
        size_height = 1000
        size_width = 1000
        @cloth = []
        @disputed_claims = []
        @undisputed_claims = []
        start_height = 0
        while start_height < size_height do 
            start_width = 0
            new_row = []
            while start_width < size_width do
                new_row.push FabricPiece.new
                start_width += 1
            end
            @cloth.push new_row
            start_height += 1
        end
    end

    def add_claim(claim)
        #Find the spot in my cloth square corresponding to the left/top pieces of the claim
        @undisputed_claims.push(claim.id)
        # puts "Adding #{claim.id} to undisputed list: [#{@undisputed_claims.join(',')}]"
        start_left = claim.left_edge
        start_top = claim.top_edge
        height = claim.height
        width = claim.width
        # puts ("#{claim.id} Claim: #{width}x#{height}")
        start_height = 0
        #start at @cloth[start_left][start_top]
        while start_height < height
            start_width = 0
            while start_width < width do
                piece = @cloth[start_left + start_width][start_top + start_height]
                piece.add_claim(claim)
                # puts "#{claim.id} has claimed #{start_left+start_width},#{start_top+start_height}"
                # puts "Disputed piece: #{piece.claims}" if piece.claims.size >= 2
                if piece.claims.size >= 2
                    piece.claims.each do |conflict|
                        if @undisputed_claims.include? conflict.id
                            @undisputed_claims.delete conflict.id 
                            # puts "Removed #{conflict.id} from undisputed list: #{@undisputed_claims.join(',')}"
                         end
                    end
                end
                start_width += 1
            end
            start_height += 1
        end
    end

    def process_input(path)
        File.open(path, 'r') do |file_handle|
          file_handle.each_line do |claim|
            claim = Claim.new claim
            add_claim claim
          end
        end
    end

    def check_disputed_claims
        @disputed_claims = []
        @cloth.each do |row|
            row.each do |piece|
                @disputed_claims.push piece if piece.claims.size >= 2
            end
        end
    end
end