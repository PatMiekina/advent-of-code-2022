require "./day-4-input"

class IDPairsInput
    attr_accessor :pairs

    def initialize(input)
        @initial_input = input
        @pairs = []
        self.split_input_into_pairs_of_sub_arrays
    end

    def split_input_into_pairs_of_sub_arrays
        @initial_input.split("\n").map do |pair|
            pair_array = []
            pair.split(",").map do |range|
                ids = range.split("-")
                pair_array << (ids[0].to_i..ids[1].to_i).to_a
            end
            @pairs << pair_array
        end
    end
end

class Pair
    attr_accessor :range1, :range2
    @@contained_pairs = 0
    def initialize(pair_array)
        @range1 = pair_array[0]
        @range2 = pair_array[1]
    end

    def contain?
        (@range1 - @range2).empty? || (@range2 - @range1).empty? ? true : false
    end

    def self.contained_pairs
        @@contained_pairs
    end

    def add_to_contained_pairs_sum_if_arrays_contain_each_other
        @@contained_pairs += 1 if self.contain?
    end
    
end