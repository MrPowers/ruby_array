class Array
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
end