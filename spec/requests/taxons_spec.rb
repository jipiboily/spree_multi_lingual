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
end
