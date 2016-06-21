/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%
\s+                   return 'SPACE';
"kaustav"             return 'NAME';
"mahesh"              return 'NAME';
"dolly"               return 'NAME';
"is"                  return 'HELPER';
"talentshow"          return 'ATTITUDE';
"impatient"           return 'ATTITUDE';
"kid"                 return 'ATTITUDE';
"."                   return 'DOT';
<<EOF>>				  return 'EOF';
"\n"                  return 'NEWLINE';

/lex


%start sentence

%% /* language grammar */

sentence 
		: senty EOF{ return $1;}
		;


senty 
		: senty SPACE ATTITUDE SPACE NAME DOT
		| senty SPACE NAME SPACE HELPER SPACE ATTITUDE DOT
		| ATTITUDE SPACE NAME DOT
		| NAME SPACE HELPER SPACE ATTITUDE DOT
		;
