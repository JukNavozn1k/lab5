var a: array [0..1000] of longint;
    size,i: integer;
    f,output: text;

function up(a,b: longint): boolean;

begin
    if a > b then up:=true else up:=false;
end;

function down(a,b: longint): boolean;

begin
    if a < b then down:=true else down:=false;
end;

procedure sel_sort(a: array of longint; size: integer);

var i, j, min_index: integer;
    cache: int64;

begin
    assign(output, 'output.txt');
    rewrite(output);
    for i:=1 to size do
    begin
        min_index:=i;
        for j:=i+1 to size do
        begin
            if down(a[min_index], a[j]) then min_index:=j; 
        end;
        cache:=a[i];
        a[i]:=a[min_index];
        a[min_index]:=cache;
        write(output, a[i], ' ');
    end;
    close(output);
end;

begin
    assign(f, 'input.txt');
    reset(f);
    readln(f, size);
    for i:=1 to size do
    begin
        read(f, a[i]);
    end;
    sel_sort(a, size);
    close(f);
end.