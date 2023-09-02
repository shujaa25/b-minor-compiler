#include "token.h"
#include <stdio.h>
extern FILE *yyin;
extern int yylex();
extern char *yytext;
int main() {
    yyin = fopen("D:\\Workspace\\CLionProjects\\compiler\\program.b","r");
    if(!yyin) {
        printf("could not open program.b!\n");
        return 1;
    }
    while(1) {
        token_t t = yylex();
        if(t==TOKEN_EOF) break;
        if(t == TOKEN_ERROR){
            printf("error");

        }
        printf("token: %d text: %s\n",t,yytext);
    }
}