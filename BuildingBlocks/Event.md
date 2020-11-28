---
sort: 8
---

## Events

- is a subset of DTOs
- are always in a past tense, and are suffixed by 'Event'
- multiple listeners can be defined for one event
- an event does not have necessary a listener

```php
final class CommentCreatedEvent implements EventInterface
{
    /**
     * @var CommentId
     */
    private $commentId;

    public function __construct(CommentId $commentId)
    {
        $this->commentId = $commentId;
    }

    public function getCommentId(): CommentId
    {
        return $this->commentId;
    }
}

```

## Event listeners and subscribers

## Event listeners

- is triggered from a dispatched event
- a listener is specialized to a specific event
- the name of the listener is just the name of the event replacing Event by Listener
- it's not preferable to dispatch an event from a listener, however it's not forbidden
- Commands should not be emitted from an eventListener

```php

class CommentCreatedListener
{
    /**
     * @var PostQueryInterface
     */
    private $postQuery;

    /**
     * @var NotificationServiceInterface
     */
    private $notificationService;

    public function __construct(
        PostQueryInterface $postQuery,
        NotificationServiceInterface $notificationService
    ) {
        $this->postQuery = $postQuery;
        $this->notificationService = $notificationService;
    }

    public function notifyPostAuthorAboutNewComment(CommentCreatedEvent $event): void
    {
        $commentId = $event->getCommentId();
        $postDto = $this->getPostDto($commentId);

        $this->notificationService->notify(
            new NewCommentNotification(
                $postDto->getAuthorId(),
                $postDto->getAuthorMobile(),
                $commentId,
                new EmailAddress($postDto->getAuthorEmail(), $postDto->getAuthorFullName()),
                $postDto->getId(),
                $postDto->getTitle(),
                $postDto->getSlug()
            )
        );
    }

    private function getPostDto(CommentId $commentId): PostWithAuthorDto
    {
        return $this->postQuery
            ->includeAuthor()
            ->execute($commentId)
            ->hydrateSingleResultAs(PostWithAuthorDto::class);
    }
}

```

## Event subscribers

Another way to listen to events is via an event subscriber, which is a class that defines one or more methods that listen to one or various events. A subscriber listen to several different events but react in the same way for all of them.



