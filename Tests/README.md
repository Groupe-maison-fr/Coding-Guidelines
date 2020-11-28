---
sort: 60
---

# Tests

## Test doubles

- Dummy
- Stubs
- Fakes
- Spy
- Mocks


## Behat/Gherkin


## What to test, what not to test

### To test

 - Logic
 
### Not to test

 - DTO (Events, Command) as they don't contain logic, however you can use `DataTransferObjectValidator` to validate them.
