require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is a valid product" do
      @category = Category.new(name: "Tests")
      @product = Product.new(name: nil, price: 30.00, quantity: 20, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "it has a valid name" do
      @category = Category.new(name: "Tests")
      @product = Product.new(name: nil, price: 30.00, quantity: 20, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "has a current price" do
      @category = Category.new(name: "Tests")
      @product = Product.new(name: "Shirt", price: nil, quantity: 20, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "has a valid quantity" do
      @category = Category.new(name: "Tests")
      @product = Product.new(name: "Shirt", price: 20.99, quantity: nil, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "has a valid category" do
      @category = Category.new(name: "Tests")
      @product = Product.new(name: "Shirt", price: 20.99, quantity: 5, category: nil)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
