program Project1;

Type arr=array[1..10,1..10] of integer;

Procedure wr(l,k: integer; a: arr);
var i, j: integer;
begin
   for i:=1 to l do
       begin
         for j:= 1 to k do
             write(a[i,j]:3);
         writeln;
       end;
end;


var A:arr;
    B:arr;
    N, M, i, j, continue: integer;

begin
     repeat
       writeln('Enter the number of rows: ');
       readln(M);
       writeln('Enter the number of columns: ');
       readln(N);

       writeln('Fill in the matrix:');
       for i:= 1 to M do
           for j:= 1 to N do
               read(A[i,j]);

       for i:= 1 to M do
           for j:= 1 to N do
               B[j,i]:=A[i,j];
       writeln('The original matrix:');
       wr(M,N,A);
       writeln('The modified matrix:');
       wr(N,M,B);

       writeln('Continue? If YES enter 1.');
       readln(continue);
     until(continue<>1);
end.
                 
