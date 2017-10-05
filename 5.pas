{В m файлах создать сведения о студентах m групп. Формат сведений: № группы, порядковый номер, фамилия, имя, отчество.
 Выбрать всех однофамильцев из всех групп и сформировать из них последовательность. Обеспечить мвывод сведений о каждой
 группе и результаты поиска однофамильцев. Сортировка сведений выполняется методом всатвок.}
  
program Project1;

{$APPTYPE CONSOLE}

//uses
  //SysUtils;

type student = record
     groupNumber: integer;
     studentNumber: integer;
     surname: string;
     name: string;
     patronymic: string;
end;
ff_rec = file of student;

var table: array [1..20] of student;
    groupList: ff_rec;
    quantity, i, grNum: integer;

begin
    assign(f_r, 'My_rec.dat');
    writeln('Enter the number of students:');
    readln(quantity);
    writeln('Enter the group number:');
    readln(grNum);
    for i:=1 to quantity do begin
        table[i].groupNumber:=grNum;
        writeln('Enter student number:');
        readln(table[i].studentNumber);
        writeln('Enter student surname:');
        readln(table[i].surname);
        writeln('Enter student name:');
        readln(table[i].name);
        writeln('Enter student patronymic:');
        readln(table[i].patronymic);

    end;
  
  readln;
end.
