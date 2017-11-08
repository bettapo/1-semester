{Удалить максимальный элемент в списке}

program Project1;

type PList=^myRecord;
     myRecord = record
       info : integer;
       next : PList;
     end;

var quantity, i, max : integer;
    x, head, prev, del : PList;
    wasDeleted : boolean;


begin
  head := nil;
  max := 0; //Считаем, что все элементы списка положительны

  //Filling the list
  writeln('Enter the number of list items: ');
  readln (quantity);
  for i := 1 to quantity do
  begin
     new(x);
     writeln ('Fill in the item data: ');
     readln(x^.info);
     x^.next := head;
     head := x;
  end;

  //Find max element
  x := head;
  while (x<>nil) do
  begin
       if (x^.info > max) then
          max := x^.info;
       x := x^.next;
  end;

  //Output
  {x := head;
  writeln;
  while (x<>nil) do
  begin
     write(x^.info, ' ');
     x := x^.next;
  end;}

  //Delete max element
  x := head^.next;
  prev := head;
  while (x<>nil) do
  begin
       wasDeleted := false;
       if (x^.info = max) then
       begin
            prev^.next := x^.next;
            wasDeleted := true;
       end
       else prev := x;
       del := x;
       if (wasDeleted = true) then
            dispose(del);
       x := prev^.next;
  end;

  //Delete first element, if it is max
  if (head^.info = max) then
  begin
       del := head;
       head := head^.next;
       dispose(del);
  end;

  //Output
  x := head;
  writeln;
  while (x<>nil) do
  begin
     write(x^.info, ' ');
     x := x^.next;
  end;
  readln;
end.
