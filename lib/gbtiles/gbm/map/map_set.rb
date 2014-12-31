module GBTiles
  module GBM
    module Map
      class MapSet

        attr_accessor :objects
        @objects

        def initialize
          @objects = []
        end

        def maps master_id = nil
          @objects.select{ |a|
            a.is_a? GBTiles::GBM::Map::Objects::Map
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def map_export_settings master_id = nil
          @objects.select{ |a|
            a.is_a? GBTiles::GBM::Map::Objects::MapExportSettings
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def map_settings master_id = nil
          @objects.select{ |a|
            a.is_a? GBTiles::GBM::Map::Objects::MapSettings
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def map_tile_data master_id = nil
          @objects.select{ |a|
            a.is_a? GBTiles::GBM::Map::Objects::MapTileData
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def producers master_id = nil
          @objects.select{ |a|
            a.is_a? GBTiles::GBM::Map::Objects::Producer
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end
      end
    end
  end
end
