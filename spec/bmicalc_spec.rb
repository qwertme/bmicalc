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
      expect(subject.classification(18.49)).to eq('underweight')
    end

    it 'normal' do
      expect(subject.calculate(64, 178)).to be_within(0.5).of(20)
      expect(@metric_bmi.calculate(64, 178)).to be_within(0.05).of(@imperial_bmi.calculate(140.8, 70.078))
      expect(subject.classification(18.50)).to eq('normal')
      expect(subject.classification(24.99)).to eq('normal')
    end

    it 'overweight' do
      expect(subject.calculate(68, 148)).to be_within(0.5).of(31)
      expect(@metric_bmi.calculate(68, 178)).to be_within(0.05).of(@imperial_bmi.calculate(149.6, 70.078))
      expect(subject.classification(25)).to eq('overweight')
      expect(subject.classification(29.99)).to eq('overweight')
    end

    it 'obese' do
      expect(subject.calculate(118, 168)).to be_within(0.5).of(42)
      expect(@metric_bmi.calculate(118, 168)).to be_within(0.1).of(@imperial_bmi.calculate(259.6, 66.1417))
      expect(subject.classification(30)).to eq('obese')
    end

    it 'should have sub classifications' do
      expect(subject.sub_classification(15.99)).to eq('severe thinness')
      expect(subject.sub_classification(16.99)).to eq('moderate thinness')
      expect(subject.sub_classification(18.49)).to eq('mild thinness')
      expect(subject.sub_classification(24.99)).to eq('normal')
      expect(subject.sub_classification(29.99)).to eq('pre-obese')
      expect(subject.sub_classification(34.99)).to eq('obese class I')
      expect(subject.sub_classification(39.99)).to eq('obese class II')
      expect(subject.sub_classification(40)).to eq('obese class III')
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
