*** Settings ***
Documentation   Criar Anúncio
...             Para que eu possa disponibilizar bikes para locação
...             Sendo um anúnciante
...             Quero poder cadastar um novo anúncio

Resource        ../../resources/steps_kw.robot

Suite Setup      Run keywords       Logged with "eu@papito.io"
...              AND                E eu acesso o formulário de cadastro de anúncios
Suite Teardown   End Session

Test Teardown    End Test

Test Template   Anúncio não cadastrado

*** Variables ***
${no_thumb}=       {"thumb": "", "name": "Xpto", "brand": "XiMano", "price": "17" }
${no_name}=        {"thumb": "elleven.jpg", "name": "", "brand": "Shimano", "price": "" }
${no_brand}=       {"thumb": "elleven.jpg", "name": "Elleven Rocker 26 Marchas", "brand": "", "price": "15" }

*** Test Cases ***          bike                error
Sem foto no anúncio         ${no_thumb}         Precisamos de uma foto para o seu anúncio!
Não informa o nome          ${no_name}          Informe a descrição do anúncio!
Não informa a marca         ${no_brand}         Informe a marca da sua Bike :)

*** Keywords ***
Anúncio não cadastrado
    [Arguments]           ${bike}              ${text}    

    Dado que eu tenho uma "${bike}" muito bonita
    Quando eu faço o anúncio dessa bike
    Então devo ver a mensagem de erro "${text}"