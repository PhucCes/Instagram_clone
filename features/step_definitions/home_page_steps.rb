Given(/^there's a post titled "(.*?)"$/) do |title|
  FactoryBot.create(:post, title: title)

  user = FactoryBot.create :user
  visit '#/users/sign_in'
  fill_in 'email', :with => user.email
  fill_in 'password', :with => user.password
  click_button 'Sign in'
end

When(/^I am on the homepage$/) do
  current_user = FactoryBot.create(:user)
  visit '/'
end

Then(/^I should see the "(.*?)" post$/) do |title|
  @post = Post.find_by_title(title)
  expect(page).to have_content(@post.title)
end
