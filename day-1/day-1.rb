require './day-1-input'

class CaloriesArray

    attr_accessor :content

    def initialize(string)
        @initial_string = string
        @content = []
    end

    def split_string_into_sub_arrays_of_integers
        @content = @initial_string.split("\n\n").map do |elf_calories|
            elf_calories.split("\n").map do |calories|
                calories.to_i
            end
        end
        @content
    end


end

class Elf
    attr_accessor :elves, :calories, :calories_sum

    @@elves = []

    def initialize(calories_array)
        @calories = calories_array
        @calories_sum = calories_array.sum
        @@elves << self
    end

    def self.all
        @@elves
    end

    def self.find_max_calories
        max_sum = 0
        @@elves.each do |elf|
            max_sum = elf.calories_sum if max_sum < elf.calories_sum
        end
        max_sum
    end

    def self.find_top_three_calories_sum
        elf1 = 0
        elf2 = 0
        elf3 = 0

        @@elves.each do |elf|
            if elf1 < elf.calories_sum
                elf1 = elf.calories_sum
            elsif elf2 < elf.calories_sum
                elf2 = elf.calories_sum
            elsif elf3 < elf.calories_sum
                elf3 = elf.calories_sum
            end
        end
        elf1 + elf2 + elf3
    end
end

calorie_set = CaloriesArray.new(CALORIES).split_string_into_sub_arrays_of_integers

calorie_set.each do |elf_calories_set|
    Elf.new(elf_calories_set)
end

p "Maximum sum: #{Elf.find_max_calories}"
p "Sum of top 3 sums: #{Elf.find_top_three_calories_sum}"