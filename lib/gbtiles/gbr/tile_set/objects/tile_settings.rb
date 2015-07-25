module GBTiles
  module GBR
    module TileSet
      module Objects
        class TileSettings < GBTiles::GBR::TileSet::Object

          attr_accessor :tile_id
          attr_accessor :simple
          attr_accessor :flags
          attr_accessor :left_color
          attr_accessor :right_color
          attr_accessor :split_width
          attr_accessor :split_height
          attr_accessor :split_order
          attr_accessor :color_set
          attr_accessor :bookmarks
          attr_accessor :auto_update

          def initialize
            super GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_settings]
          end

          def self.initFromBitString src
            object = GBTiles::GBR::TileSet::Objects::TileSettings.new

            object.tile_id       = GBTiles::DataType.word!(src)
            object.simple        = GBTiles::DataType.boolean!(src)
            object.flags         = GBTiles::DataType.byte!(src)
            object.left_color    = GBTiles::DataType.byte!(src)
            object.right_color   = GBTiles::DataType.byte!(src)
            object.split_width   = GBTiles::DataType.word!(src)
            object.split_height  = GBTiles::DataType.word!(src)
            object.split_order   = GBTiles::DataType.long!(src)
            object.color_set     = GBTiles::DataType.byte!(src)
            # @bookmarks    Word(3)
            # @auto_update   Boolean

            object
          end
        end
      end
    end
  end
end
