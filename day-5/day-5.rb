require './day-5-input'

class StringToInstructionProcessor
    attr_accessor :steps

    def initialize(string)
        @steps = split_string_to_steps_array(string)
    end

    def split_string_to_steps_array(string)
        string.split("\n").map do |step|
            step.gsub("move ", "").gsub("from ", "").gsub("to ", "").split(" ").map do |value|
                value.to_i
            end
        end
    end
end

class Instruction
    attr_accessor :number_of_crates, :initial_stack, :end_stack
    @@instructions = []

    def initialize(array)
        @number_of_crates = 0
        @initial_stack = 0
        @end_stack = 0
        self.assign_steps_from_array(array)
        @@instructions << self
    end

    def assign_steps_from_array(array)
        @number_of_crates = array[0]
        @initial_stack = array[1]
        @end_stack = array[2]
    end

end

class StackSet
    attr_accessor :content
    def initialize(array)
        @content = array.dup
    end

    def move_crates(instruction)
        # p "Number of crates: #{instruction.number_of_crates}, from: #{instruction.initial_stack}, to: #{instruction.end_stack}"
        moved_crates = @content[instruction.initial_stack - 1].pop(instruction.number_of_crates)
        moved_crates.reverse.each do |crate|
            @content[instruction.end_stack - 1] << crate
        end
    end

    def top_crates
        top_crates_array = []
        @content.each do |stack|
            top_crates_array << stack.pop
        end
        top_crates_array.join
    end
end