program Project1;

type PList = ^student;
     student = record
       surname : string [255];
       mark : integer;
       next : PList;
     end;

var table : array [2..5] of Plist;
    x, head, p, newHead, temp : Plist;
    quantity, i : integer;


begin
  //искусственное создание списка
  head := nil;
  writeln('Enter the number of elements in the list');
  readln(quantity);
  for i:= 1 to quantity do
  begin
    new(x);
    writeln('Enter surname');
    readln(x^.surname);
    writeln('Enter mark');
    readln(x^.mark);
    x^.next := head;
    head := x;
  end;
  //initialise table
  for i:=2 to 5 do
      table[i] := nil;
  //заполнение таблицы
  x:=head;
  while(x<>nil) do
  begin
    new(p);
    p^.surname := x^.surname;
    p^.mark := x^.mark;
    p^.next := table[p^.mark];
    table[p^.mark] := p;
    x := x^.next;
  end;

  //Table output
  for i := 2 to 5 do
  begin
    p := table[i];
    while(p<>nil) do
    begin
         writeln(p^.surname, ' ', p^.mark);
         p := p^.next;
    end;
  writeln;
  end;

  //Сортировка двоечников
  new(newHead);
  x:=table[2];
  while(x<>nil) do
  begin
    if(x = table[2]) then
    begin
      newHead^.surname := x^.surname;
      newHead^.mark := x^.mark;
      newHead^.next := nil;
    end
    else
    begin
      new(temp);
      temp^:=x^;
      p := newHead;
      if (temp^.surname<p^.surname) then
      begin
        temp^.next := newHead;
        newHead := temp;
      end;
      while(p<>nil) do
      begin
        if(p^.surname <= temp^.surname) then
        begin
          if(p^.next = nil) then
          begin
            temp^.next := nil;
            p^.next := temp;
          end;
        end
        else if (temp^.surname >= p^.next^.surname) then
             begin
                  temp^.next := p^.next;
                  p^.next := temp;
             end;
        end;
      end;
  end;

  p:=table[2];
  while(p<>nil) do
  begin
    writeln(p^.surname, ' ', p^.mark);
    p := p^.next;
  end;
  readln;
end.
