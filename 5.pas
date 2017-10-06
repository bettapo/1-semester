{В m файлах создать сведения о студентах m групп. Формат сведений: № группы, порядковый номер, фамилия, имя, отчество.
 Выбрать всех однофамильцев из всех групп и сформировать из них последовательность. Обеспечить мвывод сведений о каждой
 группе и результаты поиска однофамильцев. Сортировка сведений выполняется методом всатвок.}
  
program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type student = record
     groupNumber: integer;
     studentNumber: integer;
     surname: string[255];
     name: string[255];
     patronymic: string[255];
end;
ff_rec = file of student;

var groupList: ff_rec;
    fileName : string[20];
    person, tmp: student;
    forReading: ff_rec;
    i, j, count: integer;
    sort: array[1..100] of student;

Procedure Enter(groupNum, Nomer: integer);
begin
    with Person do
    begin
        groupNumber:=groupNum;
        studentNumber:=Nomer;
        writeln('Enter student surname:');
        readln(surname);
        writeln('Enter student name:');
        readln(name);
        writeln('Enter student patronymic:');
        readln(patronymic);
        write(groupList, Person);
    end;
end;

Procedure fillingFile;
var quantity, i, grNum: integer;
begin
    writeln('Enter the file name');
    readln(fileName);
    assign(groupList, fileName);


    writeln('Enter the number of students:');
    readln(quantity);
    writeln('Enter the group number:');
    readln(grNum);
    rewrite(groupList);
    for i:=1 to quantity do
        Enter(grNum, i);
    close(groupList);
    readln;
end;
begin
  fillingFile;
  assign(forReading, fileName);
  reset(forReading);
  count:= 0;

  while not Eof(forReading) do
  begin
      read(forReading, person);
      writeln(person.groupNumber, ' ', person.studentNumber, ' ', person.name, ' ', person.surname, ' ', person.patronymic);
      count:= count+1;
      sort[count]:= person;
  end;

  for i:=1 to count do
  begin
    for j:=i downto 1  do
      if (sort[j-1].surname > sort[j].surname) then
      begin
        tmp:=sort[j-1];
        sort[j-1]:=sort[j];
        sort[j]:=tmp;
      end;
  end;
  for i:=1 to count do
    writeln(sort[i].groupNumber, ' ', sort[i].studentNumber, ' ', sort[i].name, ' ', sort[i].surname, ' ', sort[i].patronymic);

  for i:=2 to count do
    if(sort[i].surname<>sort[i-1].surname) and (exist=1) then
    begin
      for j:=i to count do
        sort[j]:=sort[j+1];
      count:= count - 1;
      exist:= 1;
    end
    else exist:= exist+1;

  for i:=1 to count do
    writeln(sort[i].groupNumber, ' ', sort[i].studentNumber, ' ', sort[i].name, ' ', sort[i].surname, ' ', sort[i].patronymic);
  readln;
end.
