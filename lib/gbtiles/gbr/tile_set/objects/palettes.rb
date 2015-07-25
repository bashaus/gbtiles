module GBTiles
  module GBR
    module TileSet
      module Objects
        class Palettes < GBTiles::GBR::TileSet::Object

          attr_accessor :id
          attr_accessor :count
          attr_accessor :colors
          attr_accessor :sgb_count
          attr_accessor :sgb_colors

          def initialize
            super GBTiles::GBR::TileSet::ObjectType::PALETTES
          end

          def self.initFromBitString src
            object = GBTiles::GBR::TileSet::Objects::Palettes.new

            object.id         = GBTiles::DataType.word!(src)
            object.count      = GBTiles::DataType.word!(src)
            object.colors     = src.slice!(0, object.count)
            object.sgb_count  = GBTiles::DataType.word!(src)
            object.sgb_colors = src.slice!(0, object.sgb_count)

            object
          end
        end
      end
    end
  end
end
