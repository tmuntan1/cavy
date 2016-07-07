module AuthMacros
  def log_in(role, attributes = {})
    @_current_user = FactoryGirl.create(:cavy_user, role: role)
    visit admin_signin_path(locale: :en)
    fill_in 'user-email', with: @_current_user.email
    fill_in 'user-password', with: @_current_user.password
    click_button 'sign-in'
  end

  def log_in_rack(role, attributes={})
    @user = FactoryGirl.create(:cavy_user, password: 'secret', password_confirmation: 'secret')
    @session = {email: @user.email, password: 'secret'}
    post admin_create_session_path(locale: :en), @session
  end

  def log_out
    Capybara.reset_sessions!
  end

  def current_user
    @_current_user
  end
end