module FlattenArray
  def self.flatten(nested_arr)
    nested_arr.flatten.select { |e| !e.nil? }
  end
end

p FlattenArray.flatten([])
p FlattenArray.flatten([0, 1, 2])
p FlattenArray.flatten([[[]]])
p FlattenArray.flatten([1, [2, 3, 4, 5, 6, 7], 8])
p FlattenArray.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
p FlattenArray.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8])
p FlattenArray.flatten([nil, nil, 3])
p FlattenArray.flatten([1, nil, nil, 4])
p FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
p FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil])