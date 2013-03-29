require 'spec_helper'

feature "OptionType multi lingual", :js => true do
  stub_authorization!

  background do
    visit spree.admin_option_types_path
  end

  scenario "update successfully" do
    click_link "new_option_type_link"
    page.should have_button("Create")

    fill_in "option_type_presentation", :with => "Size"
    fill_in "option_type_name", :with => "size"

    click_button "Create"

    select "fr", :from => "spree_multi_lingual_dropdown"

    fill_in "option_type_presentation_fr", :with => "Taille"

    click_button "Update"
    page.should have_content("successfully updated!")
    click_icon :edit

    first('#option_type_presentation')[:value].should == "Size"
    select "fr", :from => "spree_multi_lingual_dropdown"
    first('#option_type_presentation_fr')[:value].should == "Taille"
  end
end