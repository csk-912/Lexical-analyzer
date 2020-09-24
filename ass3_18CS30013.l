%{
	// C declarations and definitions
	#include "header.h"
%}

/*Regular expressions definitions*/
keyword       break|case|char|continue|default|do|double|else|extern|float|for|goto|if|int|long|return|short|sizeof|static|struct|switch|typedef|union|void|while
identifier    [a-zA-Z_][a-zA-Z0-9_]*
integer-constant   [1-9][0-9]*                                                                   
digit-sequence [0-9]+
exponent_part  [eE][+-]?{digit-sequence}
fractional-constant  ({digit-sequence}?[.]{digit-sequence})|{digit-sequence}[.]
floating-constant    ({fractional-constant}{exponent_part}?)|{digit-sequence}{exponent_part}
escape_sequence    "(\')"|"(\")"|"\?"|"\\"|"\a"|"\b"|"\f"|"\n"|"\r"|"\t"|"\v"
c_char             [^(\)(')(\n)]*|{escape_sequence}
c_char_sequence    {c_char}+
c_char_constant    [']{c_char_sequence}[']
s_char             [^(\)(")(\n)]*|{escape_sequence}
s_char_sequence    {s_char}+
s_char_constant    ["]{s_char_sequence}["]
Punctuator     "["|"]"|"("|")"|"{"|"}"|"."|"->"|"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"%"|"<<"|">>"|"<"|">"|"<="|">="|"=="|"!="|"^"|"|"|"&&"|"||"|"?"|":"|";"|"..."|"="|"*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|"|="|","|"#"                                                   
Multi-lineComment        "/*"([^*]|\*+[^*/])*\*+"/"
Single-lineComment  "//"[^\n]*
WS            [ \n\t]   

%%
{keyword}             {return (KEYWORD);}
{identifier}          {return (IDENTIFIER);}
{integer-constant}    {return (INTEGER_CONSTANT);}
{floating-constant}   {return (FLOATING_CONSTANT);}
{c_char_constant}     {return (C_CHAR_CONSTANT);}
{s_char_constant}     {return (S_CHAR_CONSTANT);}
{Punctuator}          {return (PUNCTUATOR);}
{Multi-lineComment}   {}
{Single-lineComment}  {} 
{WS}                  {/*No action required*/}
%%
