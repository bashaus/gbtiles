module GBTiles
  module GBT
    module Export
      module ASM
        module Effects
          def effect_pan
            left = effect_param_2.between?(0, 11) ? 1 : 0
            right = effect_param_2.between?(4, 15) ? 1 : 0

            {
              :number => 0,
              :params => (left << (3 + channel_number)) | (right << (channel_number - 1))
            }
          end
        end
      end
    end
  end
end
