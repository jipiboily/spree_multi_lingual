require 'spec_helper'

feature "Products multi lingual", :js => true do
  stub_authorization!

  background do
    @product = FactoryGirl.create(:product, :name => "ror mug", :price => 30)
  end

  scenario "admin should be able to edit product page i18n" do
    visit spree.admin_products_path
    click_icon :edit

    # filling some content in name, meta description, keywords
    %w(fr en es).each do |locale|
      select locale, :from => "spree_multi_lingual_dropdown"
      # en is the default language so the selector doesnt apply
      suffix = "#{locale.to_sym == I18n.locale ? "" : "_#{locale}"}"

      fill_in "product_name#{suffix}", :with => "ror mug #{locale}"
      fill_in "product_description#{suffix}", :with => "foo bar #{locale}"
      fill_in "product_meta_description#{suffix}", :with => "meta #{locale} desc"
      fill_in "product_meta_keywords#{suffix}", :with => "#{locale} keywords"
    end
    click_button "Update"

    # Checking if each language have been corectly updated
    %w(fr en es).each do |locale|
      suffix = "#{locale.to_sym == I18n.locale ? "" : "_#{locale}"}"
      select locale, :from => "spree_multi_lingual_dropdown"
      first("input#product_name#{suffix}")[:value].should == "ror mug #{locale}"
      first("input#product_meta_description#{suffix}")[:value].should ==  "meta #{locale} desc"
      first("input#product_meta_keywords#{suffix}")[:value].should == "#{locale} keywords"
    end
  end

  scenario "product permalink should be editable" do
    visit spree.admin_products_path
    click_icon :edit

    %w(fr en es).each do |locale|
      select locale, :from => "spree_multi_lingual_dropdown"
      suffix = "#{locale.to_sym == I18n.locale ? "" : "_#{locale}"}"
      fill_in "product_permalink#{suffix}", :with => "ror-mug-#{locale}"
      fill_in "product_name#{suffix}", :with => "ror mug #{locale}"
    end
    click_button "Update"

    %w(fr en es).each do |locale|
      visit "/#{locale}/products/ror-mug-#{locale}"
      page.should have_content "ror mug #{locale}"
    end
  end
end
