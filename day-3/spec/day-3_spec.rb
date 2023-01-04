require_relative "../day-3"
require_relative '../day-3-input'

describe "rucksack" do 
    rucksack = Rucksack.new("vJrwpWtwJgWrhcsFMMfFFhFp")

    context '#create_compartments' do

        it 'divides rucksack into equal compartments' do
            rucksack.create_compartments
            expect(rucksack.compartments[0].size).to eq(rucksack.compartments[1].size)
        end
    end

    context '#find_same_characters' do
        it 'returns the same character in each compartment' do
            expect(rucksack.find_same_characters).to eq("p")
        end
    end

    context '#add_value_to_priority_sum' do
        it 'adds the right value of the same character in each compartment' do
            rucksack.add_value_to_priority_sum
            expect(rucksack.priority_value).to eq(16)
        end
    end

    context '#find_same_character_value' do
        it 'finds the same character and returns it value' do
            expect(rucksack.find_same_character_value).to eq(16)
        end
    end
end