program Conversor;
{type
    cadena11 = string[11];
const
    valores : array[0..11] of integer = (2048,1024,512,256,128,64,32,16,8,4,2,1);
//_________________________________________
procedure Decimal_Binario(decimal:Integer;var binario:cadena11;var relleno:integer);
var
    grande:integer;
    i:integer;
begin
    grande:=999;
    for i:=1 to 11 do
    begin
        if (valores[i]<=decimal) then
        begin
            binario:=binario+'1';
            decimal:=decimal-valores[i];
            if grande>=i then
            begin
                grande:= i-1;  
            end;
            
        end
            else
                begin
                    binario:=binario+'0';
                end;
    end;
    relleno:=grande;
    WriteLn('Relleno: ',relleno);
end;}
//_________________________________________
var
    {decimal:integer;
    binario:cadena11;
    relleno:integer;}
    x,y:integer;
    valor2:integer;
begin
    x:=5;
    y:=2;
    valor2:=Trunc(exp(x * ln ( y )));
    WriteLn('Hola mundo: ',valor2 );
    {binario:='';
    WriteLn('Ingrese un numero decimal: ');
    ReadLn(decimal);
    Decimal_Binario(decimal,binario,relleno);
    WriteLn('Binario: ', binario);
    Delete(binario,1,relleno);
    WriteLn('Binario: ', binario);}

end.