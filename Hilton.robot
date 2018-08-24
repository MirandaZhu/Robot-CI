*** Settings ***
Library           Selenium2Library

*** Variables ***
${username}       001072046
${password}       Windows10
${Browser}        Chrome
${SiteUrl}        https://secure3-stg.hilton.com/en/hh/customer/login/index.htm
${Delay}          5s

*** Test Cases ***
Login Success
    Open HiltonPage
    Enter User Name
    Enter Password
    Click Login
    sleep    ${Delay}
    Check ID
    [Teardown]    Close Browser

*** Keywords ***
Open HiltonPage
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Enter User Name
    Input Text    id=username    ${username}

Enter Password
    Input Text    id=password    ${password}

Click Login
    Click element    class=linkBtn

sleep ${Delay}

Check ID
    ${welcome}    get text    id=welcome
    should be equal    ${welcome}    Welcome JOEY
