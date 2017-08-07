#!/usr/bin/env node

const fs = require ('fs')
const filelist = [ process.argv[2], process.argv[3] ]

var file  = {}

console.log (filelist)

const parseFile = function (filepath) {
  console.log("filepath", filepath)
  return JSON.parse(fs.readFileSync(filepath, 'utf8'))
}

const constructFilepath = function (file, prefix, suffix) {
  return prefix + file + suffix
}

const loadFiles = function (files) {
  var response = []
  files.forEach ( function (i) {
    response.push( parseFile (constructFilepath (i, './', '.json') ) )
  })
  return response
}

var stadtacker = loadFiles (filelist)
//console.log ("stadtacker", stadtacker)
var len = stadtacker[0].features.length
console.log ("len", len)

for (var i = 0; i < len; i++) {
  stadtacker[0].features[i]['properties']['tags'] = stadtacker[1].tags[i]
  console.log("tags", stadtacker[1].tags[i] )
}

console.log("features", stadtacker[0])

var json = JSON.stringify(stadtacker[0])
fs.writeFileSync( filelist[0] + '_tagged.json', json, 'utf8' )
