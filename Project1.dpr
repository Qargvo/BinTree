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
    n:Cardinal;
    k:Byte;
procedure get_empty_tree(knot:PntBinTree;inp:byte);

begin
if inp > 1 then
  New(knot^.gnext);
  get_empty_tree(knot^.GNext,inp-1);
  New(knot^.lnext);
  get_empty_tree(knot^.Lnext,inp-1);
end;
function get_level(inp:cardinal):byte;
var i:Cardinal;
begin
  Result:=1;
  i:=2;
  while i < inp do
    begin
      Inc(Result);
      Inc(i,i);
    end;
end;
begin
Write('Input amount of numbers: ');
Readln(n);
get_empty_tree();

end.
 