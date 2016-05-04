%{ /* -*- c -*- */
	/**
	*
	*INTEGER, changed atoi to atof
	*[-+]?[0-9]+
	*Program parses floats
	*/

#include <stdio.h>
#include "gram.h"

#undef yywrap
int yywrap();
%}
/* extern YYSTYPE yylval; */

%%
[ \t\r] ;
[0-9]+[.]?[0-9]*	{
    	    yylval.anId = atof((char *)&yytext[0]);
	    return ID;
	}

\n	return NEWLINE;
.	return *yytext;
"exp" return EXP;
"log" return LOG;
%%
int
yywrap()
{
    return 1;
}
