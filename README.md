# xmlBodyParser for express
------

Parses POST requests with Content-Type: 'application/xml' for consumption in your node app. Written in coffeescript.



## Installation

Put the files in __your\_app > node\_modules > custom\_modules > xmlBodyParser__ and then you can reference it anywhere in your project using:

***CoffeeScript***

    xmlBodyParser = require 'custom_modules/xmlBodyParser/xmlBodyParser'
    

------

## Usage

In app.configure, use it like this:

***CoffeeScript***

    app.configure ->
	  app.use xmlBodyParser.xmlBodyParser
