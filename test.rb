#!/usr/bin/env ruby

require './ruby-progressbar-twoline.rb'

progressbar = ProgressBar.create(
  format: "%t %b%i\n%a %E Processed: %c of %C, %P%",
  remainder_mark: '･',
)
l = ""
('a'..'z').each do |c|
  l << c
  progressbar.log l
  progressbar.increment
  `sleep 2s`
end