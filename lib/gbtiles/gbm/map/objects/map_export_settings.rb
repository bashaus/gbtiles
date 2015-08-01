module GBTiles
  module GBM
    module Map
      module Objects
        class MapExportSettings < GBTiles::GBM::Map::Object

          attr_accessor :file_name
          attr_accessor :file_type
          attr_accessor :section_name
          attr_accessor :label_name
          attr_accessor :bank
          attr_accessor :plane_count
          attr_accessor :plane_order
          attr_accessor :map_layout
          attr_accessor :split
          attr_accessor :split_size
          attr_accessor :split_bank
          attr_accessor :sel_tab
          attr_accessor :prop_count
          attr_accessor :tile_offset

          def initialize
            super GBTiles::GBM::Map::OBJECT_TYPE[:map_export_settings]
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
