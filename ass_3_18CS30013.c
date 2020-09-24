#include<stdio.h>
#include "header.h"

extern int yylex ();
extern char* yytext;

int main()
{
    extern FILE* yyin;
    yyin = fopen("test.c","r");

    int token;
    while(token = yylex())
    {
        switch (token)
        {
            case KEYWORD:
                printf("<keyword,%d,%s>\n",token,yytext);
                break;
            case IDENTIFIER:
                printf("<IDENTIFIER,%d,%s>\n",token,yytext);
                break;
            case INTEGER_CONSTANT:
                printf("<INTEGER_CONSTANT,%d,%s>\n",token,yytext);
                break;
            case FLOATING_CONSTANT:
                printf("<FLOATING_CONSTANT,%d,%s>\n",token,yytext);
                break;
            case C_CHAR_CONSTANT:
                printf("<C-CHAR_CONSTANT,%d,%s>\n",token,yytext);
                break;
            case S_CHAR_CONSTANT:
                printf("<S_CHAR_CONSTANT,%d,%s>\n",token,yytext);
                break;
            case PUNCTUATOR:
                printf("<PUNCTUATOR,%d,%s>\n",token,yytext);
                break;
        
        default:
            break;
        }
    }
    fclose(yyin);
    return 0;
}