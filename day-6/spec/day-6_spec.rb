require_relative '../day-6'
require_relative '../day-6-input'

describe "CommsSignal" do
    signal = CommsSignal.new(TEST_SIGNAL)
    signal1 = CommsSignal.new("bvwb")
    signal2 = CommsSignal.new("abcd")

    context "#all_four_chars_unique?" do
        it "returns false if the four consequent characters are not unique" do
            expect(signal1.all_four_chars_unique?).to be(false)
        end

        it "returns true if the four consequent characters are unique" do
            expect(signal2.all_four_chars_unique?).to be(true)
        end
    end

    context "#check_signal_for_four_unique_chars" do
        it "removes the first character and adds the next to the checked four if not unique" do
            signal.check_signal_for_four_unique_chars
            expect(signal.current_four_chars).to eq(["v", "w", "b", "j"])
        end

        it "returns true when all 4 characters unique" do
            expect(signal.check_signal_for_four_unique_chars).to eq(true)
        end
    end

    context "#return_signal_marker" do
        it "returns the character that marks the beginning of the correct signal" do
            expect(signal.return_signal_marker).to eq(5)
        end
    end
end