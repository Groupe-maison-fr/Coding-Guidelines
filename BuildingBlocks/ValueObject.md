---
sort: 2
---

## Value objects

[source](https://en.wikipedia.org/wiki/Domain-driven_design)

A **self Validated** object that contains attributes but **has no conceptual identity**. They should be **treated as immutable**.
They can contain **other value objects** or **scalar types**. They **reflects the semantics** of the domain. These objects describe characteristics of a thing.

*Example: When people exchange business cards, they generally do not distinguish between each unique card; they are only concerned about the information printed on the card. In this context, business cards are value objects.*

In computer science, a value object is a small object that represents a simple entity whose **equality is not based on identity**: i.e. two value objects are equal when they have the same value, not necessarily being the same object.

Examples of value objects are objects representing an amount of money or a date range.

Being small, one can have multiple copies of the same value object that represent the same entity: it is often simpler to create a new object rather than rely on a single instance and use references to it.

Value objects should be immutable: this is required for the implicit contract that two value objects created equal, should remain equal. It is also useful for value objects to be immutable, as client code cannot put the value object in an invalid state or introduce buggy behaviour after instantiation.

Fluent mapping is adapted for value object.

- Describes, Measures or Quantifies an Entity
- are immutable and no setters should be defined
- reflects the semantics of the domain
- has no default or useless getter methods
- Structural equality, can be compared to other Value Objects of the same class by reading private properties directly.

```php

class Address implements JsonSerializable {
    private $city;
    private $country;
    private $postalCode;
    private $streetAddress;

  function __construct(string $city, string $country, string $postalCode, string $streetAddress){
            Assert::that($city)->minLength(5);
            Assert::that($ccountry)->minLength(10);
            Assert::that($postalCode)->regex("#^[0-9]{5,7}$#");
            Assert::that($streetAddress)->minLength(10);

            $this->city = $city;
            $this->country = $country;
            $this->postalCode = $postalCode;
            $this->streetAddress = $streetAddress;
    }

    function getCity(): string { return $this->city; }
    function getCountry(): string { return $this->country; }
    function getPostalCode(): string { return $this->postalCode; }
    function getStreetAddress(): string { return $this->streetAddress; }


    function isEqualTo(Address $address): bool {
      return $this->city === $address->getCity() &&
            $this->country === $address->getCountry() &&
            $this->postalCode === $address->getPostalCode() &&
            $this->streetAddress === $address->getStreetAddress();
    }


    // I find it useful to be able to serialize/deserialize VOs in json representation (see interface JsonSerializable)
    function toArray(): array {
            return [
                'city' => $this->city,
                'country' => $this->country,
                'postalCode' => $this->postalCode,
                'streetAddress' => $this->streetAddress
            ];
    }

    static function fromArray(array $input): self {
      // TODO: optional $input validation

        return new self(
          $input['city'],
            $input['country'],
            $input['postalCode'],
            $input['streetAddress']
        );
    }
}
```

