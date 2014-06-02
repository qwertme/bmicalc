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
      metric
    else
      imperial
    end
  end

  def metric
    if @round
      (weight / (height * height)).round
    else
      weight / (height * height)
    end
  end

  def imperial
    if @round
      ((weight * 703) / (height * height)).round
    else
      (weight * 703) / (height * height)
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
