var a: array[1..1000] of int64;
    f: text;
    i: integer;
    flag: boolean;

begin
    i:=1;
    assign(f, 'output.txt');
    reset(f);
    while eof(f)=false do
    begin
        read(f, a[i]);
        i:=1;
    end;
    for i:=2 to 1000 do
    begin
        if a[i-1] > a[i] then flag:=false else flag:=true;
    end;
    if flag=true then writeln('Success!') else writeln('Fault!');
end.