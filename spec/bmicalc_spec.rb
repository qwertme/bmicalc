require 'bmicalc'

describe Bmicalc do

  context 'metric' do
    context 'returns bmi' do

      it 'underweight' do
        expect(subject.calculate(54, 178)).to be_within(0.5).of(17)
      end

      it 'ideal' do
        expect(subject.calculate(64, 178)).to be_within(0.5).of(20)
      end

      it 'overweight' do
        expect(subject.calculate(68, 148)).to be_within(0.5).of(31)
      end

      it 'obese' do
        expect(subject.calculate(118, 168)).to be_within(0.5).of(42)
      end
    end

    it 'returns bmi without rounding' do
      bmi = Bmicalc.new(round: false)
      expect(bmi.calculate(64, 178)).to eq(20.199469763918696)
    end
  end

  context 'imperial' do
    it 'calculates with imperial values' do
      bmi = Bmicalc.new(:units => :imperial)
      expect(bmi.calculate(141, 70)).to be_within(0.5).of(20)
    end

    it 'returns bmi without rounding' do
      bmi = Bmicalc.new(:units => :imperial)
      expect(bmi.calculate(141, 70.1)).to eq(20.171509622487545)
    end
  end
end
