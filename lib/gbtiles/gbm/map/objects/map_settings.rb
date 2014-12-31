module GBTiles
  module GBM
    module Map
      module Objects
        class MapSettings < GBTiles::GBM::Map::Object

          attr_accessor :form_width
          @form_width

          attr_accessor :form_height
          @form_height

          attr_accessor :form_maximized
          @form_maximized

          attr_accessor :info_panel
          @info_panel

          attr_accessor :grid
          @grid

          attr_accessor :double_markers
          @double_markers

          attr_accessor :prop_colors
          @prop_colors

          attr_accessor :zoom
          @zoom

          attr_accessor :color_set
          @color_set

          attr_accessor :bookmarks
          @bookmarks

          attr_accessor :block_fill_pattern
          @block_fill_pattern

          attr_accessor :block_fill_width
          @block_fill_width

          attr_accessor :block_fill_height
          @block_fill_height

          def initialize
            super GBTiles::GBM::Map::ObjectType::MAP_SETTINGS
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