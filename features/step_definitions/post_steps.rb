def create_user
  create_visitor
  delete_user
  @user = FactoryBot.create(:user, @visitor)
end

def sign_in
  visit new_user_session_path
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end

def create_post
  @post = FactoryBot.build :post
  fill_in "post_title", with: @post.title
  attach_file("post_image", File.join(Rails.root, 'public', 'apple-touch-icon.png'))
  click_button "submit"
end

Given /^I sign in successfully$/ do
  create_user
  sign_in
end

### WHEN ###
When /^I visit create new post page$/ do
  visit new_post_path
end

When /^I submit with valid credentials$/ do
  create_post
end

When /^I visit home page$/ do
  visit root_path
end

### THEN ###
Then /^I should see the successfully message$/ do
  expect(page).to have_content 'Post was successfully created.'
end

Then /^It should be created$/ do
  expect(page).to have_content 'Cancel'
  expect(page).to have_content 'Edit Post'
end

Then /^I should see posts$/ do
  expect(page).to have_field :search
end
