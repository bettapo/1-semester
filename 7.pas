{Необходимо записать данные обо всех подписчиках некоторого почтового отделения в файл. Формат сведений: индекс издания, газета(журнал),
фамилия, адрес подписчика, количество экземпляровкаждого из изданий. Все сведения заносятся в список. Разработать хеш-таблицу для
обработки сведений о подписчиках, ключом для формирования таблицы взять почтовый индекс издания. Всех подписчиков одного издания
упорядочить по фамилиям методом вставки. Обеспечить поиск подписчика, дополнение списков подписчиков. Все виды работ выполнять через меню.}

program Project1;
 
{$APPTYPE CONSOLE}
 
uses
  SysUtils;

type PList = ^subscriber;
     subscriber = record
         index : integer;
         magazine : string[255];
         surname : string[255];
         address : string[255];
         copy : integer;
         next : PList;
     end;
    ff_rec = file of subscriber;

var hashTable : array [1..100] of Plist;
    x : PList;
    i, hashQuantity, menu, number : integer;
    theSameIndex : boolean;
    forWriting, forReading : ff_rec;
    temp : subscriber;

procedure cin();
begin
     writeln('Enter index of publication.');
     readln(temp.index);
     writeln('Enter name of the magazine/newspaper.');
     readln(temp.magazine);
     writeln('Enter subscriber surname.');
     readln(temp.surname);
     writeln('Enter subscriber address.');
     readln(temp.address);
     writeln('Enter number of copies.');
     readln(temp.copy);
end;

{function Add() : PList;
var current : PList;
begin
    New(current);
    readln(current^.index);
    readln(current^.magazine);
    readln(current^.surname);
    readln(current^.address);
    readln(current^.copy);
    Add := current;
end;  }


begin
    assign(forWriting, 'info.dat');
    assign(forReading, 'info.dat');

    //clearing a file before starting work
    rewrite(forWriting);
    close(forWriting);

    hashQuantity := 0;
    //initializing a hash table
    for  i := 1 to 100 do
         hashTable[i] := 0;

    {writeln('Thebase is empty. Enter the data. To finish entering, type *');
    x := Add();
    if (hashQuantity = 0) then
       begin
            hashTable[1] := x;
            hashQuantity := hashQuantity + 1;
       end;
    else
        for i := 1 to hashQuantity do
             if (x^.index = hashTable[i]^.index)}
   repeat
      writeln('Enter 1 to add data in file.');
      writeln('Enter 2 to display data from the file to the console');
      writeln('Enter 3 to create a hashtable');
      writeln('Enter 0 end work with this program.');
      readln(menu);
      if (menu = 1) then
      begin
          reset(forWriting);
          while not Eof(forWriting) do
          begin
              read(forWriting, temp);
          end;
          //rewrite(forWriting);
          writeln('Enter how many subscribers do you want to add.');
          readln(number);
          for i := 1 to number do
          begin
              cin();
              write(forWriting, temp);
          end;
          //close(forWriting);
      end;

      if (menu = 2) then
      begin
          reset(forReading);
          while not Eof(forReading) do
          begin
              read(forReading, temp);
              writeln(temp.index, ' ', temp.magazine, ' ', temp.surname, ' ', temp.address, ' ', temp.copy);
          end;
          writeln;
      end;

      if(menu = 3) then
      begin
          reset(forReading);
          while not Eof(forReading) do
          begin
              new(x);
              read(forReading, temp);
              if (hashQuantity = 0) then
              begin
                  hashTable[1] := x;
                  hashQuantity := hashQuantity + 1;
              end;
          end;
      end;
   until (menu = 0);
   readln;
end.
