module GIOS
  module Indicators
    class EquivalentContinuousSoundLevel
      # This function calculates equivalent continuous sound level
      # for an array of instantaneous sound levels measured with A filter
      # based on PN-ISO 1996-1
      def laeq(sound_levels)
        base_levels = sound_levels.map{ |sl| 10 ** (sl.fdiv(10)) }
        avg = base_levels.sum.fdiv(sound_levels.size)
        10 * Math.log10(avg)
      end
    end
  end
end
