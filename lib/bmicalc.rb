require "bmicalc/version"

class Bmicalc

  attr_accessor :weight, :height

  def initialize(options = {})
    @round = options.fetch(:round, true)
  end

  def result
    error unless weight && height
    calculate_result
  end

  private

  def calculate_result
    if @round
      (weight / (height * height)).round
    else
      weight / (height * height)
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
