*** Settings ***
Documentation   Suite de teste do busca de personagens na API da Marvel
Resource        ${EXECDIR}/resources/base.robot
Library         ${EXECDIR}/resources/factories/xmen.py

Suite Setup     Super Setup     ffmeyer@ymail.com


*Test Cases*

Deve remover um personagem pelo id
    #Log to console       ${personagem}
    ${personagem}       factory cyclops
    
    ${cyclops}          POST new character  ${personagem}
    ${cyclops_id}       Set Variable        ${cyclops.json()}[_id]
    
    ${response}         DELETE character by id    ${cyclops_id}
    
    Status Should Be    204                  ${response}    

    ${response2}        GET character by id  ${cyclops_id}

    Status Should Be    404                  ${response2}


Não deve encontrar o personagem pelo id inexistente

      ${personagem_id}  get unique id

      ${response}     DELETE character by id     ${personagem_id}

      Status Should Be     404        ${response}


      