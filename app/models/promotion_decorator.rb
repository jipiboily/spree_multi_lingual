module Spree
  Promotion.class_eval do
    translates :name, :description
  end
end