require 'spec_helper'

describe Spree::Taxonomy do
  let(:taxonomy) { Factory(:taxonomy, :name => "Man") }
  let(:root) { taxonomy.root }

  before { Rails.application.config.i18n.fallbacks = true }

  it "root taxon should set translated name" do
    root.name.should == "Man"
    root.name_fr.should == "Man" #I18n fallback
    taxonomy.update_attributes(:name_fr => "Homme")
    root.name.should == "Man"
    root.name_fr.should == "Homme"
  end

  describe "#attrs_translations_for" do
    it "returns an hash of attributes" do
      taxonomy.update_attributes(:name_fr => "Homme")
      taxonomy.attrs_translations_for(:name).should == {:name_en => "Man", :name_fr => "Homme"}
    end
  end

  describe "#translations_for" do
    it "returns an array of attributes" do
      taxonomy.update_attributes(:name_fr => "Homme")
      taxonomy.translations_for(:name).should == [{ :name => "Man", :locale => :en }, { :name => "Homme", :locale => :fr }]
    end
  end

end