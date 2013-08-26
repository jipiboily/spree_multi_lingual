require 'spec_helper'

feature "admin products" do
  stub_authorization!

  let!(:product) { FactoryGirl.create(:product) }

  it "displays price in correct format" do
    pending 'this is handled in spree_core Spree::Variant#parse_price'
    visit spree.edit_admin_product_path(product)
    fill_in "product_price", :with => "9,99"
    # No clue WHY we have to set this, it's just necessary. Ugh.
    fill_in "product_cost_price", :with => "10"
    click_button I18n.t("update")
    Nokogiri::HTML(page.body).css("input#product_price")[0]["value"].strip.should == "9,99"
    I18n.locale = :en
  end
end
