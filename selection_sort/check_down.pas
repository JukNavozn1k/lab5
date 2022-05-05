var a: array[1..1000] of int64;
    f: text;
    i: integer;
    flag: boolean;

begin
    assign(f, 'output.txt');
    reset(f);
    for i:=1 to 1000 do
    begin
        read(f, a[i]);
        //write(a[i]);
        //readln;
    end;
    close(f);
    for i:=2 to 1000 do
    begin
        if a[i-1] < a[i] then flag:=false else flag:=true;
    end;
    if flag=true then writeln('Success!') else writeln('Fault!');
end.