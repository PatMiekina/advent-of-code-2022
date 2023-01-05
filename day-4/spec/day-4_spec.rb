require_relative "../day-4"
require_relative "../day-4-input"

describe "IDPairsInput" do
    context "#split_input_into_pairs_of_sub_arrays" do
        it "upon initialization splits input into pairs of arrays" do
            pairs = IDPairsInput.new(TEST)
            expect(pairs.pairs).to eq([[[2, 3, 4], [6, 7, 8]], [[2, 3], [4, 5]], [[5, 6, 7], [7, 8, 9]], [[2, 3, 4, 5, 6, 7, 8], [3, 4, 5, 6, 7]], [[6], [4, 5, 6]], [[2, 3, 4, 5, 6], [4, 5, 6, 7, 8]]])
        end
    end
end

describe "Pair" do
    pair1 = Pair.new([[5, 6, 7], [7, 8, 9]])
    pair2 = Pair.new([[2, 3, 4, 5, 6, 7, 8], [3, 4, 5, 6, 7]])
    pair3 = Pair.new([[3, 4, 5, 6, 7], [2, 3, 4, 5, 6, 7, 8]])

    context "#contain?" do
        it "returns false for pairs that don't contain each other" do
            expect(pair1.contain?).to eq(false)
        end

        it "returns true for pairs that do contain each other" do
            expect(pair2.contain?).to eq(true)
        end

        it "returns true for pairs that do contain each other considering order" do
            expect(pair3.contain?).to eq(true)
        end
    end

    context "#self.contained_pairs" do
        it "returns a number of pairs contained within each other" do
            expect(Pair.contained_pairs).to eq(0)
        end
    end

    context "#add_to_contained_pairs_sum_if_arrays_contain_each_other" do
        it "adds 1 to the sum of combined pairs if the ranges contain each other" do
            pair2.add_to_contained_pairs_sum_if_arrays_contain_each_other
            expect(Pair.contained_pairs).to eq(1)
        end
    end
end