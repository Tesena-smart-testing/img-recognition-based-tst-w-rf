*** Test Cases ***
Test Case 1: About page nav works
    Given I am on the "Home" page
    When I click on the "About" link
    Then I should be on the "About" page

Test Case 2: Contact page nav works
    Given I am on the "Home" page
    When I click on the "Contact" link
    Then I should be on the "Contact" page

Test Case 3: Home page nav works
    Given I am on the "About" page
    When I click on the "Home" link
    Then I should be on the home page

*** Keywords ***
I am on the ${page} page
    Log    I'm on the ${page} page

I click on the ${link} link
    Log    I'm clicking now on the ${link} link

I should be on the ${page} page
    Log    Checking whether I'm on right page: ${page}