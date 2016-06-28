var parser = require("./jison_tree.js").main;

var parser_output = parser(process.argv.slice(1));

console.log(JSON.stringify(parser_output));