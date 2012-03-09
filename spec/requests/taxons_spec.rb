require 'spec_helper'

feature "Products multi lingual", :js => true do
  background do
    I18n.stub(:available_locales).and_return [:en, :fr, :es]
  end

  scenario "admin should be able to create taxonomy" do
    visit spree.new_admin_taxonomy_path

    fill_in "Name", :with => "Hello"
    click_button "Create"

    page.should have_content("Hello")

    click_link "fr"
    fill_in "Name", :with => "Bonjour"
    click_button "Update"

    click_link "Edit"
    click_link "fr"
    page.should have_content("Bonjour")

    click_link "es"
    fill_in "Name", :with => "Hola"
    click_button "Update"

    click_link "Edit"
    click_link "es"
    page.should have_content("Hola")
  end

  scenario "admin should be able to edit taxons" do
    visit spree.new_admin_taxonomy_path

    fill_in "Name", :with => "Hello"
    click_button "Create"

    taxonomy = Spree::Taxonomy.last

    visit spree.edit_admin_taxonomy_taxon_path(taxonomy, taxonomy.root)

    %w(fr en es).each do |locale|
      select locale, :from => "spree_multi_lingual_dropdown"

      suffix = "#{locale == "en" ? "" : "_#{locale}"}"

      fill_in "taxon_name#{suffix}", :with => "TAXON - #{locale}"
      fill_in "taxon_description#{suffix}", :with => "TAXON Description - #{locale * 20}"
      fill_in "taxon_permalink#{suffix}", :with => "taxon-#{locale}"
    end

    click_button "Update"

    visit spree.edit_admin_taxonomy_taxon_path(taxonomy, taxonomy.root)
    %w(fr en es).each do |locale|
      select locale, :from => "spree_multi_lingual_dropdown"
      page.should have_content("TAXON - #{locale}")
      page.should have_content("TAXON Description - #{locale * 20}")
      visit "/t/taxon-#{locale}"
      save_and_open_page
      page.should have_content "Spree"
    end

  end
end
