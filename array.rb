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