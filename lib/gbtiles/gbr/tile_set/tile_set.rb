module GBTiles
  module GBR
    module TileSet
      class TileSet

        attr_accessor :objects

        def initialize
          @objects = []
        end

        def producer
          @objects.select{ |a|
            a.object_type == GBTiles::GBR::TileSet::OBJECT_TYPE[:producer]
          }
        end

        def tile_data
          @objects.select{ |a|
            a.object_type == GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_data]
          }
        end

        def tile_settings
          @objects.select{ |a|
            a.object_type == GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_settings]
          }
        end

        def tile_export
          @objects.select{ |a|
            a.object_type == GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_export]
          }
        end

        def tile_import
          @objects.select{ |a|
            a.object_type == GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_import]
          }
        end

        def palettes
          @objects.select{ |a|
            a.object_type == GBTiles::GBR::TileSet::OBJECT_TYPE[:palettes]
          }
        end

        def tile_pal
          @objects.select{ |a|
            a.object_type == GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_pal]
          }
        end
      end
    end
  end
end
