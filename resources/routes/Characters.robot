*Settings*

Documentation   Ações da rota characters


*Keywords*
POST new character
    [Arguments]     ${payload}

    ${response}     POST
    ...    ${API_URL}/characters
    ...     json=${payload}
    ...     headers=${HEADERS}
    ...     expected_status=any

    [return]    ${response}



GET character by id
    [Arguments]     ${character_id}

    ${response}     GET
    ...    ${API_URL}/characters/${character_id}
    ...     headers=${HEADERS}
    ...     expected_status=any

    [return]    ${response}


DELETE character by id
    [Arguments]     ${character_id}

    ${response}     DELETE
    ...    ${API_URL}/characters/${character_id}
    ...     headers=${HEADERS}
    ...     expected_status=any

    [return]    ${response}


