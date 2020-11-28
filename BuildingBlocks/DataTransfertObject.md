---
sort: 1
---

## Data Transfert Object (DTO)

[source](https://en.wikipedia.org/wiki/Data_transfer_object)

A data transfer object is an object that **carries data between processes/objects**. 

The difference between data transfer objects and business objects or data access objects is that a DTO **does not have any behavior**. In other words, DTOs are simple objects that should **not contain any business logic** but may contain serialization and deserialization mechanisms for transferring data.

They are a composition of scalar, other DTOs and value objects. They are **immutable**. They are not supposed to be persisted, however they are **serializable**. 

```php

final class fooDto
{
    /**
     * @var int
     */
    private $propertyA;

    /**
     * @var string
     */
    private $propertyB;

    public function __construct(int $propertyA, string $propertyB)
    {
        $this->propertyA = $propertyA;
        $this->propertyB = $propertyB;
    }

    public function getPropertyA(): int
    {
        return $this->propertyA;
    }

    public function getPropertyB(): string
    {
        return $this->property>B;
    }
}

```

