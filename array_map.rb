class ArrayMap < Array
	def new
		super
	end

	def my_map(&block)
		result = []
		if !block.nil?
			each { |element|
				result << block.call(element)
			}
		end
		result
	end
end

new_array = ArrayMap.new([2, 100, 10, 4])
new_array = new_array.my_map {|element|
	element + 1
}
p new_array
