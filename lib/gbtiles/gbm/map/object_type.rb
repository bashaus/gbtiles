module GBTiles
  module GBM
    module Map
      OBJECT_TYPE = {
        :producer            => 0x01,
        :map                 => 0x02,
        :map_tile_data       => 0x03,
        :map_settings        => 0x07,
        :map_export_settings => 0x09,
        :deleted             => 0xFF
      }
    end
  end
end
