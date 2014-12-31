module GBTiles
  module GBM
    module Map
      module Objects
        class MapExportSettings < GBTiles::GBM::Map::Object

          attr_accessor :file_name
          @file_name

          attr_accessor :file_type
          @file_type

          attr_accessor :section_name
          @section_name

          attr_accessor :label_name
          @label_name

          attr_accessor :bank
          @bank

          attr_accessor :plane_count
          @plane_count

          attr_accessor :plane_order
          @plane_order

          attr_accessor :map_layout
          @map_layout

          attr_accessor :split
          @split

          attr_accessor :split_size
          @split_size

          attr_accessor :split_bank
          @split_bank

          attr_accessor :sel_tab
          @sel_tab

          attr_accessor :prop_count
          @prop_count

          attr_accessor :tile_offset
          @tile_offset

          def initialize
            super GBTiles::GBM::Map::ObjectType::MAP_EXPORT_SETTINGS
          end

          def self.initFromBitString src
            object = GBTiles::GBM::Map::Objects::MapExportSettings.new

            object.file_name          = GBTiles::DataType.string!(src, 255)
            object.file_type          = GBTiles::DataType.byte!(src)
            object.section_name       = GBTiles::DataType.string!(src, 40)
            object.label_name         = GBTiles::DataType.string!(src, 40)
            object.bank               = GBTiles::DataType.byte!(src)
            object.plane_count        = GBTiles::DataType.word!(src)
            object.plane_order        = GBTiles::DataType.word!(src)
            object.map_layout         = GBTiles::DataType.word!(src)
            object.split              = GBTiles::DataType.boolean!(src)
            object.split_size         = GBTiles::DataType.long!(src)
            object.split_bank         = GBTiles::DataType.boolean!(src)
            object.sel_tab            = GBTiles::DataType.byte!(src)
            object.prop_count         = GBTiles::DataType.word!(src)
            object.tile_offset        = GBTiles::DataType.word!(src)

            object
          end
        end
      end
    end
  end
end
