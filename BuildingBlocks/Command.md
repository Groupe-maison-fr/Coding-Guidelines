---
sort: 7
---

## Commands

[source](https://barryvanveen.nl/blog/49-what-is-a-command-bus-and-why-should-you-use-it)

_Commands are useful as they represent a single pathway to completing a state change/unit of work/doing something that modifies your system_

- Is a subset of DTOs
- A command represents a state change
- A unique handler completes the state change
- A command bus routes the command to the handler (synchronously or asynchronously)

```php
 
final class CreateUserCommand implements Command
{
    public function __construct(
        private Uuid $uuid, 
        private string $username, 
        private string $displayName, 
        private string $password
    ) {
    }

    // ... getters
}

```

