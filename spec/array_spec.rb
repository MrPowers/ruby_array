require_relative "../array.rb"

describe MyArray do
	let(:a1) { MyArray.new([1, 2, 3, 4]) }
	let(:a2) { MyArray.new }
	let(:a3) { MyArray.new([1, 3, 5, 9]) }
	let(:a4) { MyArray.new([1, 2, 3]) }
	let(:a5) { MyArray.new([6, 7, 8, 9]) }

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

	context "#each" do
		it "iterates over an array and adds number times two to another array" do
			a1.each{ |x| a2.push(x * 2) }		
			a2.should eq [2, 4, 6, 8]
		end
	end
	
	context "#map" do
		it "iterates over array and creates new array" do
			a1.map{ |x| x * 2 }.should eq [2, 4, 6, 8]
			a1.should eq [1, 2, 3, 4]
		end
	end

	context "#compact" do
		it "removes nil elements from an array" do
			[1, nil, nil, 6, nil].compact.should eq [1, 6]
		end
	end

	context "#count" do
		it "returns number of elements in an array" do
			a3.count{|x| x}.should eq 4
		end

		it "counts 2 elements that are less than 5 in [1, 3, 5, 9]" do
			a3.count{ |x| x < 5 }.should eq 2
		end
	end

	context "#map!" do
		it "iterates over array and mutates it" do
			a4.map!{ |x| x * 2}.should eq [2, 4, 6]
			a4.should eq [2, 4, 6]
		end
	end

	context "#reverse" do
		it "reverses [6, 7, 8, 9]" do
			a5.reverse.should eq [9, 8, 7, 6]	
		end
	end

	context "#select" do
		it "selects even elements from [6, 7, 8, 9]" do
			a5.select { |x| x.even? }.should eq [6, 8]
		end
	end

	context "#shift" do
		it "returns first element of array and deletes it from array" do
			a5.shift.should eq 6
			a5.should eq [7, 8, 9]
		end
	end
end