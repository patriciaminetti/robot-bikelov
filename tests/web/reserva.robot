*** Settings ***
Documentation   Pedido de reservas
...             Para que eu possa aprovar ou reprovar
...             Sendo um anunciante que possui anúncios cadastrados
...             Quero receber pedidos de reservar no meu dashboard

Resource        ../resources/steps_kw.robot

Suite Setup      Logged with "eu@papito.io"
Suite Teardown   End Session

Test Teardown    End Test

*** Test Cases ***
    
Receber pedido de reserva
    [tags]      todo
    Dado que estou logado como "papito@gmail.com"
    E tenho anúncios cadastrados
    Quando o "joão@gmail.com" solicita uma reserva para o meu anúncio
    Então devo ver esta solicitação no meu dashboard