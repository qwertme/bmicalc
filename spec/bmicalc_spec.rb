require 'bmicalc'

describe Bmicalc do

  context 'returns bmi' do

    before(:each) do
      @metric_bmi = subject
      @imperial_bmi = Bmicalc.new(:units => :imperial)
    end

    it 'underweight' do
      expect(subject.calculate(54, 178)).to be_within(0.5).of(17)
      expect(@metric_bmi.calculate(54, 178)).to be_within(0.05).of(@imperial_bmi.calculate(118.8, 70.078))
    end

    it 'ideal' do
      expect(subject.calculate(64, 178)).to be_within(0.5).of(20)
      expect(@metric_bmi.calculate(64, 178)).to be_within(0.05).of(@imperial_bmi.calculate(140.8, 70.078))
    end

    it 'overweight' do
      expect(subject.calculate(68, 148)).to be_within(0.5).of(31)
      expect(@metric_bmi.calculate(68, 178)).to be_within(0.05).of(@imperial_bmi.calculate(149.6, 70.078))
    end

    it 'obese' do
      expect(subject.calculate(118, 168)).to be_within(0.5).of(42)
      expect(@metric_bmi.calculate(118, 168)).to be_within(0.1).of(@imperial_bmi.calculate(259.6, 66.1417))
    end
  end

  it 'default to metric' do
    expect(subject.calculate(64, 178)).to eq(20.199469763918696)
  end

  it 'imperial' do
    bmi = Bmicalc.new(:units => :imperial)
    expect(bmi.calculate(141, 70.1)).to eq(20.171509622487545)
  end
end
