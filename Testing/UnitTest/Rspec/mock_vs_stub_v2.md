~~~html
- A "mock" object is typically used to set expectations on the behavior of a collaborator (another object) in the system under test. For example, you might use a mock object to expect that a certain method will be called with certain arguments, or that a certain attribute will be set to a certain value. If the mock's expectations are not met during the test, the test will fail.

- A "stub" object is used to return a predetermined value when a certain method is called. Stubs are often used to replace the behavior of a collaborator that is difficult to set up or that has external dependencies (such as a database or a web service). Stubs do not have any expectations associated with them, so they will not cause a test to fail if they are not used as expected.

- In general, you might use mocks when you want to set expectations on the behavior of collaborators in your system, and you might use stubs when you just want to replace the behavior of a collaborator with a fixed return value.
~~
