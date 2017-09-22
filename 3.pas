program Project1;

uses Math;

var primary, result: string;
    N, m, i, continue: integer;

begin
  repeat
    writeln('Enter string: ');
    readln(primary);
    writeln('Set the length of words: ');
    readln(m);

    for i:= 1 to Length(primary) do
      begin
        result:=result+primary[i];
        if (i mod m=0) then
          result:= result + ' ';
      end;

    writeln('The primary string: ', primary);
    writeln('The result string: ', result);
    writeln('Continue? If YES enter 1.');
    readln(continue);
    Delete(result,1, Length(result));
  until(continue<>1);
end.
