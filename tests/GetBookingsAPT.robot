*** Settings ***
Library    RequestsLibrary
Library    Builtin

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com
${HEADERS}    {"Accept":"application/json", "content-type":"application/json"}

*** Test Cases ***
TC_001_Get_All_Bookings_number
    [Documentation]    This test case retrieves all bookings
    Create Session    my_session    ${BASE_URL}
    ${response}=    GET on session    my_session    /booking
    Should Be Equal As Strings    ${response.status_code}    200
    ${total_bookings}=   GET Length   ${response.json()}
    Log To Console   ${total_bookings}
