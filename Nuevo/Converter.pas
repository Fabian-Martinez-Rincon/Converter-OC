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
procedure signo_operacion(Binario:cadena11;var numero:integer);
var
    i:integer;
begin
    for i:=0 to (Length(Binario)-2) do //Me quedo con los primeros digitos y dejando el ultimo porque se usa para el signo
    begin
        if (Binario[Length(Binario)-i] = '1') then
        begin
            numero:=numero+valores[i]; 
        end;
    end;
end;
//_____________________________________________________________________________________________
procedure ComplementoA2(ca1:cadena11;var ca2:cadena11);
var
    i:integer;
    contador:cadena11;
    carry:Boolean;
    termino:Boolean;
begin
    termino:=False;
    carry:=False;
    contador:='';
    for i:=0 to Length(ca1)-1 do 
    begin
        if termino then
        begin
            ca2:=ca1[Length(ca1)-i] +ca2;
        end;
        if carry then
        begin
            if ca1[Length(ca1)-i] = '0' then
            begin
                ca2:='1'+ca2;
                carry:=False;
                termino:=true;
            end
            else
                begin
                    ca2:='0'+ca2;
                end;
        end;
        
        if (i = 0) and (ca1[Length(ca1)-i] = '0') then //Miro el primer digito y tambien si es cero
        begin
            ca2:='1'+ca2;
            termino:=True;
        end
        else
            begin
                if (i = 0)then
                begin
                    ca2:='0'+ca2;
                    carry:=true;
                end;
                
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
    ca1_decimal:integer;
    ca2:cadena11;
    ca2_decimal:integer;
begin
    ca2:='';
    ca2_decimal:=0;
    ca1_decimal:=0;
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
        WriteLn('Bcs: ', Binario ); //Lo dejo igual ya que no cambia nada el binario original del Bcs
        signo_operacion(Binario,bcs);
        WriteLn('Bcs_decimal: -',bcs);
        ComplementoA1(Binario,ca1);
        WriteLn('Ca1: ', ca1 );
        signo_operacion(ca1,ca1_decimal);
        WriteLn('Ca1_decimal: -', ca1_decimal );
        ComplementoA2(ca1,ca2);
        WriteLn('Ca2: ', ca2 );
        signo_operacion(ca2,ca2_decimal);
        WriteLn('Ca2_decimal: -', ca2_decimal );
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