program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  PntBinTree = ^bintree;
  BinTree = record
    num: Integer;
    BF: ShortInt;
    counter: Byte;
    GNext, Lnext: PntBinTree;
  end;

var
  n,nol: Cardinal;
  k: Byte;
  head: PntBinTree;
   outpul:pntbintree;
procedure get_empty_tree(knot: PntBinTree; inp: byte);

begin
  if inp > 1 then
  begin
    New(knot^.gnext);
    get_empty_tree(knot^.GNext, inp - 1);
    New(knot^.lnext);
    get_empty_tree(knot^.Lnext, inp - 1);
  end;
end;

procedure fill_bin_tree(pnt: PntBinTree; num: cardinal;d:cardinal);
begin
  pnt^.num := num;
  d:=d div 2;
  pnt^.BF := 0;
  pnt^.counter := 0;
  if pnt^.lnext <> nil then
    fill_bin_tree(pnt^.Lnext, num - d,d);
  if pnt^.gnext <> nil then
    fill_bin_tree(pnt^.Gnext, num + d, d);
end;

procedure write_bin_tree(pnt: PntBinTree);
begin
  if pnt^.Lnext <> nil then
    write_bin_tree(pnt^.Lnext);
  write(pnt^.num,' ');
  if pnt^.gnext <> nil then
    write_bin_tree(pnt^.gnext);
end;
function PAW(a,b:cardinal):Cardinal;
var i:cardinal;
begin
  result:=a;
for i := 2 to b do
  result:=result*a;
end;
function get_level(inp: cardinal): byte;
var
  i: Cardinal;
begin
  Result := 1;
  i := 2;
  while i < inp do
  begin
    Inc(Result);
    Inc(i, i);
  end;
end;
function find_in_bin_tree(pnt:pntbintree;inf:integer):pntbintree;
begin
  result:=nil;
  while true do
  begin
  if inf = pnt^.num then
    begin
    result := pnt;
    exit;
    end;
  if inf < pnt^.num then
    begin
      if pnt^.lnext = nil then
        exit;
      pnt := pnt^.lnext;
      continue;
    end
  else
    begin
    if pnt^.gnext = nil then
        exit;
      pnt := pnt^.gnext;
      continue;
    end;
  end;
end;
begin
  Write('Input amount of numbers: ');
  Readln(n);
  New(head);
  get_empty_tree(head, n);
  nol:=paw(2,n-1);
  fill_bin_tree(head, nol, nol);
  Writeln;
  write_bin_tree(head);
  readln(n);
  outpul:=find_in_bin_tree(head,n);
  if outpul <> nil then
  write(outpul^.num,' ',outpul^.counter,' ',outpul^.bf)
  else write('No find');
  Readln;
end.
 
