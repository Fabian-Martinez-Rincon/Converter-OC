program Ejercicio;
uses
    crt;
type
    cadena11 = string[11];
const
    valores : array[0..11] of integer = (1,2,4,8,16,32,64,128,256,512,1024,2048);
//_____________________________________________________________________________________________
procedure Exceso(Binario:cadena11;var ex:cadena11; CantBits:integer);
begin
  
end;
//_____________________________________________________________________________________________
procedure Binario_A_Decimal(Binario:cadena11; var resultado:Integer);
var
    dato,i:integer;
    probando:Integer;
    ex2:cadena11;
begin
    dato:=0;
    probando:=0;
    for i:=0 to Length(Binario)-1 do //El menos 1 esta, porque se ejecuta una de mas owo
    begin
        if (Binario[Length(Binario)-i] = '1') then
        begin
            dato:=dato+valores[i];
            
        end;
        probando:=i;
    end;
    if ( Binario[Length(Binario)-probando] = '0')  then
    begin
        WriteLn('Bss: ', Binario );
        WriteLn('Ca1: ', Binario );
        WriteLn('Ca2: ', Binario );
        Exceso(Binario,ex2);
        
    end;
    resultado:=dato;
end;
//_____________________________________________________________________________________________
var
    Binario:cadena11;
    resultado:integer;
begin
    resultado:=0;
    clrscr;
    writeln('Ingrese un numero Binario: ');
    ReadLn(Binario);
    Binario_A_Decimal(Binario,resultado);
    WriteLn('El resultado es: ', resultado);
end.