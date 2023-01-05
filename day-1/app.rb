require './day-1'
require './day-1-input'

calorie_set = CaloriesArray.new(CALORIES).content

calorie_set.each do |elf_calories_set|
    Elf.new(elf_calories_set)
end

p "Maximum sum: #{Elf.find_max_calories}"
p "Sum of top 3 sums: #{Elf.find_top_three_calories_sum}"