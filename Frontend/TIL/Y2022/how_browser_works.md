[source](https://developer.mozilla.org/en-US/docs/Web/Performance/How_browsers_work)

1. Navigation
	- first step in loading webpage

	1.a. DNS lookup
	1.b. TCP Handshake
	1.c. TLS Negotiation

2. Response
	2.a. TCP Slow Start / 14kb rule
	2.b. Congestion control

3. Parsing
	3.a. Building the DOM tree
  3.b. Preload scanner

4. Building the CSSOM

	4.a. Other Processes
  - JavaScript Compilation
  - Building the Accessibility Tree

5. Render
	5.a. Style
	5.b. Layout
	5.c. Paint
	5.d. Compositing

6. Interactivity

