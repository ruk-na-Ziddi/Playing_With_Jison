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

%start language

%% /* language grammar */

language : expression EOF{ return  $1;}
		;

expression : sentence
		{$$ = {"expression": [$1]}}
		| expression NEWLINE sentence
		{$$ = {"expression": [$1,$3]};}
		;

sentence  :NAME SPACE HELPER SPACE ATTITUDE DOT
		{$$ = {"sentence":{"NAME":$1, "HELPER":$3, "ATTITUDE":$5}}}
		;
