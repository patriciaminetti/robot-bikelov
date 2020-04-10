

#Representação do padrão page object para Robot Framework

*** Variables ***
### Login page
${INPUT_EMAIL}      id:email
${BUTTON_LOGIN}     xpath://button[contains(text(), 'Quero Anúnciar')]

### Dashboard
${DIV_DASH}         class:dashboard
${ALERT_DARK}       class:alert-dark
${BIKE_ITEM}        css:.bike-list li
${BIKE_LIST}        class:bike-list       

### Form pege
${IMPUT_THUMB}      css:#thumbnail input 
${IMPUT_NAME}       id:name 
${IMPUT_BRAND}      id:brand
${IMPUT_PRICE}      css:input[placeholder$=dia]   
${BUTTON_SUBMIT}    class:btn-red
${ALERT_ERROR}      class:alert-error 