

Program SortStuff;

Uses Crt, Dos;

Type
    AType = Array [1..1000000] of Longint;
    Pocket = Array[0..9] of AType;

Var
   Ran    : AType;
   MaxData : Longint;
   PPocket,NPocket : Pocket;
  
// Чтение массива из файла input.txt
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
// Вывод массива
Procedure WriteArray (A : AType; MaxData : Longint);

Var I : Longint;
    f: text;

begin
  For I := 1 to MaxData do
    Write (A [I] : 5);
  Writeln;
end;
// Очистка карманов
procedure ClearPockets(MaxData: Longint);
var i,j:Longint;
begin
for i := 0 to 9 do begin for j := 1 to MaxData do begin PPocket[i,j] := -1;NPocket[i,j] := -1;end;end;
end;
// Заполнение массива из карманов
procedure Fill(Var A: AType;MaxData:Longint);
var i,j,k : Longint;
begin
k := 1;
// Заполнение отрицательными числами
{for i := 0 to 9 do begin
for j := MaxData downto 1 do begin
if PPocket[i,j] <> -1 then begin
A[k] := PPocket[i,j];
k := k + 1;
end;
end;
end;}
// Заполнение положительными числами
for i := 0 to 9 do begin
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

  i,j,divisor,ListNo,Number   : Longint;
begin
divisor := 1;
while divisor <= 100 do begin
ClearPockets(MaxData);
for i := 1 to MaxData do 
begin
Number := A[i];
ListNo := Number div divisor mod 10;
PPocket[ListNo,i] := Number;
end;
Fill(A,MaxData);
divisor := divisor * 10;
end;
end;

begin
  ReadData(Ran,MaxData);
 { Writeln('Unsorted: ');
  WriteArray(Ran,MaxData);
  Writeln('Sorted: ');}
  
  RadixSort(Ran,MaxData);
  
WriteArray(Ran,MaxData);
end.
