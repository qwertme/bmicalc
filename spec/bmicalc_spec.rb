require 'bmicalc'

describe Bmicalc do

  context 'returns bmi' do

    it 'underweight' do
      subject.weight = 54
      subject.height = 1.78
      expect(subject.result).to eq(17)
    end

    it 'ideal' do
      subject.weight = 64
      subject.height = 1.78
      expect(subject.result).to eq(20)
    end

    it 'overweight' do
      subject.weight = 68
      subject.height = 1.48
      expect(subject.result).to eq(31)
    end

    it 'obese' do
      subject.weight = 118
      subject.height = 1.68
      expect(subject.result).to eq(42)
    end
  end

  it 'returns correct error message for weight' do
    subject.height = 1.78
    proc { subject.result }.should raise_error(StandardError, 'weight not set')
  end

  it 'returns correct error message for height' do
    subject.weight = 64
    proc { subject.result }.should raise_error(StandardError, 'height not set')
  end

  it 'returns bmi without rounding' do
    bmi = Bmicalc.new(round: false)
    bmi.weight = 64
    bmi.height = 1.78
    expect(bmi.result).to eq(20.199469763918696)
  end

end
