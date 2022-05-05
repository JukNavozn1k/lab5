Program SortStuff;

Uses Crt, Dos;

Type
AType = Array [1..1000000] of Longint;
Ptr = ^Node;
Node = Record
Info : Integer;
Link : Ptr;
end;
LType = Array [0..9] of Ptr;

Var
Ran : AType;
MaxData : Integer;
// СОЗДАНИЕ МАССИВА => Сделать чтение из файла
Procedure ReadData (Var A : AType; Var MaxData : Longint);

Var I : Longint;
input_file : text;

begin
assign(input_file,'input.txt');
reset(input_file);
readln(input_file,MaxData);
For I := 1 to MaxData do read(input_file,A[I]);
close(input_file);
end;
// вывод массива => в output.txt
Procedure WriteArray (A : AType; MaxData : Integer);

Var I : Integer;

begin
For I := 1 to MaxData do
Write (A [I] : 10);
Writeln;
end;

Procedure Insert (Var L : LType; Number, LN : Longint);

Var
P, Q : Ptr;

begin
New (P);
P^.Info := Number;
P^.Link := Nil;
Q := L [LN];
if Q = Nil then
L [LN] := P
else
begin
While Q^.Link <> Nil do
Q := Q^.Link;
Q^.Link := P;
end;
end;


Procedure Refill (Var A : AType; Var L : LType);
Var
I, J : Integer;
P : Ptr;
begin
J := 1;
For I := 0 to 9 do
begin
P := L [I];
While P <> Nil do
begin
A [J] := P^.Info;
P := P^.Link;
J := J + 1;
end;
end;
For I := 0 to 9 do
L [I] := Nil;
end;

Procedure RadixSort (Var A : AType; MaxData : Longint);
Var
P,N : LType;
I,
divisor,
ListNo,
Number : Integer;
begin
For I := 0 to 9 do L [I] := Nil;
divisor := 1;
While divisor <= 1000000000 do
begin
I := 1;
While I <= MaxData do
begin
Number := A [I];
ListNo := Number div divisor MOD 10;
Insert (L, Number, ListNo);
I := I + 1;
end;
Refill (A, L);
divisor := 10 * divisor;
end;
end;

begin
ReadData (Ran, MaxData);
Writeln ('Unsorted : ');
WriteArray (Ran, MaxData);
RadixSort (Ran, MaxData);
Writeln ('Sorted : ');
WriteArray (Ran, MaxData);
Readln();
end.
