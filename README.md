Bmi Calc
=======

Gem to calculate BMI

## Installation

Add this line to your application's Gemfile:

    gem 'bmicalc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bmicalc-qwertme

## Usage

### Metric
    require 'bmicalc'

    bmi = Bmicalc.new
    bmi.calculate(64, 178) # 20.199469763918696

### Imperial

    bmi = Bmicalc.new(units: :imperial)
    bmi.calculate(141, 71) # ~20

### WHO BMI classification

    bmi = Bmicalc.new
    bmi.classification(27) # 'overweight'
    bmi.sub_classification(27) # 'pre-obese'

Forked from http://github.com/tomkadwill/bmicalc and heavily modified
