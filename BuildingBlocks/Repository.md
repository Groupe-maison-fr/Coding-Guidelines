---
sort: 5
---

## Repositories

[source](https://martinfowler.com/eaaCatalog/repository.html)

_Methods for retrieving domain objects should delegate to a specialized Repository object such that alternative storage implementations may be easily interchanged._

Mediates between the domain and data mapping layers using a collection-like interface for accessing domain objects.
Repository encapsulates the set of objects persisted in a data store and the operations performed over them, providing a more object-oriented view of the persistence layer. Repository also supports the objective of achieving a clean separation and one-way dependency between the domain and data mapping layers.

- Contain several query methods
- Query methods always return entities (one or a collection)
- Query methods which return an entity throw a NotFoundException when no result is found
- Query methods which should return a unique entity and that returns multiple entities should raised a NonUniqueException
- Query methods which return a collection, return an empty collection when no result is found

```php
<?php
declare(strict_types=1);

namespace DesignPatterns\More\Repository;

use DesignPatterns\More\Repository\Domain\Post;
use DesignPatterns\More\Repository\Domain\PostId;

class PostRepository
{
    /**
     * @var Persistence
     */
    private $persistence;

    public function __construct(Persistence $persistence)
    {
        $this->persistence = $persistence;
    }

    public function generateId(): PostId
    {
        return PostId::fromInt($this->persistence->generateId());
    }

    public function findById(PostId $id): Post
    {
        try {
            $arrayData = $this->persistence->retrieve($id->toInt());
        } catch (\OutOfBoundsException $e) {
            throw new \OutOfBoundsException(sprintf('Post with id %d does not exist', $id->toInt()), 0, $e);
        }

        return Post::fromState($arrayData);
    }

    public function save(Post $post): void
    {
        $this->persistence->persist([
            'id' => $post->getId()->toInt(),
            'statusId' => $post->getStatus()->toInt(),
            'text' => $post->getText(),
            'title' => $post->getTitle(),
        ]);
    }
}
```


