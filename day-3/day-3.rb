require './day-3-input'

class Rucksack
    attr_accessor :content, :rucksacks, :compartments, :priority_value
    @@rucksacks = []
    @@rucksacks_priority_sum = 0

    def self.all_rucksacks
        @@rucksacks_priority_sum
    end

    def self.sum_priority_values
        sum = 0
        @@rucksacks.each do |rucksack|
            sum += rucksack.priority_value
        end
        sum
    end

    def initialize(string)
        @initial_string = string
        @content = string
        @@rucksacks << self.content
        @compartments = []
        @priority_value = 0
    end

    def create_compartments
        rucksack_size = self.content.length
        self.compartments << self.content.slice(0..(rucksack_size / 2 - 1))
        self.compartments << self.content.slice((rucksack_size / 2)..rucksack_size)
    end

    def find_same_characters
        self.compartments[0].chars do |character1|
            self.compartments[1].chars do |character2|
                return character1 if character1 == character2
            end
        end
    end

    def add_value_to_priority_sum
        char = find_same_characters
        if char.ord > 96
            self.priority_value = char.ord - 96
        else
            self.priority_value = char.ord - 38
        end
        @@rucksacks_priority_sum += self.priority_value
    end

    def find_same_character_value
        self.create_compartments
        self.find_same_characters
        self.add_value_to_priority_sum
    end    

end

RUCKSACKS.split("\n").each do |rucksack|
    rucksack = Rucksack.new(rucksack)
    rucksack.find_same_character_value
end

puts Rucksack.all_rucksacks
