---
sort: 6
---

## Query objects

_Query objects store complex SQL queries, data aggregation, and filtering methods._

The goal of this pattern is to remove code for querying sets of objects from models/controllers and provide a simple yet powerful interface for complex data aggregation.
Their name should be suffixed by _Query_

- Contain only one query method
- Query can be parametrized through QueryObject setters
- No rules for return (scalar, DTO, viewModel, collection)

```php
final class UsersThatHaveAMonthlySubscription
{
	private $withGroups = false;
	
	private $type = null;
	
    public function __construct(EntityManagerInterface $em) 
    {
    }
    
	 public function includeGroups(): self
	 {
	     $this->withGroups = true;
	     return $this;
	 }

	 public function restrictByType($type): self
	 {
	     $this->type = $type;
	     return $this;
	 }

    public function __invoke() : Traversable
    {
    }
}
```

