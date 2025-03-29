*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com
${PASSWORD}     newpass123
${FILENAME}     username.txt

*** Test Cases ***
Log In Test
    Open Browser    ${URL}    chrome

    # Getting username from file
    ${USERNAME}    Get File    ${FILENAME}
    
    Click Element    id=login2
    Maximize Browser Window
    Wait Until Element Is Visible    id=loginusername
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']

    # Checking
    Wait Until Element Is Visible    id=logout2
    Log    "Login has been succesfully: ${USERNAME}"
    Close Browser