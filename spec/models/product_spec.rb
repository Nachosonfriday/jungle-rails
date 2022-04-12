require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create(name: "dishes")
    end
    

    it "saves a product" do 
      @product = @category.products.new(name: "cup", price: 140, quantity: 12, category_id: 1)      
      expect(@product).to be_valid
    end

    it "is not valid with no name" do 
      @product = @category.products.new(name: nil, price: 140, quantity: 12, category_id: 2)
      expect(@product).to_not be_valid
    end

    it "is not valid with no price" do 
      @product = @category.products.new(name: "cup", quantity: 12, category_id: 3)
      expect(@product).to_not be_valid
    end

    it "is not valid with no quantity" do
      @product = @category.products.new(name: "cup", price: 140, category_id: 4)
      expect(@product).to_not be_valid
    end

    it "is not valid with no category" do
      @product = @category.products.new(name: "cup", price: 140, quantity: 12)
      @product.category = nil
      expect(@product).to_not be_valid
    end

  end
end
