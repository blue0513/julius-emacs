#! /usr/bin/env ruby

require 'julius'

julius = Julius.new
julius.each_message do |message, prompt|
  case message.name
  when :RECOGOUT
    shypo = message.first
    whypo = shypo.first
    confidence = whypo.cm.to_f

    puts "#{message.sentence} #{confidence}"
  end
end
