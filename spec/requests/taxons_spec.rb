require 'spec_helper'

feature "Products multi lingual", :js => true do
  stub_authorization!

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

    click_icon :edit
    click_link "fr"
    page.should have_content("Bonjour")

    click_link "es"
    fill_in "Name", :with => "Hola"
    click_button "Update"

    click_icon :edit
    click_link "es"
    page.should have_content("Hola")
  end

  context "edit taxons" do

    background do
      visit spree.new_admin_taxonomy_path

      fill_in "Name", :with => "Hello"
      click_button "Create"

      @taxonomy = Spree::Taxonomy.last

      visit spree.edit_admin_taxonomy_taxon_path(@taxonomy, @taxonomy.root)

      %w(fr en es).each do |locale|
        select locale, :from => "spree_multi_lingual_dropdown"

        suffix = "#{locale.to_sym == I18n.locale ? "" : "_#{locale}"}"

        fill_in "taxon_name#{suffix}", :with => "TAXON - #{locale}"
        fill_in "taxon_description#{suffix}", :with => "TAXON Description - #{locale * 20}"
        fill_in "taxon_permalink#{suffix}", :with => "taxon-#{locale}"
      end

      click_button "Update"
    end

    scenario "admin should be able to edit taxons" do
      visit spree.edit_admin_taxonomy_taxon_path(@taxonomy, @taxonomy.root)

      # verify if the form has correct values
      %w(fr en es).each do |locale|
        select locale, :from => "spree_multi_lingual_dropdown"
        page.should have_content("TAXON - #{locale}")
        page.should have_content("TAXON Description - #{locale * 20}")
      end

      # set local and ensure each page is visitable
      %w(fr en es).each do |locale|
        visit "/#{locale}/t/taxon-#{locale}"
        page.should have_content "TAXON - #{locale}"
      end
    end

    scenario "admin should be able to edit child taxons" do
      @parent = Spree::Taxon.last
      @child = FactoryGirl.create(:taxon, :name => "child", :parent => @parent, :taxonomy => @taxonomy)
      visit spree.edit_admin_taxonomy_taxon_path(@taxonomy, @child)

      # verify if the form has correct values
      %w(fr en es).each do |locale|
        select locale, :from => "spree_multi_lingual_dropdown"
        suffix = "#{locale.to_sym == I18n.locale ? "" : "_#{locale}"}"

        fill_in "taxon_name#{suffix}", :with => "Child - #{locale}"
        fill_in "taxon_description#{suffix}", :with => "Child : #{locale * 20}"
        fill_in "taxon_permalink#{suffix}", :with => "child-#{locale}"
      end

      click_button "Update"

      #ensure each child page is visitable
      %w(fr en es).each do |locale|
        visit "/#{locale}/t/taxon-#{locale}/child-#{locale}"
        page.should have_content "Child - #{locale}"
      end
    end

    scenario "admin should be able to edit parent taxon permalink" do
      @parent = Spree::Taxon.last
      @child = FactoryGirl.create(:taxon, :name => "Sinatra En", :name_fr => "Sinatra Fr", :name_es => "Sinatra Es",
      :permalink_fr => "sinatra-fr", :permalink => "sinatra-en", :permalink_es => "sinatra-es", :parent => @parent, :taxonomy => @taxonomy)
      visit spree.edit_admin_taxonomy_taxon_path(@taxonomy, @parent)

      %w(fr en es).each do |locale|
        select locale, :from => "spree_multi_lingual_dropdown"
        suffix = "#{locale.to_sym == I18n.locale ? "" : "_#{locale}"}"
        fill_in "taxon_permalink#{suffix}", :with => "ruby-#{locale}"
      end


      click_button "Update"

      %w(fr en es).each do |locale|
        visit "/#{locale}/t/ruby-#{locale}/sinatra-#{locale}"
        page.should have_content "Sinatra #{locale.capitalize}"
      end
    end

  end



  scenario "by explicitly setting their locale, user should be redirected to the viewed link with the setted locale", :js => false do
    pending "TODO ! cf locale_controller_decorator#set"

    FactoryGirl.create(:taxon, :name => "Ruby on Rails", :permalink_fr => "ror-fr", :permalink_es => "ror-es", :permalink => "ror", :permalink_en => "ror")

    get "/en/t/ror"
    get "/fr/locale/set", {}, {'HTTP_REFERER' => 'http://example.com/en/t/ror', 'HTTP_HOST' => 'example.com'} #manually set 'HTTP_REFERER' AND 'HTTP_HOST'

    response.should redirect_to("/fr/t/ror-fr")
  end
end
