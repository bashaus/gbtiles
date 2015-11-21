require "gbtiles/helpers/fixnum"

require "gbtiles/gbr/tile_set/tile_set"
require "gbtiles/gbr/tile_set/object"
require "gbtiles/gbr/tile_set/object_type"
require "gbtiles/gbr/tile_set/split_order"
require "gbtiles/gbr/tile_set/color_set"

require "gbtiles/gbr/tile_set/objects/palettes"
require "gbtiles/gbr/tile_set/objects/producer"
require "gbtiles/gbr/tile_set/objects/tile_data"
require "gbtiles/gbr/tile_set/objects/tile_export"
require "gbtiles/gbr/tile_set/objects/tile_import"
require "gbtiles/gbr/tile_set/objects/tile_pal"
require "gbtiles/gbr/tile_set/objects/tile_settings"
require "gbtiles/gbr/tile_set/objects/unknown"

module GBTiles
  module GBR
    module Import
      class GBRFile

        attr_accessor :version
        attr_accessor :tile_set

        def initialize
          @tile_set = GBTiles::GBR::TileSet::TileSet.new
        end

        def self.open file
          import = GBTiles::GBR::Import::GBRFile.new

          # Check to see if this is a valid file type
          if (file.read(3) != "GBO") then
            raise IOError, "Not a valid file (expected: GBO)"
          end

          # Version number
          import.version = file.read(1)

          # For each object
          while !file.eof?
            object_type = GBTiles::DataType.word(file.read(2))
            object_id   = GBTiles::DataType.word(file.read(2))
            object_len  = GBTiles::DataType.long(file.read(4))
            object_data = file.read(object_len)

            case GBTiles::GBR::TileSet::OBJECT_TYPE.key(object_type)
            when :producer
              object = GBTiles::GBR::TileSet::Objects::Producer.initFromBitString(object_data)

            when :tile_data
              object = GBTiles::GBR::TileSet::Objects::TileData.initFromBitString(object_data)

            when :tile_settings
              object = GBTiles::GBR::TileSet::Objects::TileSettings.initFromBitString(object_data)

            when :tile_export
              object = GBTiles::GBR::TileSet::Objects::TileExport.initFromBitString(object_data)

            when :tile_import
              object = GBTiles::GBR::TileSet::Objects::TileImport.initFromBitString(object_data)

            when :palettes
              object = GBTiles::GBR::TileSet::Objects::Palettes.initFromBitString(object_data)

            when :tile_pal
              object = GBTiles::GBR::TileSet::Objects::TilePal.initFromBitString(object_data)

            else
              object = GBTiles::GBR::TileSet::Objects::Unknown.new object_type
              object.object_data = object_data

            end

            object.object_id = object_id

            import.tile_set.objects << object
          end

          import
        end
      end
    end
  end
end
