---
sort: 3
---

## View models

A view model is a specialized **immutable dto**, linked to a **single template**. It just contains the **minimum necessary** datas. The only logic allowed is **related to presentation**.

```php
final class PostViewModel
{
    /**
     * @var PostId
     */
    private $postId;

    public function __construct(PostId $postId, string $title, string $slug)
    {
        $this->postId = $postId;
        $this->title = $title;
        $this->slug = $slug;
    }

    public static function fromPost(Post $post): self
    {
        return new self($post->getId(), $post->getTitle(), $post->getSlug());
    }

    public function getPostId(): PostId
    {
        return $this->postId;
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function getSlug(): string
    {
        return $this->slug;
    }
}
```

