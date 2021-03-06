module GBTiles
  module GBR
    module TileSet
      module Objects
        class TilePal < GBTiles::GBR::TileSet::Object

          attr_accessor :id
          attr_accessor :count
          attr_accessor :color_set
          attr_accessor :sgb_count
          attr_accessor :sgb_color_set

          def initialize
            super GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_pal]
          end

          def self.initFromBitString src
            object = GBTiles::GBR::TileSet::Objects::TilePal.new

            object.id             = GBTiles::DataType.word!(src)
            object.count          = GBTiles::DataType.word!(src)
            object.color_set      = src.slice!(0, object.count)
            object.sgb_count      = GBTiles::DataType.word!(src)
            object.sgb_color_set  = src.slice!(0, object.sgb_count)

            object
          end
        end
      end
    end
  end
end
