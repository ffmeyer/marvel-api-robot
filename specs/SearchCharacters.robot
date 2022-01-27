*** Settings ***
Documentation   Suite de teste do busca de personagens na API da Marvel
Resource        ${EXECDIR}/resources/base.robot
Library         ${EXECDIR}/resources/factories/xmen.py

Suite Setup     Super Setup     ffmeyer@ymail.com


*Test Cases*

Deve remover um personagem pelo id
    #Log to console       ${personagem}
    ${personagem}       factory logan
    
    ${logan}            POST new character  ${personagem}
    ${logan_id}         Set Variable        ${logan.json()}[_id]
    
    ${response}     GET character by id     ${logan_id}
    
    Status Should Be     200        ${response}

    Should Be Equal     ${logan.json()}[name]       ${personagem}[name]
    Should Be Equal     ${logan.json()}[aliases]    ${personagem}[aliases]
    Should Be Equal     ${logan.json()}[age]        ${personagem}[age]
    Should Be Equal     ${logan.json()}[team]       ${personagem}[team]
    Should Be Equal     ${logan.json()}[active]     ${personagem}[active]


Não deve retornar o personagem pelo id
      ${personagem_id}  get unique id

      ${response}     GET character by id     ${personagem_id}

      Status Should Be     404        ${response}      