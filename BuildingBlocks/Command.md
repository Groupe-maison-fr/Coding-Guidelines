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
 
class CreateUser implements Command
{
    /** @var Uuid */
    private $id;

    /** @var string */
    private $username;

    /** @var string */
    private $password;

    /** @var string */
    private $display_name;

    /**
     * User constructor.
     * @param Uuid $uuid
     * @param string $username
     * @param string $password
     */
    public function __construct(Uuid $uuid, $username, $displayName, $password)
    {
        $this->id = $uuid;
        $this->username = $username;
        $this->display_name = $displayName;
        $this->password = $password
    }

    // ... getters
}

```

