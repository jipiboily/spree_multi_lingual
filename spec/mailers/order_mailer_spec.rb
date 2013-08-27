require 'spec_helper'
require 'email_spec'
module Spree

  describe OrderMailer do
    include EmailSpec::Helpers
    include EmailSpec::Matchers

    let(:order) { FactoryGirl.create(:order, :locale => :fr) }
    let(:mail) { ActionMailer::Base.deliveries.last }

    it "should use i18n email template" do
      mail = OrderMailer.confirm_email(order, true)
      mail.body.should include("Merci")
    end
  end
end