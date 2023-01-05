require './day-3-input.rb'
require './day-3.rb'

RUCKSACKS.split("\n").each do |rucksack|
    rucksack = Rucksack.new(rucksack)
    rucksack.find_same_character_value
end

puts Rucksack.all_rucksacks