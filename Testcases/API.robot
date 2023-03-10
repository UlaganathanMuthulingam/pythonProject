*** Settings ***
Library     REST  https://stage.tce.tillster.com/tce-experience-admin
Library           SeleniumLibrary
Library     ../WebdriverManager/BrowserDriverManager.py


*** Variables ***
${LOGIN URL}      http://localhost:7272
${BROWSER}        Chrome


*** Test Cases ***
GetMethod
    Set Headers    { "authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1EVXhSalF3UXpJMlJqQkJRa0ZGTkRFMVJrRkZSa1V5UVRkQ05VTTNOVUU1UkRBMFJFSXlSUSJ9.eyJodHRwczovL3RjZS50aWxsc3Rlci5jb20vIjp7InRpZHMiOlsiKiJdLCJzaWRzIjp7IioiOlsiKiJdfSwicm9sZXMiOlsiU3VwZXJBZG1pbiJdLCJ0ZW5hbnRDbGFpbXMiOnsiKiI6eyJyb2xlcyI6WyJTdXBlckFkbWluIl0sInBlcm1pc3Npb25zIjpbIioiXX19LCJ1c2VySWQiOiJkNThkYzBmNy0xZDNlLTRjYzctOWE4NC1lZWE3ZGMzNjVmZTQifSwiaXNzIjoiaHR0cHM6Ly90aWxsc3Rlci10Y2Utc3RhZ2UuYXV0aDAuY29tLyIsInN1YiI6IndhYWR8T0dFVFBMNTRNLTlHeGUwaWhncjJDcTVXaVRLTTJSNmtYdnY1eXE0c2NRayIsImF1ZCI6WyJodHRwczovL3N0YWdlLnRjZS50aWxsc3Rlci5jb20vdGNlLWV4cGVyaWVuY2UtYWRtaW4iLCJodHRwczovL3RpbGxzdGVyLXRjZS1zdGFnZS5hdXRoMC5jb20vdXNlcmluZm8iXSwiaWF0IjoxNjcxMjgyODc1LCJleHAiOjE2NzEzNjkyNzUsImF6cCI6Ijg2dTRuaVptc0hLWGFZTUFuS3NWMnVaSjAwYklQMTAyIiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBlbWFpbCIsInBlcm1pc3Npb25zIjpbXX0.zrrMMjaatPVMREZszl9KT9I6YJwcbg_ZaMyuQac7QPhQEV6oT2RblubZuM3kSRNBq3lj_7TgspIwsMcVZzdzvsgiiikUbdgyt77QbIbpnTaTwWt7XYQ2o4IPm6tn6cNQOXkxZuST88dl_3Kavx_FZAzLankHPhJciEeSMzYLhw6r4oOjlmDzgyJJGAgVhTC_H7hzB0VG6hAn8iHgttLQk4BIhJ4MKYGcHU-zWVZvTAkhwgj97AwYP7YnqlxZLJiiWxxeWsvS244_-8XWWPoBlmgC4ZdvT-Hhsme_0G4HisiTcT6-kMDjRVHq6y7UmErTRIkH3J6pvoR7rWID61sTGg","active-tenant-identifier": "8bd96089-355c-42ae-9bbc-affc55173124"}
    GET     /tenants/8bd96089-355c-42ae-9bbc-affc55173124/
    Output  response status
    ${val}=  Output  $.currency
    Should Be Equal As Strings    ${val}    USD


Valid Login
    ${hmm}=  BrowserDriverManager.Get Browser Driver Path
    Log To Console    ${hmm}
    Open Browser    browser=Chrome    url=https://stg.studyreach.com/    executable_path=BrowserDriverManager.Get Browser Driver Path
    Maximize Browser Window
    Sleep    30s
    Click Element    xpath=//*[text()='Login']
    Capture Page Screenshot
    Input Text    xpath=//*[@name='username']    strpatadm07122022@yopmail.com
    Input Text    xpath=//*[@name='password']    Test@123
    Cover Element   xpath=//*[text()='Login']
    Click Element    xpath=//*[text()='Login']
    Wait Until Element Is Visible  xpath=//*[@class='nav_rgt']  30s
    Capture Page Screenshot



