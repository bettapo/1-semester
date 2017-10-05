{http://informatics.mccme.ru/mod/book/print.php?id=536}

Program TipRecord;
Uses
  Crt;
Type
  Dann=record
      stag : byte;
      Surname, WorkName : string;
      Oklad, Year : integer;
    End;
Var
  Spisok : file of Dann; {файл типа записи Dann}
  Man : Dann; {переменная типа записи Dann для работы с файлом}
  Name : string[12]; {строка для хранения имени физического файла}
Procedure VvodZap (Nomer : integer);
Begin
  with Man do
    begin
      writeln('Введите данные ',Nomer,'-го работника');
      write('Фамилия: ');
      readln(Surname);
      write('Год рождения: ');
      readln(Year);
      write('Стаж работы: ');
      readln(stag);
      write('Должность: ');
      readln(WorkName);
      write('Оклад: ');
      readln(oklad);
      write(Spisok, Man); {записать в файл созданный элемент Man}
    end;
End;
Procedure FileVvod;
Var
  i, count : Integer;
Begin
  write('Введите имя файла данных:');
  readln(Name); {имя физического файла}
  assign(Spisok, Name); {связываем файловую переменную с файлом}
  rewrite(Spisok ); {открываем файл для записи}
  write('Введите количество работников:');
  readln(count);
  for i:=1 to count do
    VvodZap(i); {вызов процедуры ввода очередной информации в файл}
  close(Spisok); {закрываем файл}
  readln;
End;
Begin
  ClrScr;
  FileVvod;
  readLn;
End.
