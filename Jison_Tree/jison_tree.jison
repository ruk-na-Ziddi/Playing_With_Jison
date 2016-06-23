/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%
" "                   return 'SPACE';
"kaustav"             return 'NAME';
"mahesh"              return 'NAME';
"dolly"               return 'NAME';
"is"                  return 'HELPER';
"talentshow"          return 'ATTITUDE';
"impatient"           return 'ATTITUDE';
"kid"                 return 'ATTITUDE';
"."                   return 'DOT';
<<EOF>>				  return 'EOF';
\n                    return 'NEWLINE';

/lex
%{
	var get_tuples = function(){
		var final = {};
		for(var i = 0; i < arguments.length; i++){
			final[Object.keys(arguments[i])[0]] = arguments[i][Object.keys(arguments[i])[0]]
		}
		return final;
	}
%}

%start language

%% /* language grammar */

language : expression EOF{ return JSON.stringify({"language" : $1});}
		;

expression : sentence
		{$$ = {"expression": [$1]}}
		| expression NEWLINE sentence
		{$$ = {"expression": [$1,$3]};}
		;

sentence  :NAME_token SPACE HELPER_token SPACE ATTITUDE_token DOT
		{$$ = {"sentence":get_tuples($1,$3,$5)}}
		;

NAME_token   :NAME 
	{$$ = {"NAME": yytext};}
       ;

HELPER_token   :HELPER
	{$$ = {"HELPER": yytext};}
        ;

ATTITUDE_token  :ATTITUDE
	{$$ = {"ATTITUDE": yytext};}
        ;
