require 'spec_helper'

module Spree
  describe OrderMailer do
    let(:order) { FactoryGirl.create(:order, :locale => :fr) }
    let(:mail) { ActionMailer::Base.deliveries.last }

    it "should use i18n email template" do
      OrderMailer.confirm_email(order, true).deliver
      mail.encoded.should include("Merci")
    end
  end
end