Program SortStuff;
Uses dos;


Type
    AType = Array [1..1000000] of int64;
    Pocket = Array[0..9] of AType;

Var
   Ran    : AType;
   MaxData,start,stop : Longint;
   PPocket,NPocket : Pocket;
   PElCount,NElCount: array[0..9] of LongInt;


Procedure ReadData (Var A : AType; Var MaxData : Longint);

Var I : Longint;
    f:text;

begin
     assign(f,'input.txt');
     reset(f);
     readln(f,MaxData);
     For I := 1 to MaxData do read(f,A[i]);
     close(f);
end;

Procedure WriteArray (A : AType; MaxData : Longint);
Var I : Longint;
    f: text;
begin
     assign(f,'output.txt');
    rewrite(f);
    for i := 1 to MaxData do begin
    write(f,A[i],' ');
    end;
    close(f);
end;

procedure ClearPockets(MaxData: Longint);
var i,j:Longint;
begin
for i := 0 to 9 do begin
//if (PElCount[i] = 0) and (NElCount[i] = 0) then continue;
for j := 1 to MaxData do begin 
PPocket[i,j] := -1;
NPocket[i,j] := -1;
end;
PElCount[i] :=0;
NElCount[i] := 0;
end;
end;

procedure Fill(Var A: AType;MaxData:Longint);
var i,j,k : Longint;
begin
k := 1;

for i := 9 downto 0 do begin
if NElCount[i] = 0 then continue;
for j := 1 to MaxData do begin
if NPocket[i,j] <> -1 then begin
A[k] :=-1* NPocket[i,j];
k := k + 1;
end;
end;
end;

for i := 0 to 9 do begin
if PElCount[i] = 0 then continue;
for j := 1 to MaxData do begin
if PPocket[i,j] <> -1 then begin
A[k] := PPocket[i,j];
k := k + 1;
end;
end;
end;
end;


Procedure RadixSort (Var A : AType; MaxData : Longint);
Var

  i,divisor,ListNo,Number   : Longint;
begin
divisor := 1;
while divisor <= 1000000000 do begin
ClearPockets(MaxData);
for i := 1 to MaxData do 
begin
Number := A[i];
if Number >= 0 then begin
ListNo := Number div divisor mod 10;
PPocket[ListNo,i] := Number;
PElCount[ListNo] := PElCount[ListNo] + 1;
end
else  begin
Number := Number * -1;
ListNo := Number div divisor mod 10;
NPocket[ListNo,i] := Number;
NElCount[ListNo] := NElCount[ListNo] + 1;
end;
end;
Fill(A,MaxData);
divisor := divisor * 10;
end;
end;

begin

  ReadData(Ran,MaxData);  
  RadixSort(Ran,MaxData);
  WriteArray(Ran,MaxData);

end.