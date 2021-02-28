program Conversor;
type
    cadena11 = string[11];
const
    valores : array[0..11] of integer = (2048,1024,512,256,128,64,32,16,8,4,2,1);
var
    decimal:integer;
    binario:cadena11;
    i:integer;
begin
    binario:='';
    WriteLn('Ingrese un numero decimal: ');
    ReadLn(decimal);
    Decimal_Binario();
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
    WriteLn('Binario: ', binario);

end.