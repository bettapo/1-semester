program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type  next = ^element;
      element = record
        surname: string[255];
        mark1: integer;
        mark2: integer;
        Next: next;
      end;
ff_rec = file of element;

var head, {Óêàçàòåëü íà íà÷àëî ñïèñêà}
    x     {Âñïîìîãàòåëüíûé óêàçàòåëü äëÿ ñîçäàíèÿ î÷åðåäíîãî ýëåìåíòà ñïèññêà}
        : next;
    quantity, mark, i: integer;
    srname: string[255];

begin
  writeln('Enter the number of students:');
  readln(quantity);

  New(x); {Ñîçäàíèå ïåðâîãî ýëåìåíòà ñïèñêà}
  x^.Next := Nil; {çàïîëíèì ïîëå Next ïåðâîãî ýëåìåíòà: óêàçàòåëü â Nil}
  Head := x; {óñòàíîâèì óêàçàòåëü ãîëîâû ñïèñêà íà ïåðâûé ýëåìåíò}

  {Çàïîëíåíèå 1 ýëåìåíòà ñïèñêà}
  writeln('Enter the name of the student:');
  readln(srname);
  x^.surname:=srname;
  writeln('Enter 1st mark:');
  readln(mark);
  x^.mark1:=mark;
  writeln('Enter 2st mark:');
  readln(mark);
  x^.mark2:=mark;
  {}
  for i:=2 to quantity
  begin

  end;
end.
