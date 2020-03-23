# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    length.times do
      yield (self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    length.times do
      yield(self[i], i)
      i += 1
    end
  end
  
  def my_select
    if block_given?
       arr_ret=[]
       i=0
       self.length.times do
         arr_ret.push(self[i]) if yield(self[i])
         puts arr_ret.to_s + " " + i.to_s
         i+=1
       end
       arr_ret
    end
  end

end

# control
array_ctl = [9, 3, 5, 8, 1]
array_ctl.my_each { |i| puts i }
array_ctl.my_each_with_index { |item, i| puts item.to_s + ' ' + i.to_s }
array_str=['hola', '3244', 'adios', 'valida']
puts array_str.my_select {|i| i=~/^[a-zA-Z]*$/}
