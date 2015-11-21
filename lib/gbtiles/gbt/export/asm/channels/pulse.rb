# CHANNEL 1
# CHANNEL 2

require "gbtiles/gbt/export/asm/channel"

module GBTiles
  module GBT
    module Export
      module ASM
        module Channels
          class Pulse < GBTiles::GBT::Export::ASM::Channel

            def initialize(channel_number)
              super(channel_number)
            end

            def is_pulse?
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
              instrument = sample_number & 3

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
                    (1 << 6) | (instrument << 4) | converted[:number],
                    converted[:params]
                ]
              rescue Exception => e
                # Silence
              end

              return [0]
            end

            def convert_note_new
              instrument = sample_number & 3

              # Volume effect
              if effect_number == 0xC then
                return [
                    (1 << 7) | note_index,
                    (instrument << 4) | convert_volume
                ]
              end

              # Other effects
              begin
                converted = convert_effect

                return [
                    (1 << 7) | note_index,
                    (1 << 7) | (instrument << 4) | converted[:number],
                    converted[:params]
                ]
              rescue Exception => e
                throw "Pulse - Invalid command: #{e}"
              end

            end
          end
        end
      end
    end
  end
end
