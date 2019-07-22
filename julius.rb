#! /usr/bin/env ruby

# See: https://github.com/hadzimme/julius
require 'julius'

julius = Julius.new
julius.each_message do |message, prompt|
  case message.name
  when :RECOGOUT
    puts message.sentence
  end
end
