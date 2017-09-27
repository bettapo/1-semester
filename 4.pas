program Project1;
const
     M = 3;
     N = 4;
Procedure Trans(var U: array[1..M,1..N] OF integer);
begin
   for i:=1 to M do
         for j:= 1 to N do
             B[j,i]:=U[i,j];
end;


var A: array [1..M,1..N] of integer;
    B: array [1..N,1..M] of integer;
    i, j: integer;

begin
     for i:= 1 to M do
         for j:= 1 to N do
             read(A[i,j]);

      Trans(A);

     for i:= 1 to M do begin
         for j:= 1 to N do
             write (A[i,j]);
         writeln;
     end;

     for i:= 1 to N do begin
         for j:= 1 to M do
             write (B[i,j]);
         writeln;
     end;
     readln(i);
end.            
