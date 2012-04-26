require 'spec_helper'

module Spree
  describe Order do
    describe "#finalize!" do
      it "sets order locale" do
        I18n.locale = :fr
        order = Factory(:order)
        order.finalize!
        order.locale.should == :fr
        I18n.locale = nil
      end
    end

    describe "#locale" do
      it "should be stored as str" do
         order = Factory(:order, :locale => :fr)
         Order.find_by_locale("fr").should == order
      end
    end

  end
end