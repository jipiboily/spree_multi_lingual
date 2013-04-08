require 'spec_helper'

feature "Promotions multi lingual", :js => true do
  stub_authorization!

  background do
    I18n.stub(:available_locales).and_return [:en, :fr, :es]
  end

  scenario "admin should be able to create promotion" do
    visit spree.new_admin_promotion_path

    fill_in "Name", :with => "Free Shipping"

    select 'fr', :from => 'spree_multi_lingual_dropdown'

    fill_in "promotion_name_fr", :with => "Livraison Gratuite"

    click_button "Create"
    first("input#promotion_name")[:value].should == "Free Shipping"

    select 'fr', :from => 'spree_multi_lingual_dropdown'
    first("input#promotion_name_fr")[:value].should == "Livraison Gratuite"
  end

  scenario 'user should be able to checkout with code' do
    pending
  end

  scenario 'user should be able to checkout with path' do
    pending
  end

end
