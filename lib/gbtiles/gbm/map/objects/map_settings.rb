module GBTiles
  module GBM
    module Map
      module Objects
        class MapSettings < GBTiles::GBM::Map::Object

          attr_accessor :form_width
          attr_accessor :form_height
          attr_accessor :form_maximized
          attr_accessor :info_panel
          attr_accessor :grid
          attr_accessor :double_markers
          attr_accessor :prop_colors
          attr_accessor :zoom
          attr_accessor :color_set
          attr_accessor :bookmarks
          attr_accessor :block_fill_pattern
          attr_accessor :block_fill_width
          attr_accessor :block_fill_height

          def initialize
            super GBTiles::GBM::Map::OBJECT_TYPE[:map_settings]
          end

          def self.initFromBitString src
            object = GBTiles::GBM::Map::Objects::MapSettings.new

            object.form_width         = GBTiles::DataType.long!(src)
            object.form_height        = GBTiles::DataType.long!(src)
            object.form_maximized     = GBTiles::DataType.boolean!(src)
            object.info_panel         = GBTiles::DataType.boolean!(src)
            object.grid               = GBTiles::DataType.boolean!(src)
            object.double_markers     = GBTiles::DataType.boolean!(src)
            object.prop_colors        = GBTiles::DataType.boolean!(src)
            object.zoom               = GBTiles::DataType.word!(src)
            object.color_set          = GBTiles::DataType.word!(src)
            object.bookmarks          = src.slice!(3)
            object.block_fill_pattern = GBTiles::DataType.long!(src)
            object.block_fill_width   = GBTiles::DataType.long!(src)
            object.block_fill_height  = GBTiles::DataType.long!(src)

            object
          end
        end
      end
    end
  end
end
