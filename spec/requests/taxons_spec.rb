require 'spec_helper'

feature "Products multi lingual", :js => true do
  background do
    I18n.stub(:available_locales).and_return [:en, :fr, :es]
  end

  scenario "admin should be create taxonomy" do
    puts I18n.locale
    visit spree.new_admin_taxonomy_path
    fill_in "Name", :with => "Hello"
    fill_in "Name Fr", :with => "Bonjour"
    fill_in "Name Es", :with => "Hola"

    click_button "Create"
    page.should have_content("Hello")
    click_link "fr"
    page.should have_content("Bonjour")
    click_link "es"
    page.should have_content("Hola")
  end
end
