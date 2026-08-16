%option noyywrap

%{
#include <stdio.h>

long linhas = 0;
long palavras = 0;
long caracteres = 0;
long inteiros = 0;
long floats = 0;
long pontuacoes = 0;
%}

%%

[0-9]+\.[0-9]+   { floats++;     caracteres += yyleng; }
[0-9]+            { inteiros++;   caracteres += yyleng; }
[a-zA-Z]+         { palavras++;   caracteres += yyleng; }
[.,;:!?]          { pontuacoes++; caracteres += yyleng; }
\n                { linhas++;     caracteres += yyleng; }
.                  {               caracteres += yyleng; }

%%

int main(void)
{
    yylex();

    printf("linhas: %ld\n", linhas);
    printf("palavras: %ld\n", palavras);
    printf("caracteres: %ld\n", caracteres);
    printf("inteiros: %ld\n", inteiros);
    printf("floats: %ld\n", floats);
    printf("pontuacoes: %ld\n", pontuacoes);

    return 0;
}
