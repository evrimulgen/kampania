UNIT shortprc;

  {  KAMPANIA WRZE—NIOWA (moduˆ SHORT PROCEDURES)
     (c)1998 Copyright by Przemek Sobstel }

interface
uses crt,dos;
var r:registers;
procedure sc(kolor:byte);
procedure ot(x,y:integer;tekst:string);
procedure sts(nr_czcionki,x,wielkosc_liter:byte);
procedure rt(xx1,yy1,xx2,yy2:integer);
procedure l(xx1,yy1,xx2,yy2:integer);
procedure sls(a,s,d:integer);
procedure gw(x,y:integer;napis:string);
procedure tc(kolor:integer);
procedure tb(kolor:integer);
procedure kursoff;
procedure ramka(x,y,x1,y1:integer);
procedure dramka(x,y,x1,y1:integer);
procedure wypel(x,y,x1,y1,znak:integer);
procedure go;
procedure init(s,t:integer;sd:string);
procedure tlo(x,y,kolor,kolor2:integer);

implementation
uses graph;
var q:integer;
   procedure sc(kolor:byte);
    begin SetColor(kolor) end;
   procedure ot(x,y:integer;tekst:string);
    begin OutTextXY(x,y,tekst) end;
   procedure sts(nr_czcionki,x,wielkosc_liter:byte);
    begin SetTextStyle(nr_czcionki,x,wielkosc_liter) end;
   procedure rt(xx1,yy1,xx2,yy2:integer);
    begin RecTangle(xx1,yy1,xx2,yy2) end;
   procedure l(xx1,yy1,xx2,yy2:integer);
    begin Line(xx1,yy1,xx2,yy2) end;
   procedure sls(a,s,d:integer);
    begin SetLineStyle(a,s,d) end;
   procedure gw(x,y:integer;napis:string);
    begin GotoXY(x,y);Write(napis) end;
   procedure tc(kolor:integer);
    begin TextColor(kolor) end;
   procedure tb(kolor:integer);
    begin TextBackground(kolor) end;
   procedure kursOFF;
    var kp,kk:byte;kurs:registers;
    begin kurs.ah:=3;intr($10, kurs);with kurs do begin kp:=ch;
    kk:=cl;ah:=1;ch:=16;cl:=0 end;intr($10, kurs)end;
   procedure ramka(x,y,x1,y1:integer);
    begin gw(x,y,'Ú');gw(x,y1,'À');gw(x1,y,'¿');gw(x1,y1,'Ù');
    q:=x;repeat inc(q);gw(q,y,'Ä');until q=x1-1;
    q:=x;repeat inc(q);gw(q,y1,'Ä');until q=x1-1;
    q:=y;repeat inc(q);gw(x,q,'³');until q=y1-1;
    q:=y;repeat inc(q);gw(x1,q,'³');until q=y1-1;kursoff;end;
   procedure dramka(x,y,x1,y1:integer);
    begin gw(x,y,'É');gw(x,y1,'È');gw(x1,y,'»');gw(x1,y1,'¼');
    q:=x;repeat inc(q);gw(q,y,'Í');until q=x1-1;
    q:=x;repeat inc(q);gw(q,y1,'Í');until q=x1-1;
    q:=y;repeat inc(q);gw(x,q,'º');until q=y1-1;
    q:=y;repeat inc(q);gw(x1,q,'º');until q=y1-1;kursoff;end;
   procedure wypel(x,y,x1,y1,znak:integer);
    var w1,w2:integer;
    begin for w1:=x to x1 do for w2:=y to y1 do begin
    gw(w1,w2,char(znak));end;end;
   procedure go;
    begin intr($33,r) end;
   procedure init(s,t:integer;sd:string);
    begin initgraph(s,t,sd);end;
   procedure tlo(x,y,kolor,kolor2:integer);
    begin setfillstyle(1,kolor);floodfill(x,y,kolor2);end;
end.