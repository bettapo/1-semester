program Project1;
uses Math;
var x, sum, next: real;
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
      writeln('The value of the Next Term:'); //checking
      writeln(next); //checking
      writeln;//for comfort testing
      sum:= sum+next;
      writeln('The value of the sum together with this Next Term:'); //checking
      writeln(sum); //checking
      writeln;//for comfort testing
      k:=k+1;
      writeln('Counter: ', k); //checking
    until (abs(next) < Power(0.1, precision+1));
    writeln('Result: ', sum:3:precision);
    writeln('Continue? If YES enter 1.');
    readln(continue);
    writeln;//for comfort testing
    writeln;//for comfort testing
  until(continue<>1);
end.

{Test1: x=1, sum = -0.40546510810816438197801311546434913657199042346249419761
        В WolframAlfa вбить: sum[((-1)^n)/((2^n)*n)]

 Test2: x=2 sum=-0.69314718055994530941723212145817656807550013436025525412
        В WolframAlfa вбить: sum[((-2)^n)/((2^n)*n)]}       
