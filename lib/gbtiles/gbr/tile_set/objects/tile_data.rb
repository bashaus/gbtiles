module GBTiles
  module GBR
    module TileSet
      module Objects
        class TileData < GBTiles::GBR::TileSet::Object

          attr_accessor :name
          attr_accessor :width
          attr_accessor :height
          attr_accessor :count
          attr_accessor :color_set
          attr_accessor :data

          def initialize
            super GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_data]
          end

          def self.initFromBitString src
            object = GBTiles::GBR::TileSet::Objects::TileData.new

            object.name       = GBTiles::DataType.string!(src, 30)
            object.width      = GBTiles::DataType.word!(src)
            object.height     = GBTiles::DataType.word!(src)
            object.count      = GBTiles::DataType.word!(src)
            object.color_set  = src.slice!(0, 4)
            object.data       = src

            object
          end

          def render_tile tile_index
            tile = []

            tile_data = @data.slice(
              tile_index * @width * @height,
              @width * @height
            )

            (1..@height).each do |row|
              byte_0 = 0x00
              byte_1 = 0x00

              bitmask = 0x80

              (1..@width).each do |col|
                pixel = tile_data[(row - 1) * @height + col - 1]

                case pixel.unpack("C")[0]
                when 0 # Black
                when 1 # Dark Grey
                  byte_0 |= bitmask
                when 2 # Light Grey
                  byte_1 |= bitmask
                when 3 # White
                  byte_0 |= bitmask
                  byte_1 |= bitmask
                end

                bitmask >>= 1
              end

              tile << sprintf("0x%02x,0x%02x", byte_0, byte_1)
            end

            tile.join(",")
          end
        end
      end
    end
  end
end
