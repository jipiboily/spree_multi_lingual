require 'spec_helper'

describe Spree::Taxon do
  let(:taxon) { FactoryGirl.create(:taxon, :name => "Ruby on Rails") }
  let(:child) { FactoryGirl.create(:taxon, :name => "Sinatra", :parent => taxon) }

  describe "#set_permalink" do
    it "should return default name if fallback is true and no parents" do
      taxon.permalink.should == "ruby-on-rails"
      taxon.permalink_fr.should == "ruby-on-rails"
      taxon.permalink_es.should == "ruby-on-rails"
      taxon.permalink_en.should == "ruby-on-rails"
    end

    context "when child taxon" do
      before { taxon.update_attributes!(:permalink => "ruby-on-rails", :permalink_fr => "ruby-on-rails-fr", :permalink_es => "ruby-on-rails-es") }

      it "returns translated parents permalink" do
        child.permalink.should == "ruby-on-rails/sinatra"
        child.permalink_en.should == "ruby-on-rails/sinatra"
        child.permalink_fr.should == "ruby-on-rails-fr/sinatra"
        child.permalink_es.should == "ruby-on-rails-es/sinatra"
      end

      it "keeps translated parents permalink on update" do
        child.update_attributes!({:permalink_fr => "sinatra-fr", :permalink_es => "sinatra-es", :permalink => "sinatra"})
        child.permalink.should == "ruby-on-rails/sinatra"
        child.permalink_en.should == "ruby-on-rails/sinatra"
        child.permalink_fr.should == "ruby-on-rails-fr/sinatra-fr"
        child.permalink_es.should == "ruby-on-rails-es/sinatra-es"
      end

      it "should rename child taxons when parent is updated" do
        child.update_attributes!({:permalink_fr => "sinatra-fr", :permalink_es => "sinatra-es", :permalink => "sinatra"})
        taxon.update_attributes!({:permalink_es => "ruby-es", :permalink_fr => "ruby-fr", :permalink => "ruby"})
        taxon.reload

        taxon.descendants.should == [child]

        taxon.descendants.each do |descendant|
          descendant.reload
          descendant.set_permalink
          descendant.save!
        end

        rchild = Spree::Taxon.find(child.id)
        rchild.permalink.should == "ruby/sinatra"
        rchild.permalink_en.should == "ruby/sinatra"
        rchild.permalink_fr.should == "ruby-fr/sinatra-fr"
        rchild.permalink_es.should == "ruby-es/sinatra-es"
      end
    end
  end
end