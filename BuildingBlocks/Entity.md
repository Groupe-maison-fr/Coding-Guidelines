---
sort: 4
---

## Entities

[source](https://khalilstemmler.com/articles/typescript-domain-driven-design/entities/)

Objects that have a **distinct identity** that runs **through time** and **different representations**. You also hear these called **"reference objects"**.

Entities should be the first place that we think of to put domain logic.
They are **mutable** and **persistable**. However, you don't add getters and setters systematically.


```php
class Post
{
    /**
     * @var PostId
     */
    private $id;

    /**
     * @var string
     */
    private $title;

    /**
     * @var string
     */
    private $slug;

    /**
     * @var Tag[]
     */
    private $tags = [];

    /**
     * @var bool
     */
    private $isNewPost = false;

    public function __construct()
    {
        $this->publishedAt = DateTimeGenerator::generate();
        $this->id = new PostId();
        $this->isNewPost = true;
    }

    public function getId(): PostId
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): void
    {
        $this->title = $title;

        if ($this->isNewPost) {
            $this->slug = Slugger::slugify($this->getTitle());
        }
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function postfixSlug(string $suffix): void
    {
        if (!$this->isNewPost) {
            throw new SlugIsImmutableException();
        }

        $suffix = '-' . ltrim($suffix, '-');

        $this->slug = $this->slug . $suffix;
    }

    public function addTag(Tag ...$tags): void
    {
        foreach ($tags as $tag) {
            if (!$this->contains($tag, $this->tags)) {
                $this->tags[] = $tag;
            }
        }
    }
    public function removeTag(Tag $tag): void
    {
        if ($key = $this->getKey($tag, $this->tags)) {
            unset($this->tags[$key]);
        }
    }

    /**
     * We don't want to have here any reference to doctrine, so we remove the Collection type hint from everywhere.
     * The safest is to treat it as an array but we can't type hint it with 'array' because we might actually
     * return an Collection.
     *
     * @return Tag[]
     */
    public function getTags()
    {
        return $this->tags;
    }
}
```

