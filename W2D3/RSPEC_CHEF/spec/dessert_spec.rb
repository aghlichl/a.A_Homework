require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ramsey") }
  let(:brownie) { Dessert.new("brownie", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end 

    it "sets a quantity" do 
      expect(brownie.type).to eq(100)
    end 

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect( Dessert.new("cake", "tons", chef) ).to raise_error(ArgumentError)
    end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      brownie.add_ingredient("chocalate")
      expect(brownie.ingredients).to include('chocolate')
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    ingredients = ['chocolate', 'flour', 'egg', 'sugar', 'butter']

    ingredients.each do |ingredients|
      brownie.add_ingredient(ingredients)
    end 
    expect(brownie.ingredients).to eq(ingredients)
    brownie.mix!
    expect(brownie.ingredients).not_to eq(ingredients)
    expect(brownie.ingredients.sort).to eq(ingredients.sort)
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(20)
      expect(brownie.quantity)to eq(80)
    end
    it "raises an error if the amount is greater than the quantity" do 
      expect(brownie.eat(120)).to raise_error("Not enough left")
    end 
  end

  describe "#serve" do
    allow(chef).to receive(:titleize).and_return("Chef Ramsey the Great Baker")
    expect(brownie.serve).to eq("Chef Ramsey the Great Baker has made 100 brownies!")
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
