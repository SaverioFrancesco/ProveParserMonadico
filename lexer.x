

-- lexer per linguaggio WHILE


{

module Main (main) where
--module Lexer where


	--$printable
}

%wrapper "basic"

$digit = [0-9]            -- digits
$alpha = [a-zA-Z]         -- alphabetic characters
tokens :-



\n                  {\s-> EndOfLine}
&!					{\s->Comment}
while               {\s->While}
\{                  {\s->OpenBlk}
\}                  {\s->CloseBlk}
\;					{\s->EndCmd}
\=					{\s->Asignment}
eq					{\s->Equals}
not					{\s->Not}
or					{\s->Or}
\>					{\s->More}
var 				{\s->VariableLab}
\+					{\s->Plus}
\*					{\s->Mult}
\(					{\s->OpenGuard}
\)					{\s->CloseGuard}
\-?$digit+				{\s->Integer (read s :: Int)}
$alpha($alpha|$digit)*  {\s->Text  s }
$white+ 			;


{
data Token = Comment | OpenGuard | CloseGuard |
	While|
	OpenBlk|
	CloseBlk|
	EndCmd|
	Asignment|
	Equals|
	Not|
	Or|
	More|
	VariableLab|
	Integer Int|
	Text String |
	Plus| Mult | EndOfLine
	deriving(Eq,Show)

--esempio = "var stringa = ciao; var x = 6+7; while(x == 5 or not x > 10){ \n x=x+1;  \n stringa=stringa+pollo; };"
main = do 
	s <- getContents
	print(alexScanTokens s  )
}








