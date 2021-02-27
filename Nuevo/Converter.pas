program Ejercicio;
uses
    crt;
type
    cadena11 = string[11];
const
    valores : array[0..11] of integer = (1,2,4,8,16,32,64,128,256,512,1024,2048);
//_____________________________________________________________________________________________
{procedure Exceso(Binario:cadena11;var ex:cadena11; CantBits:integer);
begin
  
end;}
//_____________________________________________________________________________________________
procedure ComplementoA1(Binario:cadena11;var ca1:cadena11);
var
    i:integer;
begin
    for i:=0 to Length(Binario)-1 do //El menos 1 esta, porque se ejecuta una de mas owo
    begin
        if (Binario[Length(Binario)-i] = '1') then
        begin
            ca1:='0'+ca1;
        end
        else 
            begin
                ca1:='1'+ca1;
            end;
    end;
end;
//_____________________________________________________________________________________________
procedure Bcs_decimal(Binario:cadena11;var bcs:integer);
var
    i,dato:integer;
begin
    dato:=0;
    for i:=0 to (Length(Binario)-2) do //Me quedo con los primeros digitos y dejando el ultimo porque se usa para el signo
    begin
        if (Binario[Length(Binario)-i] = '1') then
        begin
            bcs:=bcs+valores[i]; 
        end;
    end;
end;
//_____________________________________________________________________________________________
procedure Binario_A_Decimal(Binario:cadena11; var resultado:Integer);
var
    dato,i:integer;
    probando:Integer;
    ex2:cadena11;
    ca1:cadena11;
    bcs:integer;
begin
    bcs:=0;
    ca1:='';
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
        //Exceso(Binario,ex2);
    end;
    if ( Binario[Length(Binario)-probando] = '1')  then
    begin
        WriteLn('Bcs: ', Binario );
        Bcs_decimal(Binario,bcs);
        WriteLn('Bcs_Decimal: -',bcs);
        ComplementoA1(Binario,ca1);
        WriteLn('Ca1: ', ca1 );
        WriteLn('Ca2: ', Binario );
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
    WriteLn('Decimal: ', resultado);
end.