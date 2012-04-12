require 'spec_helper'

feature "Products multi lingual", :js => true do
  background do
    I18n.stub(:available_locales).and_return [:en, :fr, :es]
    @product = Factory(:product, :name => "ror mug", :price => 30)
    sign_in_as! Factory(:admin_user)
  end

  scenario "admin should be able to edit product page i18n" do
    visit spree.admin_products_path
    click_link "Edit"
    # filling some content in name, meta description, keywords
    %w(fr en es).each do |locale|
      select locale, :from => "spree_multi_lingual_dropdown"
      # en is the default language so the selector doesnt apply
      suffix = "#{locale == "en" ? "" : "_#{locale}"}"

      fill_in "product_name#{suffix}", :with => "ror mug #{locale}"
      fill_in "product_description#{suffix}", :with => "foo bar #{locale}"
      fill_in "product_meta_description#{suffix}", :with => "meta #{locale} desc"
      fill_in "product_meta_keywords#{suffix}", :with => "#{locale} keywords"
    end
    click_button "Update"

    # Checking if each language have been corectly updated
    %w(fr en es).each do |locale|
      select locale, :from => "spree_multi_lingual_dropdown"
      page.should have_content("ror mug #{locale}")
      page.should have_content("meta #{locale} desc")
      page.should have_content("#{locale} keywords")
    end
  end

  scenario "product permalink should be editable" do
    visit spree.admin_products_path
    click_link "Edit"

    %w(fr en es).each do |locale|
      select locale, :from => "spree_multi_lingual_dropdown"
      suffix = "#{locale == "en" ? "" : "_#{locale}"}"
      fill_in "product_permalink#{suffix}", :with => "ror-mug-#{locale}"
      fill_in "product_name#{suffix}", :with => "ror mug #{locale}"
    end
    click_button "Update"

    %w(fr en es).each do |locale|
      visit "/#{locale}/products/ror-mug-#{locale}"
      page.should have_content "ror mug #{locale}"
    end
    # reset locale to en to avoid colision with other tests
    visit "/en/products/ror-mug-en"
  end
end
