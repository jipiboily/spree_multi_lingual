require 'spec_helper'

describe Spree::Taxon do
  let(:taxon) { Factory(:taxon, :name => "Ruby on Rails") }
  let(:child) { Factory(:taxon, :name => "Sinatra", :parent => taxon)}

  before { Rails.application.config.i18n.fallbacks = true }

  describe "#set_permalink" do
    it "should return default name if fallback is true and no parents" do
      taxon.permalink.should == "ruby-on-rails"
      taxon.permalink_fr.should == "ruby-on-rails"
      taxon.permalink_es.should == "ruby-on-rails"
      taxon.permalink_en.should == "ruby-on-rails"
    end

    context "when child taxon" do
      before { taxon.update_attributes!(:permalink_fr => "ruby-on-rails-fr", :permalink_fr => "ruby-on-rails-fr", :permalink_es => "ruby-on-rails-es") }

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
    end
  end
end