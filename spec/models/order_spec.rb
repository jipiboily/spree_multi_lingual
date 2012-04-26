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
  end
end