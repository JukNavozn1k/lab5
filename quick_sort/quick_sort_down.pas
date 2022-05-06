uses dos;

var a: array [0..1000000] of int64;
    size,i,before,after: longint;
    f,output: text;
    hr,min,sec,sec_100: word;

function fGetTime: LongInt;

var hr,min,sec,sec_100: word;

begin
    GetTime(hr, min, sec, sec_100);
    fGetTime := longint(hr)*360000 + longint(min)*6000 + sec*100 + sec_100;
end;

function up(a,b: int64): boolean;

begin
    if a < b then up:=true else up:=false;
end;

function down(a,b: int64): boolean;

begin
    if a > b then down:=true else down:=false;
end;

procedure quick_sort(m,l: longint);

var i,j: longint;
    c,cahce: int64;

begin
    i:=m;
    j:=l;
    c:=a[(m+l) div 2]; //середина массива
    repeat
        while down(a[i], c) do inc(i);
        while down(c, a[j]) do dec(j);
        if i <= j then 
        begin
            cahce:=a[i];
            a[i]:=a[j];
            a[j]:=cahce;
            inc(i);
            dec(j);
        end;
    until (i > j);
    if m < j then quick_sort(m, j); //сортировка левых подмассивов
    if i < l then quick_sort(i, l); //сортировка правых подмассивов
end;

begin
    before:=fGetTime;
    assign(f, 'input.txt');
    reset(f);
    readln(f, size);
    for i:=1 to size do
    begin
        read(f, a[i]);
    end;
    quick_sort(1, size);
    close(f);
    assign(output, 'output.txt');
    rewrite(output);
    for i:=1 to size do write(output, a[i], ' ');
    close(output);
    after:=fGetTime;
    writeln('Сортировка заняла ', (after - before) / 100:0:2,' секунды')
end.