module GBTiles
  module GBM
    module Map
      module Objects
        class MapTileDataRecord

          attr_accessor :tile_number
          @tile_number

          attr_accessor :gbc_palette
          @gbc_palette

          attr_accessor :sgb_palette
          @sgb_palette

          attr_accessor :flipped_horizontally
          @flipped_horizontally

          attr_accessor :flipped_vertically
          @flipped_vertically

          def initialize
          end

          def self.initFromBitString number
            record = GBTiles::GBM::Map::Objects::MapTileDataRecord.new

            record.tile_number          = number.bits(0..9)
            record.gbc_palette          = number.bits(10..14)
            record.sgb_palette          = number.bits(16..18)
            record.flipped_horizontally = number.bits(22..22)
            record.flipped_vertically   = number.bits(23..23)

            record
          end
        end
      end
    end
  end
end
