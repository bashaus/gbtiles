module GBTiles
  module GBM
    module Map
      module Objects
        class MapTileData < GBTiles::GBM::Map::Object

          attr_accessor :records
          @records

          def initialize
            super GBTiles::GBM::Map::ObjectType::MAP_TILE_DATA

            @records = []
          end

          def self.initFromBitString src
            object = GBTiles::GBM::Map::Objects::MapTileData.new

            while !src.empty?
              # Get the record
              number = src.slice!(0..2) # Get 24-bits (3 bytes)
              number = 0.chr + number # Convert from 24-bit to 32-bit
              number = number.unpack("N").first # Unpack integer

              object.records.push(
                GBTiles::GBM::Map::Objects::MapTileDataRecord.initFromBitString(number)
              )
            end

            object
          end

          def row width, row
            @records[(width * (row - 1))..((width * row) - 1)]
          end
        end
      end
    end
  end
end
