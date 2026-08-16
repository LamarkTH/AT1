%option noyywrap

%{
#include <stdio.h>
%}

%%

"//"[^\n]*                    { /* descarta comentario de linha */ }
"if"                          { printf("IF\n"); }
"else"                        { printf("ELSE\n"); }
"while"                       { printf("WHILE\n"); }
"return"                      { printf("RETURN\n"); }
[a-zA-Z_][a-zA-Z0-9_]*        { printf("ID %s\n", yytext); }
[0-9]+(\.[0-9]+)?             { printf("NUMBER %s\n", yytext); }
[ \t\r\n]+                    { /* ignora espacos, tabs e quebras de linha */ }
.                              { printf("SIMBOLO %s\n", yytext); }

%%

int main(void)
{
    yylex();
    return 0;
}
