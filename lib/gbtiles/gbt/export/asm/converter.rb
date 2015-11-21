require "gbtiles/gbt/export/asm/channels/pulse"
require "gbtiles/gbt/export/asm/channels/wav"
require "gbtiles/gbt/export/asm/channels/noise"

require "erb"

module GBTiles
  module GBT
    module Export
      module ASM
        class Converter

          CHANNELS = {
            1 => GBTiles::GBT::Export::ASM::Channels::Pulse.new(1),
            2 => GBTiles::GBT::Export::ASM::Channels::Pulse.new(2),
            3 => GBTiles::GBT::Export::ASM::Channels::Wav.new,
            4 => GBTiles::GBT::Export::ASM::Channels::Noise.new
          }

          def convert data
            CHANNELS[1].data = data[0..3]
            CHANNELS[2].data = data[4..7]
            CHANNELS[3].data = data[8..11]
            CHANNELS[4].data = data[12..15]

            [
              CHANNELS[1].convert.map { |x| sprintf('0x%02X', x) }.join(', '),
              CHANNELS[2].convert.map { |x| sprintf('0x%02X', x) }.join(', '),
              CHANNELS[3].convert.map { |x| sprintf('0x%02X', x) }.join(', '),
              CHANNELS[4].convert.map { |x| sprintf('0x%02X', x) }.join(', ')
            ].join(', ')
          end
        end
      end
    end
  end
end
