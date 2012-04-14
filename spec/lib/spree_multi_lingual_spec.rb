require 'spec_helper'

describe SpreeMultiLingual do
  describe ".languages=" do
    it "sets available_locales" do
      SpreeMultiLingual.languages = [:en, :fr, :es]
      SpreeMultiLingual.languages.should == [:en, :fr, :es]
      I18n.available_locales.should == [:en, :fr, :es]
    end
  end
end