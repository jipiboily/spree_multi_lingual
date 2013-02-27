# Tempory fix https://github.com/svenfuchs/globalize3/issues/128
Globalize::ActiveRecord::Translation.class_eval do
  attr_accessible :locale
end