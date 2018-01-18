UNIT TPrzesuw;

interface
var xx11,xx22,yy11,yy22:integer;
procedure przewtext(npliku:string;dlpliku,dlstr:integer);

implementation
uses crt,shortprc;
var procent:byte;
    procentt:string;

 PROCEDURE PrzewText(npliku:string;dlpliku,dlstr:integer);
 var plik:text;
     linia:string;
     i,x,c:integer;
     kl:char;
  procedure strona(x,c:integer); {wypisanie na ekranie jednej strony}
   begin
     clrscr;reset(plik);i:=0;if x=0 then i:=-1;
     repeat inc(i);readln(plik,linia);until i=x; {ustawienie sie pozycji w odpowiednim miejscu}
     repeat inc(i);readln(plik,linia);writeln(linia);until i=c; {odczytanie tekstu}
   end;
 begin
   assign(plik,npliku); {otworzenie pliku}
   x:=0;
   repeat tc(15);
    c:=x+dlstr;strona(x,c); {odczytanie jednej strony o poczatku X i koncu C}
{pokazanie procenta, ktory wskazuje aktualna pozycje w pliku dla uzytkownika}
    procent:=round((100*c)/dlpliku);{procent wy˜wietlanego pliku}
    str(procent,procentt);{zamienienie zmiennej liczbowej na zmienna tekstowa}
    tc(10);window(1,1,80,25);
    dramka(73,20,78,22);
    gw(78,20,'¹');gw(73,22,'Ê');tc(15);
    if procent=100 then gw(74,21,'100%');
    if procent<100 then gw(74,21,' '+procentt+'%');
    window(xx11,yy11,xx22,yy22);
{koniec czesci dotyczacej procenta}
    kl:=readkey;
    case kl of
{gora}#72 : if x>1 then x:=x-1;
{dol} #80 : if x<dlpliku-dlstr then x:=x+1;
{PgUp}#73 : begin if x>dlstr then x:=x-dlstr;if x<=dlstr then x:=1;end;
{PgDn}#81 : begin if x<dlpliku-dlstr then x:=x+dlstr;if x>=dlpliku-dlstr then x:=dlpliku-dlstr;end;
{ALT+Q} #16 : begin window(1,1,80,25);tb(0);tc(15);clrscr;gw(1,1,'Do widzenia!');halt;end;
    end;
   until (kl=#27) or (kl=#75);
   close(plik); {zamkniecie pliku}
 end;
end.