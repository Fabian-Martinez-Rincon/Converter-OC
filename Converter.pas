program ConverterOC;
uses
    crt;
type
    cadena11 = string[11];
const
    valores : array[0..11] of integer = (1,2,4,8,16,32,64,128,256,512,1024,2048);//Con una ecuacion se puede hacer mas facil
    valores2 : array[0..11] of integer = (2048,1024,512,256,128,64,32,16,8,4,2,1);//Despues lo tengo que cambiar
    decimales : array[0..11] of Real = (0.5,0.25,0.125,0.0625,0.03125,0.015625,0.0078125,0.00390625,0.001953125,0.0009765625,0.00048828125,0.000244140625);
//___________________________________________________________________
procedure ComplementoA1(Binario:cadena11;var ca1:cadena11);//Cuando me sale un 1, cargo un 0
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
//___________________________________________________________________
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
//___________________________________________________________________
procedure ComplementoA2(ca1:cadena11;var ca2:cadena11);//Si, todo este proceso es para sumar el carry
var
    i:integer;
    carry:Boolean;
    termino:Boolean;
begin
    termino:=False;
    carry:=False;
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
//___________________________________________________________________
procedure exceso(binario:cadena11;var ex2:cadena11); // Recorro el binario hasta cambiar el ultimo digito por un 0
var
    i:integer;
begin
    for i:=0 to Length(binario)-1 do
    begin
        if (Length(binario)-1 = (i)) then
        begin
            ex2:='0' +ex2;
        end
        else
            begin
                ex2:=binario[Length(binario)-i] +ex2;      
            end;
    end;
end;
//___________________________________________________________________
procedure RangosBss(bits:integer);
var//5
    dos:integer;
    valor:integer;
begin
    dos:=2;//2^bits
    valor:=Trunc(exp(bits * ln ( dos )));//Me quedo con el entero de la operacion
    Write('Minimo Numero Negativo: No existe    ');
    Write('Maximo Numero Negativo: No existe    ');
    Write('Minimo Numero Positivo: 0    ');
    Write('Maximo Numero Positivo:',valor-1);//25 wtf  
    WriteLn('    Rango: 0..',valor-1);
end;
//___________________________________________________________________
procedure RangosCa1(bits:integer);
var
    dos:integer;
    valor:integer;
begin
    dos:=2;
    bits:=bits-1;//Resto uno porque es bcs entonces no uso el ultimo bit
    valor:=Trunc(exp(bits * ln ( dos )));
    Write('Minimo Numero Negativo: -0   |');
    Write('Maximo Numero Negativo: -',valor-1,'   |');
    Write('Minimo Numero Positivo:  0   |');
    Write('Maximo Numero Positivo:  ',valor-1,'   |');  
    WriteLn('Rango: -',valor-1,'..',valor-1,'|');
end;
//___________________________________________________________________
procedure RangosBcs(bits:integer);
var
    dos:integer;
    valor:integer;
begin
    dos:=2;
    bits:=bits-1;//Resto uno porque es bcs entonces no uso el ultimo bit
    valor:=Trunc(exp(bits * ln ( dos )));
    Write('Minimo Numero Negativo: -0   |');
    Write('Maximo Numero Negativo: -',valor-1,'   |');
    Write('Minimo Numero Positivo:  0   |');
    Write('Maximo Numero Positivo:  ',valor-1,'   |');  
    WriteLn('Rango: -',valor-1,'..',valor-1,'|');
end;
//___________________________________________________________________
procedure RangosCa2(bits:integer);
var
    dos:integer;
    valor:integer;
begin
    dos:=2;
    bits:=bits-1;//Resto uno porque es bcs entonces no uso el ultimo bit
    valor:=Trunc(exp(bits * ln ( dos )));
    Write('Minimo Numero Negativo: -1   |');
    Write('Maximo Numero Negativo: -',valor,'   |');
    Write('Minimo Numero Positivo:  0   |');
    Write('Maximo Numero Positivo:  ',valor-1,'   |');  
    WriteLn('Rango: -',valor,'..',valor-1,'|');
end;
//___________________________________________________________________
procedure RangosEx2(bits:integer);
var
    dos:integer;
    valor:integer;
begin
    dos:=2;
    bits:=bits-1;//Resto uno porque es bcs entonces no uso el ultimo bit
    valor:=Trunc(exp(bits * ln ( dos )));//2^(bits-1)
    Write('Minimo Numero Negativo: -1   |');
    Write('Maximo Numero Negativo: -',valor,'   |');
    Write('Minimo Numero Positivo:  0   |');
    Write('Maximo Numero Positivo:  ',valor-1,'   |');  
    WriteLn('Rango: -',valor,'..',valor-1);//(2^(bits-1))-1
end;
//___________________________________________________________________
procedure Binario_A_Decimal(Binario:cadena11; var resultado:Integer);
var
    dato,i:integer;
    probando:Integer;
    ca1:cadena11;
    ca1_decimal:integer;
    bcs:integer;
    ca2:cadena11;
    ca2_decimal:integer;
    ex2:cadena11;
    ex2_decimal:integer;
    segundon:cadena11;
    segundon2:cadena11;
