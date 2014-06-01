require "bmicalc/version"

class Bmicalc

  attr_accessor :weight, :height

  def result
    error unless weight && height
    calculate_result
  end

  private

  def calculate_result
    (weight / (height * height)).round
  end

  def error
    if weight
      raise StandardError, 'height not set'
    else
      raise StandardError, 'weight not set'
    end
  end

end
