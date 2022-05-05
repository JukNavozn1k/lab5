var arr: array [0..1000000] of int64;
    size,i: longint;
    f,output: text;

function comparator(a,b: longint): boolean;
begin
    if (a > b) then comparator:=true else comparator:=false;
end;

procedure quick_sort(m,l: longint);

var i,j: longint;
    x,tmp: int64;

begin
    i:=m;
    j:=l;
    x:=arr[(m+l) div 2];
    repeat
        while arr[i] < x do inc(i);
        while arr[j] > x do dec(j);
        if i <= j then 
        begin
            tmp:=arr[i];
            arr[i]:=arr[j];
            arr[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until (i > j);
    if m < j then quick_sort(m, j);
    if i < l then quick_sort(i, l);
end;

begin
    assign(f, 'input.txt');
    reset(f);
    readln(f, size);
    for i:=1 to size do
    begin
        read(f, arr[i]);
    end;
    quick_sort(1, size);
    close(f);
    assign(output, 'output.txt');
    rewrite(output);
    for i:=1 to size do write(output, arr[i], ' ');
    close(output);
end.