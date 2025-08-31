# Data Bases

This repository covers a series of eight tasks, working with database management in PostgreSQL, fundamental aspects of XML, including data transformation and validation. 

Dataset used: DVD rental records ([./dvdrental](./dvdrental))

## Report

### Part 1: Stored Procedures

This part focuses on stored procedures (or user-defined functions) in PostgreSQL. Stored procedures are compiled, named blocks of SQL and procedural code stored on the server.

Unlike standard functions, PostgreSQL stored procedures (as of version 11) can manage transactions, allowing them to explicitly commit or rollback changes. They do not return a default value but can pass data via input/output parameters.

A complex procedure was created that included dynamic interaction with the database using variables and parameters. It implemented control structures like `IF` statements and loops, with error handling using `EXCEPTION` blocks and `RAISE` statements. A cursor was also used to process a set of results.


### Part 2: Transactions

This part explored transactions, which are essential for maintaining data integrity and reliability. A transaction is a set of database operations treated as a single, indivisible unit.

The integrity of transactions is governed by the ACID properties: Atomicity (all or nothing), Consistency (maintaining a valid state), Isolation (hiding intermediate changes), and Durability (permanent changes upon commit).

Multiple transactions were developed to demonstrate their lifecycle, including defining boundaries with `BEGIN` and `COMMIT`, and managing partial rollbacks with `SAVEPOINT` and `ROLLBACK TO`.


### Part 3: XML and PostgreSQL Integration

XML is a markup language used to describe and transport data in a structured, hierarchical format. It is both human- and machine-readable, structure is defined by tags, elements, and attributes. An XML document can be well-formed (syntactically correct) and valid (conforms to a schema).

Instead of using built-in functions, an XML document representing relational data was manually constructed using PostgreSQL's XML-specific functions like `xmlelement`, `xmlroot`, and `xmlagg`.


### Part 4: DTD Schema for XML

DTD (Document Type Definition) schema was used to define the structure of an XML document. A DTD is a set of rules that specifies which elements and attributes are allowed, their order, and how they can be nested. It's a key part of making an XML document "valid."

A DTD schema was manually created for the XML document from the previous task, defining all elements and their attributes. Online validator was used to confirm the XML document's validity against the new DTD.


### Part 5: XML Schema (XSD)

XML Schema (XSD) is a more advanced and powerful schema language than DTD, it uses XML syntax itself, supports a rich set of data types (e.g., integers, dates, booleans), and allows for sophisticated constraints (facets) like minimum length or regular expression patterns.

An XML Schema was created for the previously developed XML document. This schema used the "Alternative method" to define elements and attributes, and incorporated various facets to enforce strict data validation rules, such as character length and data patterns.


### Part 6: XPath Expression Language

XPath is a language for navigating and selecting nodes within an XML document. It treats an XML document as a tree of nodes. It uses path expressions to navigate this tree, similar to a file system, to precisely locate specific elements or attributes. It also includes functions for calculations and aggregations.

A variety of XPath expressions were written and tested. These expressions used different navigation techniques, including absolute and relative paths, wildcards, and predicates. Functions like `count()` and `sum()` were used to perform aggregations on the selected data.


### Part 7: XSLT for XML Transformation

XSLT (XSL Transformations) is a language for converting XML documents into other formats, such as HTML. It uses an XML stylesheet to define transformation rules. These rules use XPath to match nodes in the source document and then transform them into the desired output format, allowing for the addition, removal, and reordering of data.

An XSLT stylesheet was created to transform a fragment of the existing XML document. This stylesheet used template rules, iteration with \<xsl:for-each>, conditional logic with \<xsl:if>, and sorting to structure the output.


### Part 8: XQuery

This task focused on XQuery, 

XQuery is a W3C language for querying XML data, similar to how SQL queries relational databases, built on XPath and uses a syntax similar to SQL's `SELECT-FROM-WHERE` structure, known as a FLWOR expression. This allows for powerful and flexible queries across one or more XML documents to retrieve specific information.

An XQuery expression was written to extract and reformat data from the XML document. The expression used a FLWOR statement to iterate through elements, filter results based on a condition, and return a new XML structure with the selected data.