var a: array [0..1000000] of int64;
    size,i: longint;
    f,output: text;

procedure quick_sort(m,l: longint);

var i,j: longint;
    c,cahce: int64;

begin
    i:=m;
    j:=l;
    c:=a[(m+l) div 2]; //середина массива
    repeat
        while a[i] < c do i+=1;
        while a[j] > c do j-=1;
        if i <= j then 
        begin
            cahce:=a[i];
            a[i]:=a[j];
            a[j]:=cahce;
            i+=1;
            j-=1;
        end;
    until (i > j);
    if m < j then quick_sort(m, j); //сортировка левых подмассивов
    if i < l then quick_sort(i, l); //сортировка правых подмассивов
end;

begin
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
end.