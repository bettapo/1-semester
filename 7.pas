{Необходимо записать данные обо всех подписчиках некоторого почтового отделения в файл. Формат сведений: индекс издания, газета(журнал),
фамилия, адрес подписчика, количество экземпляровкаждого из изданий. Все сведения заносятся в список. Разработать хеш-таблицу для
обработки сведений о подписчиках, ключом для формирования таблицы взять почтовый индекс издания. Всех подписчиков одного издания
упорядочить по фамилиям методом вставки. Обеспечить поиск подписчика, дополнение списков подписчиков. Все виды работ выполнять через меню.}

program Project1;

type PList = ^subscriber;
     subscriber = record
         index : integer;
         magazine : string[255];
         surname : string[255];
         address : string[255];
         quantity : integer;
         next : PList;
     end;

function Add() : PList;
var current : PList;
begin
    New(current);
    readln(current^.index);
    readln(current^.magazine);
    readln(current^.surname);
    readln(current^.address);
    readln(current^.quantity);
    Add := current;
end;

var hashTable : array [1..100] of Plist;
    x : PList;
    i, hashQuantity : integer;
    theSameIndex : boolean;

begin
    hashQuantity := 0;
    //
    for  i := 1 to 100 do
         hashTable[i] := 0;
    //
    writeln('Thebase is empty. Enter the data. To finish entering, type *');
    x := Add();
    if (hashQuantity = 0) then
       begin
            hashTable[1] := x;
            hashQuantity := hashQuantity + 1;
       end;
    else
        for i := 1 to hashQuantity do
             if (x^.index = hashTable[i]^.index)





end.

