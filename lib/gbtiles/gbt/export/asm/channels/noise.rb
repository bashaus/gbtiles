# CHANNEL 4

require "gbtiles/gbt/export/asm/channel"

module GBTiles
  module GBT
    module Export
      module ASM
        module Channels
          class Noise < GBTiles::GBT::Export::ASM::Channel

            def initialize
              super(4)
            end

            def is_noise?
              true
            end

            def convert
              if sample_period == 0 then
                convert_note_not_new
              else
                convert_note_new
              end
            end

            def convert_note_not_new
              if is_empty_effect? then
                return [0]
              end

              # Volume effect
              if effect_number == 0xC then
                return [
                    (1 << 5) | convert_volume
                ]
              end

              # Other effects
              begin
                converted = convert_effect

                return [
                    (1 << 6) | converted[:number],
                    converted[:params]
                ]
              rescue Exception => e
                # Silence
              end

              return [0]
            end

            def convert_note_new
              instrument = (sample_number - 16) & 0x1F

              # Volume effect
              if effect_number == 0xC then
                return [
                    (1 << 7) | instrument,
                    convert_volume
                ]
              end

              # Other effects
              begin
                converted = convert_effect

                return [
                    (1 << 7) | instrument,
                    (1 << 7) | converted[:number],
                    converted[:params]
                ]
              rescue Exception => e
                throw "Noise - Invalid command: #{e}"
              end
            end
          end
        end
      end
    end
  end
end
