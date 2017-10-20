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

var head, honorsHead, loserHead, otherHead, point : pointer;
    menu : integer;
    generalList, forReading : ff_rec;
    temp : element;

Function Push(var first : pointer; srname: string; mark1, mark2 : integer ) : pointer;
var x : pointer;
begin
     New(x); {Creating a pointer to a new item}
     x^.Next := first;
     x^.surname := srname;
     x^.mark1 := mark1;
     x^.mark2 := mark2;
     Push := x;
end;

Procedure Add();
var digitSurname : string[255];        {Variables to create the list}
    digitMark1, digitMark2 : integer;  {Variables to create the list}
begin
     writeln ('Enter the info about students. To finish entering, type *');
     readln(digitSurname);
     while (digitSurname<>'*') do
     begin
          readln(digitMark1, digitMark2);
          head := Push(head, digitSurname, digitMark1, digitMark2);
          if(digitMark1 = 5) and (digitMark2 = 5) then
             honorsHead := Push(honorsHead, digitSurname, digitMark1, digitMark2)
             else if (digitMark1 = 2) or (digitMark2 = 2) or (digitMark1 = 1) or (digitMark2 = 1) then
                     loserHead := Push(loserHead, digitSurname, digitMark1, digitMark2)
                  else otherHead := Push(otherHead, digitSurname, digitMark1, digitMark2);
          readln(digitSurname);
    end;
end;

Procedure Output (p : pointer);
begin
     while (p<>Nil) do
     begin
          writeln(p^.surname, ' ', p^.mark1, ' ', p^.mark2);
          p := p^.Next;
     end;
     writeln;
end;

begin
     assign(generalList, 'general.dat');
     assign(forReading, 'general.dat');
     {Initialize lists}
     head := Nil;
     honorsHead := Nil;
     loserHead := Nil;
     otherHead := Nil;
     {}

     Add();

     repeat
           writeln('Enter 1 to add new students in list.');
           writeln ('Enter 2 to output all lists.');
           writeln ('Enter 3 to end save general list.');
           writeln ('Enter 4 to view the saved data.');
           writeln ('Enter 0 to end work with program.');
           readln(menu);
           if (menu = 1) then
              Add();
           if (menu = 2) then
           begin
                {General list output in the console}
                writeln('General list: ');
                Output(head);

                {List of honors pupils output in the console}
                writeln('List of honors pupils: ');
                Output(honorsHead);

                {List of losers output in the console}
                writeln('List of losers: ');
                Output(loserHead);

                {List of others output in the console}
                writeln('List of others: ');
                Output(otherHead);
           end;
           if (menu = 3) then
           begin
             rewrite(generalList);
             point := head;
             while (point<>Nil) do
             begin
              temp.Next := point^.Next;
              temp.surname := point^.surname;
              temp.mark1 := point^.mark1;
              temp.mark2 := point^.mark2;
              point := point^.Next;
              write (generalList, temp);
             end;
           end;
           if (menu = 4) then
           begin
              reset(forReading);
              while not Eof(forReading) do
              begin
                read(forReading, temp);
                writeln(temp.surname, ' ', temp.mark1, ' ', temp.mark2);
              end;
           end;
     until (menu = 0) ;
     readln;
end.
