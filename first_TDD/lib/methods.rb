class Array
  def my_uniq
    uniq_arr = []
    self.each do |el|
      uniq_arr << el unless uniq_arr.include?(el)
    end

    uniq_arr
  end

  def two_sum
    pairs = []
    (0...self.length-1).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        pairs << [idx1,idx2] if self[idx1] + self[idx2] == 0
      end
    end
    pairs
  end
end

def my_transpose(arr)
  transposed = Array.new(arr.length) { [] }
  arr.each do |sub_arr|
    sub_arr.each_with_index do |el, idx|
      transposed[idx] << el
    end
  end
  transposed
end

def stock_picker(stock_prices)
  raise "Not a valid argument, need an Array" unless stock_prices.is_a?(Array)

  profit_pairs = [0,1]

  (0...(stock_prices.length - 1)).each do |price1|
    ((price1 + 1)...stock_prices.length).each do |price2|
      current_max = stock_prices[profit_pairs[1]]
      current_min =  stock_prices[profit_pairs[0]]
      if stock_prices[price2] - stock_prices[price1] > (current_max - current_min)
        profit_pairs = [price1, price2]
      end
    end
  end

  profit_pairs
end
