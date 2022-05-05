

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
    while divisor <= 1000000000 do begin
    I := 1;
    While I <= MaxData do
    begin
      Number := A [I];
      if (Number >= 0) then 
      begin
      ListNo := Number div divisor MOD 10;
      PPocket[ListNo,I] := Number;
      end
      else begin
      Number := Number * -1;
      ListNo := Number div divisor MOD 10;
      NPocket[ListNo,I] := Number;
      end;  
      I := I + 1;
    end;
    For I := 0 to 9 do begin 
    For J := 1 to MaxData do begin
    PPocket[I,J] := 0;
    NPocket[I,J] := 0;
    end;
    end;
    divisor := 10 * divisor;
  end;
end;


begin
  ReadData(Ran,MaxData);
  RadixSort(Ran,MaxData);
  Writeln('–¿¡Œ“¿≈“!!!');
  Readln();     
end.
