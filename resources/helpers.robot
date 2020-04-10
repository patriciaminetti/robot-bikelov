*** Keywords ***
Convert to Json
    [Arguments]     ${target}  

    ${result}=       evaluate        json.loads($target)     json          
    [return]        ${result}