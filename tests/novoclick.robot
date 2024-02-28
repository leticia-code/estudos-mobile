*** Settings ***

Library    AppiumLibrary

*** Variables ***
${START}        QAX


*** Test Cases ***
Deve abrir a tela principal

    Open Application	http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=uiautomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 Udid=emulator-5554
    ...                 autoGrantPermissions=true
    
  
    Wait Until Page Contains        ${START}   
    Click Element                   xpath=//android.widget.Button[@text="QAX"]


    ${hamburger}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${hamburger} 
    Click Element                    ${hamburger}     

    ${menu_item}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="Clique em Botões"]

    Wait Until Element Is Visible    ${menu_item} 
    Click Element                    ${menu_item}

   
   ${clique_simple}     Set Variable     xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Clique simples"]
    Wait Until Element Is Visible      ${clique_simple}    
    Click Element                      ${clique_simple}

    Click Element                    //android.widget.Button[@resource-id="com.qaxperience.yodapp:id/short_click"]
    Wait Until Page Contains         Isso é um clique simples

    Close Application