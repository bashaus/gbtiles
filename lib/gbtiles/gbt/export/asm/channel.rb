require "gbtiles/gbt/export/asm/effects/arpeggio"
require "gbtiles/gbt/export/asm/effects/break_and_set_step"
require "gbtiles/gbt/export/asm/effects/cut_note"
require "gbtiles/gbt/export/asm/effects/jump"
require "gbtiles/gbt/export/asm/effects/pan"
require "gbtiles/gbt/export/asm/effects/speed"
require "gbtiles/gbt/export/asm/effects/volume"

module GBTiles
  module GBT
    module Export
      module ASM
        class Channel
          include GBTiles::GBT::Export::ASM::Effects

          NOTES = [
            1712,1616,1524,1440,1356,1280,1208,1140,1076,1016, 960, 907,
             856, 808, 762, 720, 678, 640, 604, 570, 538, 508, 480, 453,
             428, 404, 381, 360, 339, 320, 302, 285, 269, 254, 240, 226,
             214, 202, 190, 180, 170, 160, 151, 143, 135, 127, 120, 113,
             107, 101,  95,  90,  85,  80,  75,  71,  67,  63,  60,  56,
              53,  50,  47,  45,  42,  40,  37,  35,  33,  31,  30,  28
          ];

          attr_accessor :channel_number

          @data = [ 0, 0, 0, 0 ]

          def data
            @data
          end

          def data=(value)
            if value.kind_of?(Array) then
              @data = value
            else
              @data = value.unpack('CCCC')
            end
          end

          def initialize channel_number
            @channel_number = channel_number
          end

          # Channel information

          def is_pulse?
            false
          end

          def is_wav?
            false
          end

          def is_noise?
            false
          end

          # Data

          def sample_number
            (@data[0] & 0xF0) | ((@data[2] & 0xF0) >> 4)
          end

          def sample_period
            @data[1] | ((@data[0] & 0xF) << 8)
          end

          def is_empty_effect?
            effect_number == 0 && effect_param == 0
          end

          def effect_number
            @data[2] & 0xF
          end

          def effect_param
            @data[3]
          end

          def effect_param_1
            (@data[3] & 0xF0) >> 4
          end

          def effect_param_2
            @data[3] & 0x0F
          end

          def effect_param_as_bcd
            (((effect_param & 0xF0) >> 4) * 10) + (effect_param & 0xF)
          end

          def convert_volume
            (effect_param == 64) ? 0xF : (effect_param >> 2);
          end

          # Amiga's 50 Hz to GB's 60 Hz
          def convert_speed speed
            speed * 60 / 50
          end

          def convert_effect
            if effect_number == 0x0 then
              return effect_arpeggio
            end

            if effect_number == 0xB then
              return effect_jump
            end

            if effect_number == 0xC then
              return effect_volume
            end

            if effect_number == 0xD then
              return effect_break_and_set_step
            end

            if effect_number == 0xE && effect_param_1 == 0x8 then
              return effect_pan
            end

            if effect_number == 0xE && effect_param_1 == 0xC then
              return effect_cut_note
            end

            if effect_number == 0xF then
              return effect_speed
            end

            throw "Unsupported effect"
          end

          def note_index
            period = sample_period

            if period <= 0 then
              return -1
            end

            if !is_noise? then
              if !period.between?(NOTES.last, NOTES.first) then
                throw "Note `#{period}` out of bounds"
              end
            end

            NOTES.index(
              NOTES.min_by { |x| (period - x).abs }
            )
          end

        end
      end
    end
  end
end
