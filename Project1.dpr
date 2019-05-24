program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  PntBinTree = ^bintree;
  BinTree = record
    num :Integer;
    GNext, Lnext:PntBinTree;
  end;

  var
    k,n:Cardinal;
function level(inp:Cardinal);

begin
Write('Input amount of numbers: ');
Readln(n);


end.
 