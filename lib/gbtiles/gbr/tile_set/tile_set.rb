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
            a.is_a? GBTiles::GBR::TileSet::Objects::Producer
          }
        end

        def tile_data
          @objects.select{ |a|
            a.is_a? GBTiles::GBR::TileSet::Objects::TileData
          }
        end

        def tile_settings
          @objects.select{ |a|
            a.is_a? GBTiles::GBR::TileSet::Objects::TileSettings
          }
        end

        def tile_export
          @objects.select{ |a|
            a.is_a? GBTiles::GBR::TileSet::Objects::TileExport
          }
        end

        def tile_import
          @objects.select{ |a|
            a.is_a? GBTiles::GBR::TileSet::Objects::TileImport
          }
        end

        def palettes
          @objects.select{ |a|
            a.is_a? GBTiles::GBR::TileSet::Objects::Palettes
          }
        end

        def tile_pal
          @objects.select{ |a|
            a.is_a? GBTiles::GBR::TileSet::Objects::TilePal
          }
        end
      end
    end
  end
end
