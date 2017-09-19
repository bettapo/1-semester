program Project1;

var a, b, continue: integer;
begin
  repeat
    writeln('Enter a number: ');
    readln(a);
    b:= 0;
    repeat
      b:= b*10 + a mod 10;
      a:= a div 10;
    until(a=0);
    writeln('Result: ', b);
    writeln('Continue? If YES enter 1.');
    readln(continue);
  until(continue<>1);
end.  
