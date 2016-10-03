class SortArray < Array
	def new
		super
	end

	def sort_arr
		copy = self.dup #create a copy of array to be sorted
		element_index = 0
		while element_index < copy.length do
			next_element_index = element_index + 1
			best = element_index #lets suppose the first element is smallest
			while next_element_index < copy.length do
				best = next_element_index if ((copy[next_element_index] <=> copy[best])  < 0)
				next_element_index += 1
			end
			copy[element_index], copy[best] = copy[best], copy[element_index] #parallel assignment in ruby
			element_index += 1
		end
		copy
	end
end

arr = SortArray.new([44,66,1000,22,5,88])
sorted_array = arr.sort_arr
puts sorted_array
