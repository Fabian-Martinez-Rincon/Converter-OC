program bina_deci;
uses
    crt;
type
    string11 = string[11];

const
    balores_bite : array[0..11] of integer = (1,2,4,8,16,32,64,128,256,512,1024,2048);


function binario_decimal(bina : string11) : integer;     {Ejemplo : bina = '10010011001'}
var
    dato, i : integer;
begin
    binario_decimal := 0;
    dato := 0;
    for i := 0 to length(bina) - 1 do
    begin
        if bina[length(bina) - i] = '1' then
            dato := dato + balores_bite[i];
    end;
    binario_decimal := dato;
end;

function decimal_binario(deci : integer) : string11; {Ejemplo deci = 24}
var
    dato : string11;
    i, resu, dib : integer;
    resto : integer;
    ca : string[1];
begin
    dib := deci;
    i := 1;
    repeat
        fillchar(ca,2,' ');
        ca[0] := chr(1);
        resu := dib div 2;
        resto := dib mod 2;
        dib := resu;
        resu := 0;
        str(resto,ca);
        dato[i] := ca[1];
        dato[0] := chr(i);
        i := i + 1;
        resto := 0;
    until dib = 0;
    if length(dato) < 11 then
        for i := 1 to (11 - length(dato)) do
        begin
            insert('0',dato,1);
        end;
    decimal_binario := dato;
end;

var
    cadena : string11;
    num : integer;

begin
    clrscr;
    textcolor(15);
    cadena := '00001100100';
    writeln('Numero Entrado = ',cadena);
    writeln('Resultado = ',binario_decimal(cadena),' Decimal');
    writeln;
    num := 27;
    writeln('Numero Entrado = ',num);
    writeln('Resultado = ',decimal_binario(num),' Binario');
    readln;
end.