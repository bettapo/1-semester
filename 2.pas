program Project1;
uses Math;
var x, sum, next, difference: real;
    continue, precision, k: integer;
begin
  repeat
    writeln('Enter the value of x: ');
    readln(x);
    writeln('Enter the precision of calculations: ');
    readln(precision);

    k:=1;
    sum:=0;
    repeat
      next:= Power((-1)*x, k)/(Power(2, k)*k);
      writeln(next); //checking
      sum:= sum+next;
      writeln(sum); //checking
      k:=k+1;
      writeln(k);
    until (abs(next) < Power(0.1, precision));
    writeln('Result: ', sum:3:precision);
    writeln('Continue? If YES enter 1.');
    readln(continue);
  until(continue<>1);
end.
