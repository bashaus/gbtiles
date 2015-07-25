module GBTiles
  module GBR
    module TileSet
      OBJECT_TYPE = {
        :producer       => 0x01,
        :tile_data      => 0x02,
        :tile_settings  => 0x03,
        :tile_export    => 0x04,
        :tile_import    => 0x05,
        :palettes       => 0x0D,
        :tile_pal       => 0x0E,
        :deleted        => 0xFF
      }
    end
  end
end
