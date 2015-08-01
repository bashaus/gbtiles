module GBTiles
  module GBM
    module Map
      class MapSet

        attr_accessor :objects

        def initialize
          @objects = []
        end

        def producer master_id = nil
          @objects.select{ |a|
            a.object_type == GBTiles::GBM::Map::OBJECT_TYPE[:producer]
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def map master_id = nil
          @objects.select{ |a|
            a.object_type == GBTiles::GBM::Map::OBJECT_TYPE[:map]
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def map_tile_data master_id = nil
          @objects.select{ |a|
            a.object_type == GBTiles::GBM::Map::OBJECT_TYPE[:map_tile_data]
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def map_settings master_id = nil
          @objects.select{ |a|
            a.object_type == GBTiles::GBM::Map::OBJECT_TYPE[:map_settings]
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def map_export_settings master_id = nil
          @objects.select{ |a|
            a.object_type == GBTiles::GBM::Map::OBJECT_TYPE[:map_export_settings]
          }.select{ |a|
            master_id.nil? || a.object_id = master_id
          }
        end

        def deleted
          @objects.select{ |a|
            a.object_type == GBTiles::GBM::Map::OBJECT_TYPE[:deleted]
          }
        end

        def unknown
          @objects.select{ |a|
            GBTiles::GBM::Map::OBJECT_TYPE.key(a.object_type).nil?
          }
        end
      end
    end
  end
end
