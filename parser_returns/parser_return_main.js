var parser = require("./parser_return.js").main;

var input_file = process.argv[2];
var parser_output = parser(process.argv.slice(1));
parser_output["senty"]["HELPER"] = "was";

var new_sentence = parser_output["senty"]["NAME"]+" "+parser_output["senty"]["HELPER"]+" "+parser_output["senty"]["ATTITUDE"]+"."
console.log(new_sentence);
