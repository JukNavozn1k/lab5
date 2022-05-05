var a: array[1..1000] of longint;
    f: text;
    i: integer;
    flag: boolean;

begin
    assign(f, 'output.txt');
    reset(f);
    for i:=1 to 1000 do
    begin
        read(f, a[i]);
    end;
    close(f);
    for i:=2 to 1000 do
    begin
        if a[i-1] < a[i] then flag:=true else flag:=false;
    end;
    if flag=true then writeln('Success!') else writeln('Fault!');
end.