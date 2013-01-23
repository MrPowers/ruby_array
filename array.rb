class MyArray < Array
	def monkey_patched?
		true
	end

	def any?(&block)
		self.each do |element|
			return true if yield element
		end
		false
	end

	def all?(&block)
		self.each do |element|
			return false if yield element
		end
		true
	end

	def each(&block)
		counter = 0
		while counter < self.length
			yield self[counter]
			counter += 1
		end
	end

	def map(&block)
		counter = 0
		result = []
		while counter < self.length
			result.push(yield self[counter])
			counter += 1
		end
		result
	end

	def map!(&block)
		counter = 0
		result = []
		while counter < self.length
			result.push(yield self[counter])
			counter += 1
		end
		result
		self.replace(result)
	end

	def compact
		result = []
		self.each do |element|
			result.push(element) unless element.nil?
		end
		result
	end

	def count(&block)
		counter = 0
		self.each do |element|
			counter += 1 if yield element
		end
		counter
	end

	def reverse
		result = []
		counter = 0
		while counter < self.length
			result[self.length - 1 - counter] = self[counter]
			counter += 1			
		end
		result
	end

	def select(&block)
		result = []
		self.each do |element|
			result.push(element) if yield element
		end
		result
	end

	def shift
		value = self[0]
		self.replace(self[1..-1])
		value
	end
end

# a1 = [1, 2, 3, 4]
# p a1.monkey_patched? == true

# p a1.any?{ |x| x == 50 } == false

# a2 = []
# a1.each{ |x| a2.push(x * 2) }
# p a2 == [2, 4, 6, 8]

# p a1.map{ |x| x * 2 } == [2, 4, 6, 8]
# p a1 == [1, 2, 3, 4]

# p [1, nil, nil, 6, nil].compact == [1, 6]

# a3 = [1, 3, 5, 9]
# p a3.count{|x| x} == 4

# p a3.count{ |x| x < 5 } == 2

# a4 = [1, 2, 3] 
# p a4.map!{ |x| x * 2} == [2, 4, 6]
# p a4 == [2, 4, 6]

# a5 = [6, 7, 8, 9]
# p a5.reverse == [9, 8, 7, 6]

# p a5.select { |x| x.even? } == [6, 8]

# p a5.shift == 6
# p a5 == [7, 8, 9]

