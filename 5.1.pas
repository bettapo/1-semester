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
ff_rec = file of student;

var //table: array [1..20] of student;
    groupList: ff_rec;
    fileName : string[20]; {строка для хранения имени физического файла}
    person: student; {Переменная типа student для заполнения файла}
    forReading: student {Переменная типа student для считывания данных из файла}

Procedure Enter(groupNum, Nomer: integer);
begin
    with Person do
    begin
        groupNumber:=grNum;
        studentNumber:=Nomer;
        writeln('Enter student surname:');
        readln(surname);
        writeln('Enter student name:');
        readln(name);
        writeln('Enter student patronymic:');
        readln(patronymic);
        write(groupList, Person); {записать в файл созданный элемент Person. Записываем в файл информацию об 1 ученике}
    end;
end.

Procedure fillingFile;
var quantity, i, grNum: integer;
begin
    {СОЗДАНИЕ ФАЙЛА}
    write('Введите имя файла данных:');
    readln(fileName); {имя физического файла}
    assign(groupList, fileName);
    {}
    
    writeln('Enter the number of students:');
    readln(quantity);
    writeln('Enter the group number:');
    readln(grNum);
    rewrite(groupList); {открываем файл для записи}
    for i:=1 to quantity do
        Enter(grNum, i);
    close(groupList); {закрываем файл}
    readln;
end.

begin
  assign(forReading,fileName);{связываем файловую переменную forReading с физическим файлом Name}
  reset(forReading);{открываем файл для чтения}
  
  while not Eof(forReading) do{просматриваем файл до конца}
      read(f, person);{считываем из файла очередной элемент в переменную person}
 
  readln;
end
