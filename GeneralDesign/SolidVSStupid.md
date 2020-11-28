---
sort: 3
---

## S.O.L.I.D. over S.T.U.P.I.D.

### S.T.U.P.I.D.

[source](https://williamdurand.fr/2013/07/30/from-stupid-to-solid-code/)

#### S-Singleton
The Singleton pattern is probably the most well-known design pattern, but also the most misunderstood one. Are you aware of the Singleton syndrome? It is when you think the Singleton pattern is the most appropriate pattern for the current use case you have. In other words, you use it everywhere. That is definitely not cool.

Singletons are controversial, and they are often considered anti-patterns. You should avoid them. Actually, the use of a singleton is not the problem, but the symptom of a problem. Here are two reasons why:

- Programs using global state are very difficult to test;
- Programs that rely on global state hide their dependencies


#### T-Tight Coupling

Tight coupling, also known as strong coupling, is a generalization of the Singleton issue. Basically, you should reduce coupling between your modules. Coupling is the degree to which each program module relies on each one of the other modules.

If making a change in one module in your application requires you to change another module, then coupling exists. For instance, you instantiate objects in your constructor’s class instead of passing instances as arguments. That is bad because it doesn’t allow further changes such as replacing the instance by an instance of a sub-class, a mock or whatever.

Tightly coupled modules are difficult to reuse, and also hard to test.

#### U-Untestability

<https://williamdurand.fr/2013/07/30/from-stupid-to-solid-code/>

In my opinion, testing should not be hard! No, really. Whenever you don’t write unit tests because you don’t have time, the real issue is that your code is bad, but that is another story.

Most of the time, untestability is caused by tight coupling.

#### P-Premature Optimization

Donald Knuth said: “premature optimization is the root of all evil. There is only cost, and no benefit”. Actually, optimized systems are much more complex than just rewriting a loop or using pre-increment instead of post-increment. You will just end up with unreadable code. That is why Premature Optimization is often considered an anti-pattern.

A friend of mine often says that there are two rules to optimize an application:

don’t do it;
(for experts only!) don’t do it yet.

#### I-Indescriptive Naming

This should be obvious, but still needs to be said: name your classes, methods, attributes, and variables properly. Oh, and don’t abbreviate! You write code for people, not for computers. They don’t understand what you write anyway. Computers just understand 0 and 1. Programming languages are for humans.

#### D-Duplication

Duplicated code is bad, so please Don’t Repeat Yourself (DRY), and also Keep It Simple, Stupid. Be lazy the right way - write code only once!

Now that I have explained what STUPID code is, you may think that your code is STUPID. It does not matter (yet). Don’t feel bad, keep calm and be awesome by writing SOLID code instead!

### S.O.L.I.D.

[source](https://williamdurand.fr/2013/07/30/from-stupid-to-solid-code/)

#### S-Single Responsibility Principle

Single Responsibility Principle or SRP states that every class should have a single responsibility. There should never be more than one reason for a class to change.

Just because you can add everything you want into your class doesn’t mean that you should. Thinking in terms of responsibilities will help you design your application better. Ask yourself whether the logic you are introducing should live in this class or not. Using layers in your application helps a lot. Split big classes in smaller ones, and avoid god classes. Last but not least, write straightforward comments. If you start writing comments such as in this case, but if, except when, or, then you are doing it wrong.

#### O-Open/Closed Principle

Open/Closed Principle or OCP states that software entities should be open for extension, but closed for modification.

You should make all member variables private by default. Write getters and setters only when you need them. I’ve already covered this point in a previous article, as the ninth rule of the Object Calisthenics is related to this principle.

#### L-Liskov Substitution Principle

Liskov Substitution Principle or LSP states that objects in a program should be replaceable with instances of their subtypes without altering the correctness of the program.

Let’s take an example. A rectangle is a plane figure with four right angles. It has a width, and a height. Now, take a look at the following pseudo-code:

```

rect = new Rectangle();

rect.width  = 10;
rect.height = 20;

assert 10 == rect.width
assert 20 == rect.height
```

We simply set a width and a height on a Rectangle instance, and then we assert that both properties are correct. So far, so good.

Now we can improve our definition by saying that a rectangle with four sides of equal length is called a square. A square is a rectangle so we can create a Square class that extends the Rectangle one, and replace the first line above by the one below:

rect = new Square();
According to the definition of a square, its width is equal to its height. Can you spot the problem? The first assertion will fail because we had to change the behavior of the setters in the Square class to fit the definition. This is a violation of the Liskov Substitution Principle.

#### I-Interface Segregation Principle

Interface Segregation Principle or ISP states that many client-specific interfaces are better than one general-purpose interface. In other words, you should not have to implement methods that you don’t use. Enforcing ISP gives you low coupling, and high cohesion.

When talking about coupling, cohesion is often mentioned as well. High cohesion means to keep similar and related things together. The union of cohesion and coupling is orthogonal design. The idea is to keep your components focused and try to minimize the dependencies between them.

Note that this is similar to the Single Responsibility Principle. An interface is a contract that meets a need. It is ok to have a class that implements different interfaces, but be careful, don’t violate SRP.

#### D-Dependency Inversion Principle

Dependency Inversion Principle or DIP has two key points:

Abstractions should not depend upon details;
Details should depend upon abstractions.
This principle could be rephrased as use the same level of abstraction at a given level. Interfaces should depend on other interfaces. Don’t add concrete classes to method signatures of an interface. However, use interfaces in your class methods.

Note that Dependency Inversion Principle is not the same as Dependency Injection. Dependency Injection is about how one object knows about another dependent object. In other words, it is about how one object acquires a dependency. On the other hand, DIP is about the level of abstraction. Also, a Dependency Injection Container is a way to auto-wire classes together. That does not mean you do Dependency Injection though. Look at the Service Locator for example.

Also, rather than working with classes that are tight coupled, use interfaces. This is called programming to the interface. This reduces dependency on implementation specifics and makes code more reusable. It also ensures that you can replace the implementation without violating the expectations of that interface, according to the Liskov Substitution Principle seen before.


