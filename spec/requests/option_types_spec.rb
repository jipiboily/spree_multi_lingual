require 'spec_helper'

feature "OptionType multi lingual", :js => true do
  background do
    visit spree.admin_option_types_path
  end

  scenario "create successfully" do
    click_link "new_option_type_link"
    page.should have_button("Create")

    select "fr", :from => "spree_multi_lingual_dropdown"

    fill_in "option_type_name", :with => "size"
    fill_in "option_type_presentation_fr", :with => "Taille"

    select "en", :from => "spree_multi_lingual_dropdown"
    fill_in "option_type_presentation", :with => "Size"

    click_button "Create"
    page.should have_content("successfully created!")
  end
end