{В m файлах создать сведения о студентах m групп. Формат сведений: № группы, порядковый номер, фамилия, имя, отчество.
 Выбрать всех однофамильцев из всех групп и сформировать из них последовательность. Обеспечить вывод сведений о каждой
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
    i, j, k, count, numberOfGroups: integer;
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

Procedure fillingFile(grNum: integer);
var quantity, i: integer;
begin
    writeln('Enter the file name');
    readln(fileName);
    assign(groupList, fileName);


    writeln('Enter the number of students:');
    readln(quantity);
    rewrite(groupList);
    for i:=1 to quantity do
        Enter(grNum, i);
    close(groupList);
    readln;
end;
begin
  writeln('Enter the number of groups:');
  readln(numberOfGroups);
  count:= 0;
  for k:=1 to numberOfGroups do
  begin
    fillingFile(k);
  end;

  for k:=1 to numberOfGroups do
  begin
    writeln('Enter the name of the file you want to open:');
    readln(fileName);
    assign(forReading, fileName);
    reset(forReading);
    while not Eof(forReading) do
    begin
        read(forReading, person);
        writeln(person.groupNumber, ' ', person.studentNumber, ' ', person.surname, ' ', person.name, ' ', person.patronymic);
        count:= count+1;
        sort[count]:= person;
    end;
  end;
  writeln;

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

  {for i:=1 to count do
      writeln(sort[i].groupNumber, ' ', sort[i].studentNumber, ' ', sort[i].surname, ' ',sort[i].name, ' ', sort[i].patronymic); //для проверки сортировки, при сдаче этот вывод не нужен

  writeln;}

  writeln('List of the namesakes:');
  if(sort[1].surname=sort[2].surname) then
      writeln(sort[1].groupNumber, ' ', sort[1].studentNumber, ' ', sort[1].surname, ' ',sort[1].name, ' ', sort[1].patronymic);
  for i:=2 to count do
  begin
       if(sort[i].surname=sort[i-1].surname) or (sort[i].surname=sort[i+1].surname) then
           writeln(sort[i].groupNumber, ' ', sort[i].studentNumber, ' ', sort[i].surname, ' ',sort[i].name, ' ', sort[i].patronymic);
  end;

  readln;
end.
