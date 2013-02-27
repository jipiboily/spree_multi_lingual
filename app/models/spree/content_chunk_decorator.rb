module Spree
  ContentChunk.class_eval do
    translates :title, :body
  end
end