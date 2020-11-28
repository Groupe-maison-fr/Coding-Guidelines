---
sort: 10
---

## Aggregates

[source](https://sites.google.com/site/babokstudies/event-storming/domain-driven-design)

_A collection of objects that are bound together by a root entity, otherwise known as an aggregate root. The aggregate root guarantees the consistency of changes being made within the aggregate by forbidding external objects from holding references to its members.
Example: When you drive a car, you do not have to worry about moving the wheels forward, making the engine combust with spark and fuel, etc.; you are simply driving the car. In this context, the car is an aggregate of several other objects and serves as the aggregate root to all of the other systems._

- is a cluster of domain objects that can be treated as a single unit
- has a root entity and only one
- are referenced externally only by the root identity
- all references to internal elements are done through the root entity as an entrypoint

