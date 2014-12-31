module GBTiles
  module GBM
    module Map
      module Objects
        class Map < GBTiles::GBM::Map::Object

          attr_accessor :name
          @name

          attr_accessor :width
          @width

          attr_accessor :height
          @height

          attr_accessor :prop_count
          @prop_count

          attr_accessor :tile_file
          @tile_file

          attr_accessor :tile_count
          @tile_count

          attr_accessor :prop_color_count
          @prop_color_count

          def initialize
            super GBTiles::GBM::Map::ObjectType::MAP
          end

          def self.initFromBitString src
            object = GBTiles::GBM::Map::Objects::Map.new

            object.name               = GBTiles::DataType.string!(src, 128)
            object.width              = GBTiles::DataType.long!(src)
            object.height             = GBTiles::DataType.long!(src)
            object.prop_count         = GBTiles::DataType.long!(src)
            object.tile_file          = GBTiles::DataType.string!(src, 256)
            object.tile_count         = GBTiles::DataType.long!(src)
            object.prop_color_count   = GBTiles::DataType.long!(src)

            object
          end
        end
      end
    end
  end
end
