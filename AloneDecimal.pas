program Conversor;
type
    cadena11 = string[11];
const
    valores : array[0..11] of integer = (2048,1024,512,256,128,64,32,16,8,4,2,1);
//_________________________________________
procedure Decimal_Binario(decimal:Integer;var binario:cadena11);
var
    i:Integer;
begin
    for i:=1 to 11 do
    begin
        if (valores[i]<=decimal) then
        begin
            binario:=binario+'1';
            decimal:=decimal-valores[i];
        end
            else
                begin
                    binario:=binario+'0';
                end;
    end;
end;
//_________________________________________
var
    decimal:integer;
    binario:cadena11;
begin
    binario:='';
    WriteLn('Ingrese un numero decimal: ');
    ReadLn(decimal);
    Decimal_Binario(decimal,binario);
    WriteLn('Binario: ', binario);

end.