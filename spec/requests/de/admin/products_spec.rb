require 'spec_helper'
describe "admin products" do
  before do
    sign_in_as!(Factory(:admin_user))
  end

  let!(:product) { Factory(:product) }

  it "displays price in correct format" do
    visit spree.edit_admin_product_path(product)
    fill_in "product_price", :with => "9,99"
    # No clue WHY we have to set this, it's just necessary. Ugh.
    fill_in "product_cost_price", :with => "10"
    click_button I18n.t("update")
    Nokogiri::HTML(page.body).css("input#product_price")[0]["value"].strip.should == "9,99"
  end
end
