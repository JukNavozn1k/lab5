

Program SortStuff;

Uses Crt, Dos;

Type
    AType = Array [1..1000000] of Longint;
    Pocket = Array[0..9] of AType;

Var
   Ran    : AType;
   MaxData : Longint;
   PPocket,NPocket : Pocket;
  

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

begin
  For I := 1 to MaxData do
    Write (A [I] : 5);
  Writeln;
end;

Procedure RadixSort (Var A : AType; MaxData : Longint);
Var

  I,J,divisor,ListNo,Number   : Longint;
begin
  
  divisor := 1;
  While divisor <= 1000 do
  begin
    I := 1;
    While I <= MaxData do
    begin
      Number := A [I];
      ListNo := Number div divisor MOD 10;
      PPocket[ListNo,i] := Number;
      I := I + 1;
    end;
    for I := 0 to 9 do 
    begin
      for J := 1 to MaxData do 
      begin
       if PPocket[I,J] <> 0 THEN A[J] := PPocket[I,J];
        PPocket[I,J] := 0;
      end;
    end;
   
    divisor := 10 * divisor;
  end;
end;

begin
  ReadData(Ran,MaxData);
  Writeln('Unsorted: ');
  WriteArray(Ran,MaxData);
  Writeln('Sorted: ');
  RadixSort(Ran,MaxData);
for e := 1 to MaxData do begin
Write(Ran[e]);
end;
Writeln();
  Readln();     
end.
// test ахдбща