require './array_map'
describe ArrayMap do
	describe 'my_map method' do
			it "passes each element of array to the block returns array resulted from block" do
				arr = [2, 100, 10, 4]
				new_array = ArrayMap.new(arr)
				returned_array = new_array.my_map {|element|
						element + 1
				}
				expect(returned_array).to eq arr.map {|element| element + 1 }
		end
	end
end