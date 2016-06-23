var parser = require("./jison_tree.js").main;

var input_file = process.argv[2];
var parser_output = parser(process.argv.slice(1));

console.log(parser_output);