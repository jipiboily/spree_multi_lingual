require 'spec_helper'

describe Spree::Product do
  context "using comma as a delimiter" do
    it "can assign price attribute" do
      product = Spree::Product.new
      product.price = "9,99"
      product.price.to_f.should == 9.99
    end

    it "can mass assign a price during creation" do
      product = Spree::Product.new(:name => "The Product", :price => "9,99")
      product.save!
    end

    it "can mass assign a price during update" do
      product = Spree::Product.create!(:name => "The Product", :price => 19.99)
      product.price.should == 19.99
      product.update_attributes(:price => "9,99")
      product.price.should == 9.99
    end

    [:cost_price, :weight, :height, :width, :depth].each do |attribute|
      it "can assign the #{attribute} attribute" do
        product = Spree::Product.new
        product.send("#{attribute}=", "9,99")
        product.send("#{attribute}").to_f.should == 9.99
      end
    end
  end
end
