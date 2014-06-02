require "bmicalc/version"

class Bmicalc

  attr_accessor :weight, :height

  def initialize(options = {})
    @round = options.fetch(:round, true)
    @metric = options.fetch(:metric, true)
  end

  def result
    error unless weight && height
    calculate_result
  end

  private

  def calculate_result
    if @metric
      round(metric)
    else
      round(imperial)
    end
  end

  def metric
    weight / (height * height)
  end

  def imperial
    (weight * 703) / (height * height)
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
