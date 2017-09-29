program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type student = record
    groupNumber: integer;
    studentNumber: integer;
    surname: string;
    name: string;
    patronymic: string;
end;
ff_rec = file of rec;

var table: array [1..20] of student;
    f_r: ff_rec;
    quantity, i, grNum: integer;

begin
    assign(f_r, 'My_rec.dat');
    writeln('Enter the number of students:');
    readln(quantity);
    writeln('Enter the group number:');
    readln(grNum);
    for i:=0 to quantity do begin
        table[i].groupNumber:=grNum;
        writeln('Enter the group number:');

    end;
  {while not Eof(f) do
    begin
      read(f, S);
      writeln(S:2, ord(S):4);
    end;
  close(f); }
  readln
end.
