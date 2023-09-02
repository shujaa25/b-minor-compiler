%{
#include "token.h"
%}
DIGIT [0-9]
%%
(" "|\t|\n) /* skip whitespace */
\/\/.*    //comment handle
\/\*.*[*][\/] /*comment*/
array   {return TOKEN_ARRAY;}
boolean {return TOKEN_BOOLEAN;}
char    {return TOKEN_CHAR;}
else    {return TOKEN_ELSE;}
false   {return TOKEN_FALSE;}
for     {return TOKEN_FOR;}
function    {return TOKEN_FUNCTION;}
if          {return TOKEN_IF;}
integer  {return TOKEN_INTEGER;}
print  {return TOKEN_PRINT;}
return  {return TOKEN_RETURN;}
string  {return TOKEN_STRING;}
true  {return TOKEN_TRUE;}
void    {return TOKEN_VOID;}
while   {return TOKEN_WHILE;}

\+\+        {return TOKEN_POST_INCR;}
--        {return TOKEN_POST_DECR;}
\^        {return TOKEN_EXPO;}
\*        {return TOKEN_MUL;}
\/        {return TOKEN_DIV;}
%        {return TOKEN_MOD;}
\+        {return TOKEN_ADD;}
\-        {return TOKEN_SUB;}
\<        {return TOKEN_LT;}
\<\=        {return TOKEN_LTE;}
\>        {return TOKEN_GT;}
\>\=        {return TOKEN_GTE;}
\=\=        {return TOKEN_EQ;}
\!\=        {return TOKEN_NEQ;}
&&        {return TOKEN_L_AND;}
\|\|        {return TOKEN_L_OR;}
!        {return TOKEN_L_NOT;}
\=        {return TOKEN_ASSIGN;}
\(        {return TOKEN_PAREN_OPEN;}
\)        {return TOKEN_PAREN_CLOSE;}
\{        {return TOKEN_CURLY_OPEN;}
\}        {return TOKEN_CURLY_CLOSE;}
\[        {return TOKEN_SQ_OPEN;}
\]        {return TOKEN_SQ_CLOSE;}

:           {return TOKEN_COLON;}
;           {return TOKEN_SEMICOLON;}
,           {return TOKEN_COMMA;}

([_|a-zA-Z][a-zA-Z0-9]*)  {return TOKEN_IDENTIFIER;}//SET LIMIT
{DIGIT}+    {return TOKEN_NUMBER;}//SET LIMIT
\"([^"\\]|\\.|\\\n)*\"    {return TOKEN_STRING_LIT;}//SET LIMIT
'(\\?.?)'    {return TOKEN_CHAR_LIT;}//may need to handle escape seq.
.           {return TOKEN_ERROR;}
%%
int yywrap() { return 1; }