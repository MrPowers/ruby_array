class Array
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
end

a1 = [1, 2, 3, 4]
p a1.monkey_patched? == true

p a1.any?{ |x| x == 50 } == false

a2 = []
a1.each{ |x| a2.push(x * 2) }
p a2 == [2, 4, 6, 8]

