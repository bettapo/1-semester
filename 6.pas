program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type  pointer = ^element;
      element = record
        surname: string[255];
        mark1: integer;
        mark2: integer;
        Next: pointer;
      end;
ff_rec = file of element;

var head, p {A pointer to the first element}
    //x     {Additional pointer to create the next list item}
        : pointer;
    //quantity, mark, i: integer;
    //srname: string[255];

Procedure Init(Var u : pointer);
Var
  x : pointer;
  digitSurname : string[255];
  digitMark1, digitMark2: integer;
begin
  writeln('Enter the list');
  //u := Nil; {The list is empty}
  writeln ('Enter the list items. To finish entering, type *');
  readln(digitSurname, digitMark1, digitMark2);
  //readln;
  if (digitSurname <> '*') then {Generate and insert the first element of the list}
      begin
        //New(x);
        u^.Next := Nil;
        u^.surname := digitSurname;
        u^.mark1 := digitMark1;
        u^.mark2 := digitMark2;
        x := u;
        readln (digitSurname);
        readln (digitMark1);
        readln (digitMark2);
        while (digitSurname <> '*') do
          begin
            New(x^.Next); {Create and insert an element at the end of the list}
            x := x^.Next;
            x^.Next := Nil;
            x^.surname := digitSurname;
            x^.mark1 := digitMark1;
            x^.mark2 := digitMark2;
            readln (digitSurname);
            readln (digitMark1);
            readln (digitMark2);
          end;
      end;
End;



begin
     New(head);
     Init(head);

     {List output in the console}
     p := head;
     while p<>Nil do
     begin
          writeln(p^.surname, ' ', p^.mark1, ' ', p^.mark2);
          p := p^.Next;
     end;
     {}

end.
