fs = require 'fs'

for file in fs.readdirSync(__dirname)
  if file.match(/\.coffee$/) && !file.match(/index\.coffee/)
    file = file.substr 0, file.indexOf('.')
    name = file.substring(0, 1).toUpperCase() + file.substring(1)
    exports[name] = require("./#{file}")
