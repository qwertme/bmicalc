require "bmicalc/version"

class Bmicalc

  class MetricBMI
    def calculate(weight, height)
      weight / (height * height)
    end
  end

  class ImperialBMI
    def calculate(weight, height)
      (weight * 703) / (height * height)
    end
  end
  attr_accessor :weight, :height

  def initialize(options = {})
    @round = options.fetch(:round, true)
    @bmi_calculator = options.fetch(:metric, true) ? MetricBMI.new : ImperialBMI.new
  end

  def result
    error unless weight && height
    calculate_result
  end

  private

  def calculate_result
    round(@bmi_calculator.calculate(weight, height))
  end

  def round(result)
    if @round
      result.round
    else
      result
    end
  end

  def error
    if weight
      raise StandardError, 'height not set'
    else
      raise StandardError, 'weight not set'
    end
  end

end
