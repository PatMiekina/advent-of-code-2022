require './day-5-input'
require './day-5'

stacks2 = StackSet.new(STACKS)
array_of_steps = StringToInstructionProcessor.new(INSTRUCTIONS).steps

array_of_steps.each do |step|
    instruction = Instruction.new(step)
    stacks2.move_crates(instruction)
end

puts "Top crates are: #{stacks2.top_crates}"