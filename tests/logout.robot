*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com
${PASSWORD}     newpass123
${FILENAME}     username.txt

*** Test Cases ***
Log Out Test

    # Login process to test log out
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    ${USERNAME}    Get File    ${FILENAME}
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Element Is Visible    id=logout2
    Log    "Login has been succesfully: ${USERNAME}"

    # Log out proccess
    Sleep    1s
    Click Element    id=logout2
    Wait Until Element Is Visible    id=login2

    Log    "Log out has been successfully"
    Close Browser