module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/login'
    fill_in I18n.t('email'), :with => user.email
    fill_in I18n.t('password'), :with => 'secret'
    click_button I18n.t('login')
  end

end

RSpec.configure do |c|
  c.include AuthenticationHelpers, :type => :request
end

