xml2js = require 'xml2js'
utils = require "express/node_modules/connect/lib/utils"
parser = new xml2js.Parser()


xmlBodyParser = (req, res, next) ->
  return next()  if req._body
  req.body = req.body or {}
  
  # ignore GET
  return next()  if "GET" is req.method or "HEAD" is req.method
  
  # check Content-Type
  return next()  unless "application/xml" is utils.mime(req)
  
  # flag as parsed
  req._body = true
  
  # parse
  buf = ""
  req.setEncoding "utf8"
  req.on "data", (chunk) ->
    buf += chunk

  req.on "end", ->
    parser.parseString buf, (err, json) ->
      if err
        err.status = 400
        next err
      else
        req.body = json
        next()

exports.xmlBodyParser = xmlBodyParser