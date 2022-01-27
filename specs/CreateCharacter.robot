*** Settings ***
Documentation   Suite de teste do cadastro de personagens na API da Marvel
Resource        ${EXECDIR}/resources/base.robot
Library         ${EXECDIR}/resources/factories/guardians.py
Library         ${EXECDIR}/resources/factories/deadpool.py
Library         ${EXECDIR}/resources/factories/thanos.py

Suite Setup     Super Setup     ffmeyer@gmail.com

***Test Cases***
Deve cadastrar um personagem    

    &{personagem}=   factory star lord

    ${response}=    POST new character  ${personagem} 
 
    Status should be    200     ${response}

Não deve cadastrar com o mesmo nome 
    [tags]      dup
    &{personagem}=   factory groot
    POST new character  ${personagem} 

    ${response}=    POST new character  ${personagem} 
    
    Status Should Be    409
    Should Be equal  ${response.json()}[error]   Character already exists :(



