*** Settings ***
Resource    base.robot
Library     ./lib/mongo.py

*** Keywords ***
## Login
Dado que acesso a página login
    Go To       ${BASE_URL}

Quando eu submeto minha credencial de login "${email}"
    Input Text          ${INPUT_EMAIL}        ${email}
    Click Element       ${BUTTON_LOGIN}

Então a área logada deve ser exibida
    Page Should Contain Element     ${DIV_DASH}     

Então devo ver a mensagem de alerta "${expect_message}"
    Element Text Should Be     ${ALERT_DARK}     ${expect_message}

## Anúncios
Dado que eu tenho uma "${bike_string}" muito bonita
    # pega a massa de teste e converte de string para json de verdade
    ${bike_json}=       evaluate        json.loads($bike_string)    json
    Log                 ${bike_json}
    Set Test Variable   ${bike_json}
    # Nova Bike/ Não pode exisitir no meu ambiente
    Remove Bike         ${bike_json['name']}

E eu acesso o formulário de cadastro de anúncios
    Click Link      /new

Quando eu faço o anúncio dessa bike
    Run Keyword if          '${bike_json['thumb']}'

    ...     Choose File             ${IMPUT_THUMB}           ${CURDIR}/images/${bike_json['thumb']}

    Clear Element Text      ${IMPUT_NAME} 
    Input Text              ${IMPUT_NAME}         ${bike_json['name']}
    
    Clear Element Text      ${IMPUT_BRAND}       
    Input Text              ${IMPUT_BRAND}        ${bike_json['brand']}

    Input Text              ${IMPUT_PRICE}        ${bike_json['price']}
    Click Element           ${BUTTON_SUBMIT}

Então devo ver minha bike na lista de anúncios
    Wait Until Element Is Visible   ${BIKE_ITEM} 
    Element Should Contain          ${BIKE_LIST}        ${bike_json['name']}

E o valor para locação deve ser igual a "${expect_price}"
    Element Should Contain      ${BIKE_LIST}             ${expect_price}

Então devo ver a mensagem de erro "${text}"
    Element Text Should Be         ${ALERT_ERROR}       ${text}