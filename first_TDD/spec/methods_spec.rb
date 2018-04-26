require 'rspec'
require 'methods'

describe "#my_uniq" do
  it "does NOT call the built in Array #uniq method" do
    arr = [1,2,2]
    expect(arr).not_to receive(:uniq)
    arr.my_uniq
  end

  it "removes duplicates from an array" do
    arr = [1,2,1,3,3]
    expect(arr.my_uniq).to eq(arr.uniq)
  end
end

describe "#two_sum" do
  let(:arr) { [-1, 0, 2, -2, 1] }
  it "returns pairs of indices that sum to 0" do
    expect(arr.two_sum).to include([0,4],[2,3])
  end

  it "should sort smaller index first for each pair" do
    expect(arr.two_sum).to eq([[0,4],[2,3]])
  end
end

describe "#my_transpose" do
  let(:arr) { [[0,1,2],[3,4,5],[6,7,8]] }
  it "converts an Array between row and column orientations" do
    expect(my_transpose(arr)).to eq([[0,3,6],[1,4,7],[2,5,8]])
  end
end

describe "#stock_picker" do
  let(:stock_prices) { [1,5,2,10] }

  context "when an invalid argument type is given" do
    it "raises invalid Argument error" do
      expect{ stock_picker("1,2,3") }.to raise_error("Not a valid argument, need an Array")
    end
  end

  it "buys a stock before selling it" do
    prices = [10,9,6,2]
    expect(stock_picker(prices)).to eq(stock_picker(prices).sort)
  end

  it "outputs pair of days with greatest profit" do
    expect(stock_picker(stock_prices)).to eq([0,3])
  end

end
