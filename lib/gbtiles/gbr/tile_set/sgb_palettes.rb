module GBTiles
  module GBR
    module TileSet
      SGB_PALETTES = {
        :none                 => 0,
        :constant_per_entry   => 1,
        :per_entry_2_bits     => 2, # 2_bits_per_entry
        :per_entry_4_bits     => 3, # 4_bits_per_entry
        :per_entry_1_byte     => 4  # 1_byte_per_entry
      }
    end
  end
end
