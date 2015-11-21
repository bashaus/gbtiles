module GBTiles
  module GBT
    module Export
      module ASM
        module Effects
          def effect_speed
            speed = effect_param

            if speed > 0x1F then
              throw "Unsupported BPM speed effect: #{speed}"
            end

            {
              :number => 10,
              :params => convert_speed(speed)
            }
          end
        end
      end
    end
  end
end
