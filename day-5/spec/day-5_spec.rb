require_relative '../day-5-input'
require_relative '../day-5'

describe "StringToInstructionProcessor" do
    processor = StringToInstructionProcessor.new(TEST_INSTRUCTIONS)
    context "#split_string_to_steps" do
        it "creates array with numbers from instruction: number of crates, initial crate, end crate" do
            expect(processor.steps).to eq([[1,2,1], [3,1,3], [2,2,1], [1,1,2]])
        end
    end
end

describe "Instruction" do
    # context "instructions_to_array" do
    #     it "converts a string instruction to an array" do
    #     end
    # end
    instruction = Instruction.new([1,2,1])
    context "#assign_steps_from_array" do
        it "assigns a number of crates to be moved to a variable" do
            expect(instruction.number_of_crates).to eq(1)
        end

        it "assigns the initial stack number to a variable" do
            expect(instruction.initial_stack).to eq(2)
        end
        
        it "assigns the end stack number to a variable" do
            expect(instruction.end_stack).to eq(1)
        end
    end
end

describe "StackSet" do
    stacks = StackSet.new(TEST_STACKS)
    instruction1 = Instruction.new([1,2,1])
    instruction2 = Instruction.new([3,1,3])

    context "#move_crates" do
        it "changes position of a crate" do
            stacks.move_crates(instruction1)
            expect(stacks.content).to eq([['Z', 'N', 'D'],['M', 'C'],['P']])
        end

        it "changes position of multiple crates" do
            stacks.move_crates(instruction2)
            expect(stacks.content).to eq([[],['M', 'C'],['P','D', 'N', 'Z']])
        end
    end

    context "#top_crates" do
        it "returns a top crate" do
            expect(stacks.top_crates).to eq('CZ')
        end
    end
end

# describe "Full Test" do
#     stacks1 = StackSet.new(TEST_STACKS)
#     array_of_steps = StringToInstructionProcessor.new(TEST_INSTRUCTIONS).steps
#     puts "New Stack: #{stacks1.content}"

#     steps = 1
#     array_of_steps.each do |step|
#         instruction = Instruction.new(step)
#         stacks1.move_crates(instruction)
#         puts "Step #{steps}: #{stacks1.content}" 
#         steps += 1
#     end

#     it "rearranges the stacks correctly" do
#         expect(stacks1.content).to eq([['C'], ['M'], ['P', 'D', 'N', 'Z']])
#     end
# end