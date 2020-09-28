#!/usr/bin/env ruby

# exemple : convertnew 12 m2 pi2

# conversion table : 1 pi2 = 0.09290304 m2
# so 1 from_unit = x to_unit
@conversion_table = [
  [ 'pi2',  'm2',       0.09290304 ],
  [ 'kg',   'livre',    2.205      ],
  [ 'euro', 'dollarca', 1.56       ],
  [ 'pi',   'm',        0.3048     ],
  [ 'in',   'm',        0.0254     ],
  [ 'yd',   'm',        0.9144     ],
  [ 'mi',   'm',     1609.344      ],
]

def valid_units
  @conversion_table.flatten.filter { |el| el.is_a? String }
end

def conversion(str1, str2)
  @conversion_table.find { |conv| conv.include?(@from_unit) && conv.include?(@to_unit) }
end

def calc
  # multiply or divide according to from_value and to_value order
  if @from_unit == @conversion[0]
    to_value = @from_value * @conversion[2]
  elsif @from_unit == @conversion[1]
    to_value = @from_value / @conversion[2]
  else
    puts "Error: from_unit could not be found in conversion"
    exit
  end
  puts to_value
end

def manage_args
  # there should be exactly 3 arguments
  if ARGV.length != 3
    puts "Error: we need 3 arguments"
    puts "exemple: convertnew 12 m2 pi2"
    puts "example: 123 euros cadollars"
    exit
  end

  # first argument should be numeric
  unless ARGV[0].to_f.is_a? Numeric
    puts "Error: first argument must be a Numeric"
    exit
  end
  @from_value = ARGV[0].to_f

  # second and third arguments should in the conversion table
  [ARGV[1], ARGV[2]].each do |unit|
    unless valid_units.include?(unit.to_s)
      puts "Error: unit '#{unit}' is not recognized"
      puts "Error: valid units are #{valid_units}"
      exit
    end
  end

  @from_unit, @to_unit = ARGV[1], ARGV[2]

  # there should be a conversion for those 2 units
  @conversion = conversion(@from_unit, @to_unit)
  if @conversion.nil? || @conversion.empty?
    puts "Error: conversion not found with #{@from_unit} and #{@to_unit}"
    exit
  end

end


def main
  manage_args
  calc
end

main
