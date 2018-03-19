def create_visitor
  @visitor ||= { :user_name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  page.driver.submit :delete, destroy_user_session_path, {}
end

def create_user
  create_visitor
  delete_user
  @user = FactoryBot.create(:user, @visitor)
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit new_user_registration_path
  fill_in "user_name", :with => @visitor[:user_name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit new_user_session_path
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  page.driver.submit :delete, destroy_user_session_path, {}
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  page.driver.submit :delete, destroy_user_session_path, {}
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

### THEN ###
Then /^I should be signed in$/ do
  expect(page).to have_content 'Log out'
  expect(page).not_to have_content 'Sign up'
  expect(page).not_to have_content 'Sign in'
end

Then /^I should be signed out$/ do
  expect(page).to have_content 'Sign up'
  expect(page).to have_content 'Login'
  expect(page).not_to have_content 'Logout'
end

Then /^I see a successful sign in message$/ do
  expect(page).to have_content 'Signed in successfully.'
end
#
# Then /^I should see a successful sign up message$/ do
#   page.should have_content "Welcome! You have signed up successfully."
# end
#
# Then /^I should see an invalid email message$/ do
#   page.should have_content "Email is invalid"
# end
#
# Then /^I should see a missing password message$/ do
#   page.should have_content "Password can't be blank"
# end
#
# Then /^I should see a missing password confirmation message$/ do
#   page.should have_content "Password doesn't match confirmation"
# end
#
# Then /^I should see a mismatched password message$/ do
#   page.should have_content "Password doesn't match confirmation"
# end
#
# Then /^I should see a signed out message$/ do
#   page.should have_content "Signed out successfully."
# end
#
Then /^I see an invalid login message$/ do
  expect(page).to have_content 'Invalid Email or password.'
end
#
# Then /^I should see an account edited message$/ do
#   page.should have_content "You updated your account successfully."
# end
#
# Then(/^I should see a current password missing message$/) do
#   page.should have_content "Current password can't be blank"
# end
#
# Then /^I should see my name$/ do
#   create_user
#   page.should have_content @user[:name]
# end
