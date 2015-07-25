module GBTiles
  module GBR
    module TileSet
      module Objects
        class TileImport < GBTiles::GBR::TileSet::Object

          attr_accessor :tile_id
          attr_accessor :file_name
          attr_accessor :file_type
          attr_accessor :from_tile
          attr_accessor :to_tile
          attr_accessor :tile_count
          attr_accessor :color_conversion
          attr_accessor :first_byte
          attr_accessor :binary_file_type

          def initialize
            super GBTiles::GBR::TileSet::ObjectType::TILE_IMPORT
          end

          def self.initFromBitString src
            object = GBTiles::GBR::TileSet::Objects::TileImport.new

            object.tile_id          = GBTiles::DataType.word!(src)
            object.file_name        = GBTiles::DataType.string!(src, 128)
            object.file_type        = GBTiles::DataType.byte!(src)
            object.from_tile        = GBTiles::DataType.word!(src)
            object.to_tile          = GBTiles::DataType.word!(src)
            object.tile_count       = GBTiles::DataType.word!(src)
            object.color_conversion = GBTiles::DataType.byte!(src)
            object.first_byte       = GBTiles::DataType.long!(src)
            object.binary_file_type = GBTiles::DataType.byte!(src)

            object
          end
        end
      end
    end
  end
end
