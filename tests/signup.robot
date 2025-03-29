*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary
Library    String  
Library    Collections  

*** Variables ***
${URL}          https://www.demoblaze.com
${PASSWORD}     newpass123
${FILENAME}     username.txt  # File for saving usernames

*** Test Cases ***
Sign Up Test
    Open Browser    ${URL}    chrome
    Maximize Browser Window

    # Random username
    ${RANDOM}    Generate Random String    5    [LETTERS]
    ${USERNAME}    Set Variable    user${RANDOM}

    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']

    # Waiting for Alert and receive
    Wait Until Keyword Succeeds    3x    2s    Handle Alert    ACCEPT
    Log    "Registration has been successfully: ${USERNAME}"

    # Saving username to the username.txt
    Create File    ${FILENAME}    ${USERNAME}

    Close Browser