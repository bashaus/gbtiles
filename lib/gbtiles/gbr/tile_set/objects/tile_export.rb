module GBTiles
  module GBR
    module TileSet
      module Objects
        class TileExport < GBTiles::GBR::TileSet::Object

          attr_accessor :tile_id
          attr_accessor :file_name
          attr_accessor :file_type
          attr_accessor :section_name
          attr_accessor :label_name
          attr_accessor :bank
          attr_accessor :tile_array
          attr_accessor :format
          attr_accessor :counter
          attr_accessor :from
          attr_accessor :upto
          attr_accessor :compression
          attr_accessor :include_colors
          attr_accessor :sgb_palettes
          attr_accessor :gbc_palettes
          attr_accessor :make_meta_tiles
          attr_accessor :meta_offset
          attr_accessor :meta_counter
          attr_accessor :split
          attr_accessor :block_size
          attr_accessor :sel_tab

          def initialize
            super GBTiles::GBR::TileSet::ObjectType::TILE_EXPORT
          end

          def self.initFromBitString src
            object = GBTiles::GBR::TileSet::Objects::TileExport.new

            object.tile_id         = GBTiles::DataType.word!(src)
            object.file_name       = GBTiles::DataType.string!(src, 128)
            object.file_type       = GBTiles::DataType.byte!(src)
            object.section_name    = GBTiles::DataType.string!(src, 20)
            object.label_name      = GBTiles::DataType.string!(src, 20)
            object.bank            = GBTiles::DataType.byte!(src)
            object.tile_array      = GBTiles::DataType.byte!(src)
            object.format          = GBTiles::DataType.byte!(src)
            object.counter         = GBTiles::DataType.byte!(src)
            object.from            = GBTiles::DataType.word!(src)
            object.upto            = GBTiles::DataType.word!(src)
            object.compression     = GBTiles::DataType.byte!(src)
            object.include_colors  = GBTiles::DataType.boolean!(src)
            object.sgb_palettes    = GBTiles::DataType.byte!(src)
            object.gbc_palettes    = GBTiles::DataType.byte!(src)
            object.make_meta_tiles = GBTiles::DataType.boolean!(src)
            object.meta_offset     = GBTiles::DataType.long!(src)
            object.meta_counter    = GBTiles::DataType.byte!(src)
            object.split           = GBTiles::DataType.boolean!(src)
            object.block_size      = GBTiles::DataType.long!(src)
            object.sel_tab         = GBTiles::DataType.byte!(src)

            object
          end
        end
      end
    end
  end
end
