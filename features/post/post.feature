Feature: Index
  In order to see all post
  A user
  Should ale to see posts

    Scenario: I visit create new post
      Given I sign in successfully
      When I visit create new post page
        And I submit with valid credentials
      Then I should see the successfully message
        And It should be created

    Scenario: I visit home page
      Given I sign in successfully
      When I visit home page
      Then I should see posts
