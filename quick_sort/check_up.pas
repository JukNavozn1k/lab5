const
    size=1000;

var a: array[1..size] of int64;
    f: text;
    i: longint;
    flag: boolean;

begin
    assign(f, 'output.txt');
    reset(f);
    for i:=1 to size do
    begin
        read(f, a[i]);
        //write(a[i]);
        //readln;
    end;
    close(f);
    for i:=2 to size do
    begin
        if a[i-1] < a[i] then flag:=true else flag:=false;
    end;
    if flag=true then writeln('Success!') else writeln('Fault!');
end.