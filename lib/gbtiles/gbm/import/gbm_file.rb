require "gbtiles/helpers/fixnum"

require "gbtiles/gbm/map/map_set"
require "gbtiles/gbm/map/object"
require "gbtiles/gbm/map/object_type"

require "gbtiles/gbm/map/objects/producer"
require "gbtiles/gbm/map/objects/map"
require "gbtiles/gbm/map/objects/map_tile_data"
require "gbtiles/gbm/map/objects/map_tile_data_record"
require "gbtiles/gbm/map/objects/map_settings"
require "gbtiles/gbm/map/objects/map_export_settings"
require "gbtiles/gbm/map/objects/unknown"

module GBTiles
  module GBM
    module Import
      class GBMFile

        OBJECT_MARKER = "HPJMTL"

        attr_accessor :version
        attr_accessor :map_set

        def initialize
          @map_set = GBTiles::GBM::Map::MapSet.new
        end

        def self.open file
          import = GBTiles::GBM::Import::GBMFile.new

          # Check to see if this is a valid file type
          if (file.read(3) != "GBO") then
            raise IOError, "Not a valid file (expected: GBO)"
          end

          # Version number
          import.version = file.read(1)

          if import.version != "1" then
            raise IOError, "Cannot import version #{import.version}"
          end

          # For each object
          while !file.eof?
            # Check the marker
            marker = GBTiles::DataType.string(file.read(6))

            if !OBJECT_MARKER.eql? marker then
              raise "Malformed file, expected marker #{OBJECT_MARKER}, got #{marker}"
            end

            object_type = GBTiles::DataType.word(file.read(2))
            object_id   = GBTiles::DataType.word(file.read(2))
            master_id   = GBTiles::DataType.word(file.read(2))
            object_crc  = GBTiles::DataType.long(file.read(4))
            object_len  = GBTiles::DataType.long(file.read(4))
            object_data = file.read(object_len)

            case GBTiles::GBM::Map::OBJECT_TYPE.key(object_type)
            when :producer
              object = GBTiles::GBM::Map::Objects::Producer.initFromBitString object_data

            when :map
              object = GBTiles::GBM::Map::Objects::Map.initFromBitString object_data

            when :map_tile_data
              object = GBTiles::GBM::Map::Objects::MapTileData.initFromBitString object_data

            when :map_settings
              object = GBTiles::GBM::Map::Objects::MapSettings.initFromBitString object_data

            when :map_export_settings
              object = GBTiles::GBM::Map::Objects::MapExportSettings.initFromBitString object_data

            else
              object = GBTiles::GBM::Map::Objects::Unknown.new object_type
              object.object_data = object_data

            end

            object.object_id = object_id
            object.master_id = master_id

            import.map_set.objects.push object
          end

          import
        end
      end
    end
  end
end
