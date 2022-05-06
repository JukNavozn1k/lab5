Program SortStuff;

Uses Crt, Dos;

Type
    AType = Array [1..1000000] of int64;
    Pocket = Array[0..9] of AType;

Var
   Ran    : AType;
   MaxData : Longint;
   PPocket,NPocket : Pocket;
  hr,min,sec,sec_100: word;
  before,after: longint;

function fGetTime: LongInt;

var hr,min,sec,sec_100: word;

begin
    GetTime(hr, min, sec, sec_100);
    fGetTime := longint(hr)*360000 + longint(min)*6000 + sec*100 + sec_100;
end;

// ������ ������� �� ����� input.txt
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
// ����� ������� � ���� output.txt
Procedure WriteArray (A : AType; MaxData : int64);
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
// ������� ��������
procedure ClearPockets(MaxData: Longint);
var i,j:Longint;
begin
for i := 0 to 9 do begin for j := 1 to MaxData do begin PPocket[i,j] := -1;NPocket[i,j] := -1;end;end;
end;
// ���������� ������� �� ��������
procedure Fill(Var A: AType;MaxData:Longint);
var i,j,k : Longint;
begin
k := 1;
// ���������� �������������� �������
for i := 9 downto 0 do begin
for j := 1 to MaxData do begin
if NPocket[i,j] <> -1 then begin
A[k] :=-1* NPocket[i,j];
k := k + 1;
end;
end;
end;
// ���������� �������������� �������
for i := 0 to 9 do begin
for j := 1 to MaxData do begin
if PPocket[i,j] <> -1 then begin
A[k] := PPocket[i,j];
k := k + 1;
end;
end;
end;
end;


Procedure RadixSort (Var A : AType; MaxData : int64);
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
end
else  begin
Number := Number * -1;
ListNo := Number div divisor mod 10;
NPocket[ListNo,i] := Number;
end;

end;
Fill(A,MaxData);
divisor := divisor * 10;
end;
end;

begin
  before:=fGetTime;
  ReadData(Ran,MaxData);  
  RadixSort(Ran,MaxData);
  WriteArray(Ran,MaxData);
  after:=fGetTime;
  writeln('���������� ������ ', (after - before) / 100:0:2,' �������')
end.