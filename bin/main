#!/usr/bin/env ruby
# bin/main.rb
require './lib/table.rb'
require './lib/player.rb'
require './lib/game.rb'

def reg_print(text = '')
  if text.is_a?(Array)
    text.each { |x| print x }
  elsif text.is_a?(String)
    print text
  end
end

def clear_print(print = ' ', marker = ' ')
  make_space
  pretty_print(print, marker)
  make_space
end

def make_space
  pretty_print
  pretty_print('', '.')
  pretty_print
end

def pretty_print(text = '', ext = ' ')
  if text.is_a?(Array)
    text.each { |x| puts x.center(100, ext) }
  elsif text.is_a?(String)
    puts text.center(100, ext)
  end
end

def clear_input
  gets.chomp.strip
end

Game.new
