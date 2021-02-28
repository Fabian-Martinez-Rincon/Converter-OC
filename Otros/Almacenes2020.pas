program almacen2020;
type
    cadena20=string[20];
    meses = 1..12;
    ventas = record
        localidad:cadena20;
        monto:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos:ventas;
        sig:lista;
    end;
    lista2 = ^nodo2;
    nodo2 = record
        datos2:ventas;
        sig:lista2;
    end;
    totalVentas = array [meses] of lista;
    totalVentas2 = array [meses] of lista2; 
//_______________________________________________________________________
procedure InicializarVentas(var todVen:totalVentas);
var
    i:integer;
begin
    for i:=0 to 12 do
    begin
        todVen[i]:=Nil;
    end;
end;

//_______________________________________________________________________
procedure InsertarOrdenado (datosVentas:ventas;var todVentas:lista);
var
    ant,nue,act:lista;
begin
    New(nue);
    nue^.datos:=datosVentas;
    act:=pri;
    ant:=pri;
    while (act <> nil) and () do
end;
//_______________________________________________________________________
procedure LeerMes(todVen:totalVentas;todVen2:totalVentas2;mes:Integer);
begin
    while (todVen[mes])^.datos.monto <> 0 do
    begin
        InsertarOrdenado(todVen[mes]^.datos, todVen2[mes] );
    end;
end;
//_______________________________________________________________________
procedure InfoVentas(todVen:totalVentas;var todVen2:totalVentas2);
var
    i:integer;
begin
    for i:=1 to 12 do
    begin
        LeerMes(todVen,todVen2,i);
    end;
end;
//_______________________________________________________________________
var
    todVen:totalVentas;
    todVen2:totalVentas2;
begin
    InicializarVentas(todVen); 
    CargarVentas(todVen);//Se dispone
    InfoVentas(todVen,todVen2);
end.