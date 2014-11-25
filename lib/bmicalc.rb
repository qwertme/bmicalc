require "bmicalc/version"

class Bmicalc

  class MetricBMI
    def calculate(weight, height)
      h = height.to_f / 100
      weight / (h * h)
    end
  end

  class ImperialBMI
    def calculate(weight, height)
      (weight * 703) / (height * height)
    end
  end


  def initialize(options = {})
    @bmi_calculator = options.fetch(:units, :metric) == :metric ? MetricBMI.new : ImperialBMI.new
  end

  def calculate(weight, height)
    @bmi_calculator.calculate(weight, height)
  end
end