begin
    segundon:='';
    segundon2:='';
    dato:=0;
    probando:=0;
    bcs:=0;
    ca1:='';
    ca1_decimal:=0;
    ca2:='';
    ca2_decimal:=0;
    ex2:='';
    ex2_decimal:=0;

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
        WriteLn('________________________________________________________________________________________________________________________________________');
        WriteLn('Bss: ', Binario );
        WriteLn('Bss_decimal: ', dato );
        RangosBss(Length(Binario));
        WriteLn('________________________________________________________________________________________________________________________________________');
        WriteLn('Bcs: ', Binario );
        WriteLn('Bcs_decimal: ', dato );
        WriteLn('Al empezar con 0, tiene los mismos valores que el BSS');
        WriteLn('________________________________________________________________________________________________________________________________________');
        WriteLn('Ca1: ', Binario );
        WriteLn('Ca1_decimal: ', dato );
        WriteLn('Al empezar con 0, tiene los mismos valores que el BSS');
        WriteLn('________________________________________________________________________________________________________________________________________');
        WriteLn('Ca2: ', Binario );
        WriteLn('Ca2_decimal: ', dato );
        WriteLn('Al empezar con 0, tiene los mismos valores que el BSS');
        WriteLn('________________________________________________________________________________________________________________________________________');
        ComplementoA1(Binario,segundon);
        ComplementoA2(segundon,segundon2);
        Exceso(segundon2,ex2);
        WriteLn('Ex2: ',ex2);
        signo_operacion(ex2,ex2_decimal);
        WriteLn('Ex2_decimal: -', ex2_decimal );
        RangosEx2(Length(Binario));
        WriteLn('________________________________________________________________________________________________________________________________________');
    end;

    if ( Binario[Length(Binario)-probando] = '1')  then
    begin
        WriteLn('________________________________________________________________________________________________________________________________________');
        WriteLn('Bss: ', Binario);
        WriteLn('Bss_decimal: ', dato);
        RangosBss(Length(Binario));
        WriteLn('________________________________________________________________________________________________________________________________________');
        WriteLn('Bcs: ', Binario ); 
        signo_operacion(Binario,bcs);
        WriteLn('Bcs_decimal: -',bcs);
        RangosBcs(Length(Binario));
        WriteLn('________________________________________________________________________________________________________________________________________');
        ComplementoA1(Binario,ca1);
        WriteLn('Ca1: ', ca1 );
        signo_operacion(ca1,ca1_decimal);
        WriteLn('Ca1_decimal: -', ca1_decimal );
        RangosCa1(Length(Binario));
        WriteLn('________________________________________________________________________________________________________________________________________');
        ComplementoA2(ca1,ca2);
        WriteLn('Ca2: ', ca2 );
        signo_operacion(ca2,ca2_decimal);
        WriteLn('Ca2_decimal: -', ca2_decimal );
        RangosCa2(Length(Binario));
        //RangosCa2(Length(Binario));
        WriteLn('________________________________________________________________________________________________________________________________________');
        Exceso(Binario,ex2);
        WriteLn('Ex2: ',ex2);
        signo_operacion(ex2,ex2_decimal);
        WriteLn('Ex2_decimal: ', ex2_decimal );
        RangosEx2(Length(Binario));
        WriteLn('________________________________________________________________________________________________________________________________________');
    end;
    resultado:=dato;
end;
//___________________________________________________________________
procedure Decimal_Binario(decimal:Integer;var binario:cadena11);
var
    i:Integer;
    grande:integer;
begin
    grande:=999;
    for i:=1 to 11 do
    begin
        if (valores2[i]<=decimal) then
        begin
            binario:=binario+'1';
            decimal:=decimal-valores2[i];
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
    Delete(binario,1,grande);
end;

//___________________________________________________________________
procedure Caracteristicas_Binario();
var
    binario:cadena11;
    resultado:Integer;
begin
    binario:='';
    resultado:=0;   
    writeln('Ingrese un numero Binario: ');
    ReadLn(Binario);
    Binario_A_Decimal(Binario,resultado);
    WriteLn('Decimal: ', resultado);
    WriteLn('Bits: ',Length(Binario));
end;

//___________________________________________________________________
procedure Caracteristicas_Decimal();
var
    decimal:integer;
    Binario:cadena11;
    resultado:integer;
begin
    decimal:=0;
    Binario:='';
    resultado:=0;  
    writeln('Ingrese un numero Decimal: ');
    ReadLn(decimal);
    Decimal_Binario(decimal,Binario);
    WriteLn('El binario es: ', Binario);
    Binario_A_Decimal(Binario,resultado);
    WriteLn('Bits: ',Length(Binario));

end;
//___________________________________________________________________
var
    Elegir:Integer;
begin
    clrscr;
    Elegir:=0;
    WriteLn('________________________________________________________________________________________________________________________________________');
    while (Elegir <> 3)   do
    begin
        writeln('Elija una opcion: ');
        WriteLn('1) Caracteristicas de un Binario.');
        WriteLn('2) Caracteristicas de un Decimal.');
        WriteLn('3) Terminar.');
        Write('Opcion:');
        ReadLn(Elegir);
        clrscr;
        case Elegir of
            1: Caracteristicas_Binario();   
            2: Caracteristicas_Decimal();
        end;
        WriteLn('________________________________________________________________________________________________________________________________________');
    end;
    clrscr;
end.