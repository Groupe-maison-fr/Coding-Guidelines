---
sort: 9
---

## Services

[source](https://medium.com/@nicolopigna/design-your-services-the-right-way-4c1b2af2b12c)

_When an operation does not **conceptually belong to any object**. Following the natural contours of the problem, you can implement these operations in services. They are by essence **stateless**,_

Typical sequence of a service

1. **Argument translation:** the arguments of the method call are translated into domain objects;
1. **Cross-Entity constraint protection:** cross-Entity business constraints are enforced;
1. **Entity manipulation:** the relevant piece of business logic is executed on a specific Entity;
1. **Publishing the changes:** resulting changes are published outside the Service boundaries, i.e. though events
1. **Responding to the Interface:** the outcome of the method call is communicated back to the Interface. A Result is a container object which carries information about the outcome of an operation inside your Service.

**What if anything goes wrong?**

If the operation was not successful, the Service still returns a Result object. But in this case the object will wrap the exception(s) that occurred inside the Service method call.

In no case a Service method should let an exception escape outside of its box.

