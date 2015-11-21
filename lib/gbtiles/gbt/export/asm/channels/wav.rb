# CHANNEL 3

require "gbtiles/gbt/export/asm/channel"

module GBTiles
  module GBT
    module Export
      module ASM
        module Channels
          class Wav < GBTiles::GBT::Export::ASM::Channel

            def initialize
              super(3)
            end

            def is_wav?
              true
            end

            def convert_volume
              case super
              when 0..3
                return 0
              when 4..7
                return 3
              when 8..11
                return 2
              when 12..15
                return 1
              else
                return 1
              end
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
              instrument = (sample_number - 8) & 15

              # Volume effect
              if effect_number == 0xC then
                return [
                    (1 << 7) | note_index,
                    (convert_volume << 4) | instrument
                ]
              end

              # Other effects
              begin
                converted = convert_effect

                if (converted[:number] > 7) then
                  throw "Invalid command: only 0-7 allowed in this mode"
                end

                return [
                    (1 << 7) | note_index,
                    (1 << 7) | (converted_num << 4) | instrument,
                    converted_params
                ]
              rescue Exception => e
                throw "Wav - Invalid command: #{e}"
              end
            end

          end
        end
      end
    end
  end
end
