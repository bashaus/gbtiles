module GBTiles
  module GBR
    module Import
      class GBRFile
        attr_accessor :version, :tile_set

        @version
        @tile_set

        def initialize()
          @tile_set = GBTiles::GBR::TileSet::TileSet.new
        end

        def self.open(file)
          import = GBTiles::GBR::Import::GBRFile.new

          # Check to see if this is a valid file type
          if (file.read(3) != "GBO") then
            raise "Invalid file, header does not start with GBO"
          end

          # Version number
          import.version = file.read(1)

          # For each object
          while !file.eof?
            object_type = GBTiles::DataType.word(file.read(2))
            object_id   = GBTiles::DataType.word(file.read(2))
            object_len  = GBTiles::DataType.long(file.read(4))
            object_data = file.read(object_len)

            case object_type
            when GBTiles::GBR::TileSet::ObjectType::PRODUCER
              object = GBTiles::GBR::TileSet::Objects::Producer.initFromBitString object_data

            when GBTiles::GBR::TileSet::ObjectType::TILE_DATA
              object = GBTiles::GBR::TileSet::Objects::TileData.initFromBitString object_data

            when GBTiles::GBR::TileSet::ObjectType::TILE_SETTINGS
              object = GBTiles::GBR::TileSet::Objects::TileSettings.initFromBitString object_data

            when GBTiles::GBR::TileSet::ObjectType::TILE_EXPORT
              object = GBTiles::GBR::TileSet::Objects::TileExport.initFromBitString object_data

            when GBTiles::GBR::TileSet::ObjectType::TILE_IMPORT
              object = GBTiles::GBR::TileSet::Objects::TileImport.initFromBitString object_data

            when GBTiles::GBR::TileSet::ObjectType::PALETTES
              object = GBTiles::GBR::TileSet::Objects::Palettes.initFromBitString object_data

            when GBTiles::GBR::TileSet::ObjectType::TILE_PAL
              object = GBTiles::GBR::TileSet::Objects::TilePal.initFromBitString object_data

            else
              object = GBTiles::GBR::TileSet::Objects::Unknown.new object_type
              object.object_data = object_data

            end

            object.object_id = object_id

            import.tile_set.objects.push object
          end

          import
        end
      end
    end
  end
end
