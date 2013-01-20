require_relative "../array.rb"

describe Array do
	let (:a1) { Array.new([1, 2, 3, 4]) }

	context "#monkey_patched?" do
		it "uses the monkey_patched version of the Array class" do
			a1.monkey_patched?.should be_true
		end
	end

	context "#any?" do
		it "1 is in [1, 2, 3, 4]" do
			a1.any?{ |x| x == 1 }.should be_true
		end
	end
end