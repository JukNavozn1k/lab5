program InsertionSort;

function comparator(c,p:longint) : boolean;
begin
// c < p - min to max
// c > p - max to min
if (c < p) then comparator := true
else comparator := false;
end;
procedure sort(var a : array of longint;len:longint);
var i,j,swap :longint;
begin
    i := 1;
    while i < len do begin
    j := i;
    while (j > 0) and comparator(a[j],a[j-1]) do begin
    swap := a[j];
    a[j] := a[j-1];
    a[j-1] := swap;
    j := j-1;
    end;
    i := i + 1;
    end;
    if comparator(a[i-1],a[i-2]) then
    begin
    swap := a[i-1];
    a[i-1] := a[i-2];
    a[i-2] := swap;
    end;
end;
var count,i : longint;
var f:text;
var a : array[1..1000] of longint;
    begin

    assign(f,'input.txt');
    reset(f);
    readln(f,count);
    for i := 1 to count do begin
    read(f,a[i]);

    end;
    sort(a,count);
    close(f);
    assign(f,'output.txt');
    rewrite(f);
    for i := 1 to count do begin
    write(f,a[i],' ');
    end;
    close(f);
    end.
