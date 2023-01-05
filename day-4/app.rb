require './day-4'
require './day-4-input'

id_pairs = IDPairsInput.new(ID_PAIRS)

id_pairs.pairs.each do |pair|
    pair = Pair.new(pair)
    pair.add_to_contained_pairs_sum_if_arrays_contain_each_other
end

puts "The number of pairs containing each other is: #{Pair.contained_pairs}"