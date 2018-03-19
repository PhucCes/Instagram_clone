Feature: Home page

Scenario: Viewing application's home page
Given there's a post titled "My first"
When I am on the homepage
Then I should see the "My first" post
