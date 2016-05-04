%{
#include <stdio.h>
#include <math.h>
%}

%token <anId>	ID NEWLINE LOG EXP
%type <anId>	S E T F N

%right '^'

%union {
    double anId;
}

%%
/*unchanged from assignment 0*/
S	:
	{$$ = 0; }
	| S E NEWLINE
	{ printf ("Result is %f\n", $2); $$ = 0;	} 
	;

/*Parsing Rules*/
/*It was not indicated if the division or subtraction opertors*/
/*were to be included in the assignment so they were ignored*/
/*if there is a need to test their functionality*/
/*remove the comments that enclose them*/
E	: E '+' T
	{ $$ = $1 + $3; }
/*	: E '-' T*/	/*assumed to have same order of preference as '+'*/
  /*    { $$ = $1 + $3; }*/
	| T
	;

T	: T '*' F
	{$$ = $1 * $3;	}
/*	|T '/' F*/	/*assumed to have same order of preference as '*'*/
/*	{$$ = $1 * $3;	}*/
	|F
	;

F	: F '^' N
	{$$  = pow($1,$3);}
	|LOG '('N')'
	{$$ = log($3);}
	|EXP '('N')'	
	{$$ = exp($3);}
	|N
	{ $$ = $1;}
	;
N	: '('E')'
	{ $$ = $2;}
	|ID
	{ $$ = $1;}
	;
%%
int
yyerror( char * s )
{
    fprintf( stderr, "%s\n", s );
    return 0;
}
