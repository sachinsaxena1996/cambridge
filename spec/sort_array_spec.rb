require './sort_array'
describe SortArray do
	describe 'sort_arr method' do
			it "sorts the array in ascending order" do
				arr = [2, 100, 10, 4, 1 , 6]
				new_array = SortArray.new(arr)
				returned_array = new_array.sort_arr
				expect(returned_array).to eq arr.sort
		end
	end
end