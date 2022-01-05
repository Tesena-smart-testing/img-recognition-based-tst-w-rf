*** Settings ***
# Exercise: Define Documentation and Libraries
      

*** Variables ***
# Exercise: Define variables needed to use Selenium in this test. 
# Hint: You can use 03_Libraries exercise to help you.

# Exercise: Define variables and image directory to use Sikuli in this test.

*** Test Cases ***
Outlook Test
    # Exercise: Write the test with test steps provided below. 
    # Hint: You can use 03_Libraries exercise to help you with the first two test steps.  

    # Test Steps:
        # Go to amazon website    
        # Use search button to find a word "kindle" 
        # Click on the first search result image
        # In search result detail click on "Share via e-mail" icon
        # Fill email adress to send an email
        # Send email    

*** Keywords ***
Sikuli Image Path
    Add Image Path  ${IMAGE_DIR}


    
   