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
  attr_accessor :weight, :height

  def initialize(options = {})
    @bmi_calculator = options.fetch(:units, :metric) == :metric ? MetricBMI.new : ImperialBMI.new
  end

  def result
    error unless weight && height
    @bmi_calculator.calculate(weight, height)
  end

  private

  def error
    if weight
      raise StandardError, 'height not set'
    else
      raise StandardError, 'weight not set'
    end
  end

end
