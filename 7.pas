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
    i : integer;
    theSameIndex : boolean;

begin
    //
    for  i := 1 to 100 do
         hashTable[i] := 0;
    //
    x := Add();



end.
