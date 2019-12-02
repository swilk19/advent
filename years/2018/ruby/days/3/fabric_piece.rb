class FabricPiece

    attr_reader :claims

    def initialize
        @claims = []
    end

    def add_claim(claim)
        @claims.push(claim)
    end
end
