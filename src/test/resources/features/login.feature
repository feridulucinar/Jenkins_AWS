Feature: Login Test- The user should be able to log in with valid credentials

  Background: Go to the store page
    Given The user is on the login page

  @vip
  Scenario: Positive Login Test 1
    When The user enters valid credentials
    Then The user verify that Welcome username is displayed


#  Scenario: Positive Login Test 2 login with parameter
#    When The user enters with "JhonyCash" and "Test1234" credentials
#    Then The user verify that "Welcome JhonyCash" is displayed


  Scenario Outline: Positive Login Test 3 login with scenario outline
    When The user enters with "<username>" and "<password>" credentials
    Then The user verify that "<WelcomeUsername>" is displayed
    Examples:
      | username  | password | WelcomeUsername   |
      | JhonyCash | Test1234 | Welcome JhonyCash |
      | JhonyQ    | Test1234 | Welcome JhonyQ    |


  Scenario Outline: Positive Login Test 3 login with scenario outline and data table
    When The user enters valid username and password credentials
      | username | <username> |
      | password | <password> |
    Then The user verify that "<WelcomeUsername>" is displayed
    Examples:
      | username  | password | WelcomeUsername   |
      | JhonyCash | Test1234 | Welcome JhonyCash |
      | JhonyQ    | Test1234 | Welcome JhonyQ    |


  Scenario Outline: Negative scenario - The user should NOT be able to log in with invalid credentials
    When The user enters with "<invalidUsername>" and "<invalidPassword>" credentials
    Then The user vefiy that invalid credential "<message>"
    Examples:
      | invalidUsername | invalidPassword | message                                |
      | feridu          | 12344321        | User does not exist.                   |
      | feriduu         | invalidPassword | User does not exist.                   |
      | ferid           | invalidPassword | Wrong password.                        |
      |                 | 12344321        | Please fill out Username and Password. |
      | ferid           |                 | Please fill out Username and Password. |
      |                 |                 | Please fill out Username and Password. |