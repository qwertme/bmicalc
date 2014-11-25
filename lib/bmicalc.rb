require "bmicalc/version"

class Bmicalc

  CLASSIFICATIONS = {
    18.5 => 'underweight',
    25.0 => 'normal',
    30.0 => 'overweight'
  }

  SUB_CLASSIFICATIONS = {
      16.0 => 'severe thinness',
      17.0 => 'moderate thinness',
      18.5 => 'mild thinness',
      25.0 => 'normal',
      30.0 => 'pre-obese',
      35.0 => 'obese class I',
      40.0 => 'obese class II'
  }

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

  def classification(bmi)
    find_classification(CLASSIFICATIONS, 'obese', bmi)
  end

  def sub_classification(bmi)
    find_classification(SUB_CLASSIFICATIONS, 'obese class III', bmi)
  end

  private
  def find_classification(classifications, default, bmi)
    classifications.each do |bmi_limit, name|
      if bmi < bmi_limit
        return name
      end
    end

    return default
  end
end
