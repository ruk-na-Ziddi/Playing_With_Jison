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
%{
	var sentence_elements = function(o1,o2,o3){
		var final = {};
		final[Object.keys(o1)[0]] = o1["NAME"];
		final[Object.keys(o2)[0]] = o2["HELPER"];
		final[Object.keys(o3)[0]] = o3["ATTITUDE"];
		return final;
	}
%}

%start sentence

%% /* language grammar */

sentence 
		: senty EOF{ return {"senty" : $1};}
		;

senty 
		: NAME_token SPACE HELPER_token SPACE ATTITUDE_token DOT_token
		{$$ = sentence_elements($1,$3,$5)}
		;

HELPER_token   :HELPER
	{$$ = {"HELPER": yytext};}
         ;

NAME_token   :NAME 
	{$$ = {"NAME": yytext};}
       ;


ATTITUDE_token  :ATTITUDE
	{$$ = {"ATTITUDE": yytext};}
          ;

DOT_token   :DOT
	{$$ = {"DOT": yytext};}
      ;
