module GBTiles
  module GBT
    module Export
      module ASM
        module Effects
          def effect_break_and_set_step
            {
              :number => 9,
              :params => effect_param_as_bcd
            }
          end
        end
      end
    end
  end
end
