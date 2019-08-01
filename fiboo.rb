#fibonacci other than recursive 
def solution n
	get_num = Hash.new do |hash, key|
	 if key <= 1
	   hash[key] = key
	 else
	   hash[key] = hash[key - 1] + hash[key - 2]
	 end
	end
	if get_num[n].to_s.length < 7
	   get_num[n]
	else 
	   get_num[n].to_s[-6..-1].to_i
	end   
end 
solution 21

 def solution(input1,input2)
 	input1 = input1.to_i
 	input = 1 if input2.to_s.downcase == "one"
 	input = 2 if input2.to_s.downcase == "two"
 	input = 3 if input2.to_s.downcase == "three"
 	input = 4 if input2.to_s.downcase == "four"
 	input = 5 if input2.to_s.downcase == "five"
 	return input1 * input
 end
