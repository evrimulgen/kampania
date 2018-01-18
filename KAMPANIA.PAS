PROGRAM Kampania_wrzesniowa;
USES Dos,Crt,Graph,
     ShortPrc {procedury ulatwiajace prace},
     TPrzesuw {procedura do przewijania tekstu};

VAR kontynuowac:char;
    powrotdomenu:boolean; {do modulu FAKTY i ZABAWA}
    r1:registers; {2-ga zmienna do myszki, do sprawdzania czy nastapil ruch
                   mysza - 1-wsza zmienna znajduje sie w module SHORTPRC}
    dp1,dp2,dp3,dp4,dp5,dp6,dp7,
    dp8,dp9,dp10,dp11,dp12, {dlugosci plikow tekstowych w katalogu FAKTY}
    iloscpytan : integer;



 procedure PGRE; {"wyrzucenie" kursora myszki poza menu rozwijane}
  begin
    r.ax:=3;go;
    r.cx:=1;r.ax:=4;go;
  end;

 procedure NapisySztywne; {napisy w menu, ktotych nie mozna podswietlic}
   begin
     cleardevice;
     r.ax:=1;go;
     sc(14);
     l(0,5,640,5);
     l(0,120,640,120);
     sts(10,0,4);
     sc(10);
     ot(-2,28,'KAMPANIA');
     ot(285,28,'WRZESNIOWA');
     ot(448,10,'''');
     sts(2,0,4);
     sc(7);
     ot(160,468,'Pomysl i programowanie : Przemek Sobstel. GRUDZIEN 1998.');
     sts(2,0,4);
     ot(253,96,'Wersja 1.00 (31.12.98r.)');
   end;

  procedure ZAKONCZENIE;
  begin
    r.ax:=2;go;
    closegraph;
    window(1,1,80,25);
    tb(0);clrscr;
    tc(15);
    write('Do widzenia!');
    halt;
  end;


{****************************************************************************
 ********************************* MENU *************************************
 ****************************************************************************}

 PROCEDURE MENU;

 VAR k1,k2,k3,k4,kl1,kl2,kl3,kl4:byte; {kolory}
     nackl:char;

{****************************************************************************
 ******************************* FAKTY **************************************
 ****************************************************************************}

  PROCEDURE FAKTY;
   var nacklaw,nack:char;
       c1,c2:byte; {kolory tla napisow po rozwinieciu [*]}

{podprocedura z menu rozwijanym (fakty) dzialu FAKTY}
 procedure WFakty;
  var nac:char;
      nazpliku,dzial:string;
      dp, {dlugosc pliku}
      l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,
      z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12 : integer; {kolory}

   procedure Czytanie; {odczytanie i wyswietlenie tekstu pliku na ekran - FAKTY}
    begin
      tb(0);tc(127+15); {migajacy napis}
      gw(45,25,#27+' lub ESC - powr¢t do menu FAKTY ');
      tc(10);dramka(44,4,78,22);
      gw(45,4,' '+dzial+' '); {napis zaraz nad oknem tekstowym z nazwa dzialu}
      window(45,5,77,21);
     przewtext('fakty\'+nazpliku,dp,16); {odczytanie tekstu z pliku}
      {ponizej: wyczyszczenie okna tekstowego z ekranu}
      window(1,1,80,25);
      tc(lightgreen);wypel(44,4,78,22,177);
      tc(0);gw(45,25,#27+' lub ESC - powr¢t do menu FAKTY ');
      pgre;
    end;

   procedure Wybor; {gdy zostanie wybrane, ktores z zagadnien}
    begin
                      if l1=3 then begin dzial:='Wybuch wojny';
                       nazpliku:='wybuch.txt';dp:=dp1;czytanie;end;
                      if l2=3 then begin dzial:='Bitwa graniczna';
                       nazpliku:='granica.txt';dp:=dp2;czytanie;end;
                      if l3=3 then begin dzial:='Obrona wybrzeæa';
                       nazpliku:='wybrzeze.txt';dp:=dp3;czytanie;end;
                      if l4=3 then begin dzial:='Utworzenie nowych armi';
                       nazpliku:='nowarmie.txt';dp:=dp4;czytanie;end;
                      if l5=3 then begin dzial:='Bitwa nad Bzur•';
                       nazpliku:='bzura.txt';dp:=dp5;czytanie;end;
                      if l6=3 then begin dzial:='Wkroczenie Armi Czerwonej';
                       nazpliku:='czerwona.txt';dp:=dp6;czytanie;end;
                      if l7=3 then begin dzial:='Bitwa pod Tomaszowem Lubelskim';
                       nazpliku:='tomaszow.txt';dp:=dp7;czytanie;end;
                      if l8=3 then begin dzial:='Obrona Lwowa';
                       nazpliku:='lwow.txt';dp:=dp8;czytanie;end;
                      if l9=3 then begin dzial:='Obrona Warszawy';
                       nazpliku:='warszawa.txt';dp:=dp9;czytanie;end;
                      if l10=3 then begin dzial:='Obrona Modlina';
                       nazpliku:='modlin.txt';dp:=dp10;czytanie;end;
                      if l11=3 then begin dzial:='Ostatnie bitwy';
                       nazpliku:='ostatnie.txt';dp:=dp11;czytanie;end;
                      if l12=3 then begin dzial:='Podsumowanie "wrzeònia"';
                       nazpliku:='bilans.txt';dp:=dp12;czytanie;end;
    end;

  {glowna czesc podprocedury WFakty}
  begin
       tb(0);tc(10);wypel(3,2,24,5,177); {zmazanie menu rozw. opcji [*]}
       tc(15);tb(0);gw(3,1,'[*]');
       tb(3);gw(8,1,'Fakty');  {ukazanie si© napsiu Fakty w kolorze 3}
       tb(0);tc(15);ramka(8,2,40,15); {rysowanie ramki (menu rozw.) Faktow}
       xx11:=45;xx22:=77;yy11:=5;yy22:=21;
       z1:=3;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;
  repeat
    l1:=z1;l2:=z2;l3:=z3;l4:=z4;l5:=z5;l6:=z6;l7:=z7;l8:=z8;l9:=z9;l10:=z10;l11:=z11;l12:=z12;
   {napisy w ramce FAKTY - podswietlane ruchoma "belka"}
    tc(15);
    tb(l1);gw(9, 3,'  1.Wybuch wojny               ');
    tb(l2);gw(9, 4,'  2.Bitwa graniczna            ');
    tb(l3);gw(9, 5,'  3.Obrona wybrzeæa            ');
    tb(l4);gw(9, 6,'  4.Utworzenie nowych armi     ');
    tb(l5);gw(9, 7,'  5.Bitwa nad Bzur•            ');
    tb(l6);gw(9, 8,'  6.Wkroczenie Armii Czerwonej ');
    tb(l7);gw(9, 9,'  7.Bitwa pod Tomaszowem Lub.  ');
    tb(l8);gw(9,10,'  8.Obrona Lwowa               ');
    tb(l9);gw(9,11,'  9.Obrona Warszawy            ');
   tb(l10);gw(9,12,' 10.Obrona Modlina             ');
   tb(l11);gw(9,13,' 11.Ostatnie bitwy             ');
   tb(l12);gw(9,14,' 12.Podsumowanie "wrzeònia"    ');
    r.ax:=3;go;
   if (r.bx=1) and (r.dx<9) and (r.cx>15) and (r.cx<33) then break;
  {ponizej: ustawienie "belki" w zaleznosci od polozenia kursora myszy}
   if (r.cx>55) and (r.cx<313) then begin
    if r.dx=16 then begin z1:=3;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=24 then begin z1:=0;z2:=3;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=32 then begin z1:=0;z2:=0;z3:=3;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=40 then begin z1:=0;z2:=0;z3:=0;z4:=3;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=48 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=3;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=56 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=0;z6:=3;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=64 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=3;z8:=0;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=72 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=3;z9:=0;z10:=0;z11:=0;z12:=0;end;
    if r.dx=80 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=3;z10:=0;z11:=0;z12:=0;end;
    if r.dx=88 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=3;z11:=0;z12:=0;end;
    if r.dx=96 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=3;z12:=0;end;
    if r.dx=104 then begin z1:=0;z2:=0;z3:=0;z4:=0;z5:=0;z6:=0;z7:=0;z8:=0;z9:=0;z10:=0;z11:=0;z12:=3;end;
   if r.bx=1 then if r.dx>9 then wybor; {gdy zostanie nacisniety lewy przycisk
                                         myszki,na ktoryms z podswietlonych zaga-
                                         dnien, warunek jest po to, aby po
                                         wybraniu FAKTY nie wczytywalo sie
                                         od razu I-wsze zagadnienie}
                                    end;
    if keypressed then begin nac:=readkey; {jesli nacisniecie klawisza}
    case nac of
{GORA} #72 : begin
               if l2=3 then begin z2:=0;z1:=3;end;
               if l3=3 then begin z3:=0;z2:=3;end;
               if l4=3 then begin z4:=0;z3:=3;end;
               if l5=3 then begin z5:=0;z4:=3;end;
               if l6=3 then begin z6:=0;z5:=3;end;
               if l7=3 then begin z7:=0;z6:=3;end;
               if l8=3 then begin z8:=0;z7:=3;end;
               if l9=3 then begin z9:=0;z8:=3;end;
               if l10=3 then begin z10:=0;z9:=3;end;
               if l11=3 then begin z11:=0;z10:=3;end;
               if l12=3 then begin z12:=0;z11:=3;end;
               pgre;
             end;
{DOL}  #80 : begin
               if l1=3 then begin z1:=0;z2:=3;end;
               if l2=3 then begin z2:=0;z3:=3;end;
               if l3=3 then begin z3:=0;z4:=3;end;
               if l4=3 then begin z4:=0;z5:=3;end;
               if l5=3 then begin z5:=0;z6:=3;end;
               if l6=3 then begin z6:=0;z7:=3;end;
               if l7=3 then begin z7:=0;z8:=3;end;
               if l8=3 then begin z8:=0;z9:=3;end;
               if l9=3 then begin z9:=0;z10:=3;end;
               if l10=3 then begin z10:=0;z11:=3;end;
               if l11=3 then begin z11:=0;z12:=3;end;
               pgre;
             end;
{ENTER} #13 : Wybor;
{PRAWO} #77 : Wybor;
{LEWO}  #75 : break;
{ALT+F1}  #104 : begin dzial:='Wybuch wojny';nazpliku:='wybuch.txt';dp:=dp1;czytanie;end;
{ALT+F2}  #105 : begin dzial:='Bitwa graniczna';nazpliku:='granica.txt';dp:=dp2;czytanie;end;
{ALT+F3}  #106 : begin dzial:='Obrona wybrzeæa';nazpliku:='wybrzeze.txt';dp:=dp3;czytanie;end;
{ALT+F4}  #107 : begin dzial:='Utworzenie nowych armi';nazpliku:='nowarmie.txt';dp:=dp4;czytanie;end;
{ALT+F5}  #108 : begin dzial:='Bitwa nad Bzur•';nazpliku:='bzura.txt';dp:=dp5;czytanie;end;
{ALT+F6}  #109 : begin dzial:='Wkroczenie Armi Czerwonej';nazpliku:='czerwona.txt';dp:=dp6;czytanie;end;
{ALT+F7}  #110 : begin dzial:='Bitwa pod Tomaszowem Lubelskim';nazpliku:='tomaszow.txt';dp:=dp7;czytanie;end;
{ALT+F8}  #111 : begin dzial:='Obrona Lwowa';nazpliku:='lwow.txt';dp:=dp8;czytanie;end;
{ALT+F9}  #112 : begin dzial:='Obrona Warszawy';nazpliku:='warszawa.txt';dp:=dp9;czytanie;end;
{ALT+F10} #113 : begin dzial:='Obrona Modlina';nazpliku:='modlin.txt';dp:=dp10;czytanie;end;
{ALT+F11} #139 : begin dzial:='Ostatnie bitwy';nazpliku:='ostatnie.txt';dp:=dp11;czytanie;end;
{ALT+F12} #140 : begin dzial:='Podsumowanie "wrzeònia"';nazpliku:='bilans.txt';dp:=dp12;czytanie;end;
{ALT+Q} #16 : zakonczenie;
{ESC}   #27 : powrotdomenu:=true;
    end;
                       end;
  until nac=#27;
  end;

{glowna czesc procedury FAKTY}
   begin
     restorecrtmode;
     window(1,1,80,25);
     r.cx:=1;r.dx:=1;r.ax:=4;go; {ustalenie polozenia kursora myszy}
     r.ax:=1;go; {pokazanie kursora myszy}
     tc(10);wypel(1,2,80,24,177); {tlo}
     c1:=3;c2:=0;
     tc(15);tb(3);gw(3,1,'[*]');
     tb(0);gw(8,1,'Fakty');
     gw(62,1,'Kampania Wrzeòniowa');
     tb(0);tc(15);ramka(3,2,24,5); {ramka [*]}
     powrotdomenu:=false;
      repeat
       if powrotdomenu=true then break;
       tb(c1);gw(4,3,' Powr¢t do menu     ');
       tb(c2);gw(4,4,' Wyjòcie z programu ');
       r.ax:=3;go;
        if (r.cx>15) and (r.cx<185) then begin
           if (r.dx>8) and (r.dx<17) then begin c1:=3;c2:=0; {Powrot do menu}
              if r.bx=1 then break;       end;
           if (r.dx>16) and (r.dx<25) then begin c1:=0;c2:=3;  { Wyjscie  z }
              if r.bx=1 then zakonczenie;  end;                {  programu  }
                                         end;
        if (r.cx>55) and (r.cx<89) and (r.dx<9) and (r.bx=1)
        {gdy nacisniecie kursora myszki na napisie FAKTY to rozwiniecie menu}
        then begin wfakty;
                   tc(15);tb(3);gw(3,1,'[*]');    {po ukonczeniu...}
                   tb(0);gw(8,1,'Fakty');         {...procedury... }
                   tc(10);wypel(8,2,40,16,177);   {...WFAKTY wyczy-}
                   tb(0);tc(15);ramka(3,2,24,5);  {szczenie pola}
              end;
       if keypressed then begin nacklaw:=readkey;
       case nacklaw of
            #80 : begin c1:=0;c2:=3;pgre;end;
            #72 : begin c1:=3;c2:=0;pgre;end;
            #16 : zakonczenie;
            #77 : begin wfakty;
                        tc(15);tb(3);gw(3,1,'[*]');    {po ukonczeniu...}
                        tb(0);gw(8,1,'Fakty');         {...procedury... }
                        tc(10);wypel(8,2,40,16,177);   {...WFAKTY wyczy-}
                        tb(0);tc(15);ramka(3,2,24,5);  {szczenie pola}
                   end;
            #13 : begin
                   if c1=3 then break; { Powrot do menu glownego}
                   if c2=3 then zakonczenie; {Wyjscie z programu}
                  end;
            #27 : break;
       end;               end;
       until nacklaw=#27;
       setgraphmode(vgahi);
       NapisySztywne;
   end;

{*****************************************************************************
 ********************************** ZABAWA ***********************************
 ****************************************************************************}

  PROCEDURE ZABAWA;
  var v1,v2,                       {kolory}
      g1,g2,g3,h1,h2,h3,           {j.w.}
      dzien : integer;
      dzien2 :string;
      nacklw,na,Istr :char;

{**TEST**********************************************************************}
   Procedure Test;
     var zadpyt:boolean;
         pkt,
         nr {numer pytania} :integer;
         wyb:char;
         p,konc,ocena,koment:string;

    procedure LosPyt; {losowanie i odczytywanie pytania}
     var pplik:text;
         tekst,pyt,tnr:string;
         x,c,dobraodp,niewazne,odp,iks,iks2:integer;
     begin
       {ponizsze 3 linie : wylosowanie i otworzenie odpow. pliku z pytaniem}
      tc(15);
      randomize;
      str(random(iloscpytan)+1,pyt);
      assign(pplik,'pytania\pyt'+pyt);
      c:=0;
      inc(nr);
      str(nr,tnr);
      reset(pplik);
      repeat {petla odczytujaca tekst pytania z pliku}
       inc(c);
       readln(pplik,tekst);
       writeln(tekst);
      until c=9;
       readln(pplik,tekst); {odczytanie prawidlowego numeru odpowiedzi}
       val(tekst,dobraodp,niewazne);
       close(pplik);
       gw(3,2,tnr);
       gw(5,5,'( )');
       gw(5,6,'( )');
       gw(5,7,'( )');
       gw(5,8,'( )');
       gw(5,9,'( )');
       iks2:=5;
      repeat
       wypel(6,5,6,5,32);
       wypel(6,6,6,6,32);
       wypel(6,7,6,7,32);
       wypel(6,8,6,8,32);
       wypel(6,9,6,9,32);
       iks:=iks2;
       tc(15+blink);
       gw(6,iks,'*');
      wyb:=readkey;
       case wyb of
  {ALT+Q}  #16 : zakonczenie;
  {GORA}   #72 : begin
                   if iks=5 then iks2:=9;
                   if iks=6 then iks2:=5;
                   if iks=7 then iks2:=6;
                   if iks=8 then iks2:=7;
                   if iks=9 then iks2:=8;
                 end;
  {DOL}    #80 : begin
                   if iks=5 then iks2:=6;
                   if iks=6 then iks2:=7;
                   if iks=7 then iks2:=8;
                   if iks=8 then iks2:=9;
                   if iks=9 then iks2:=5;
                 end;
       end;
      until (wyb=#13) or (wyb=#27);
       odp:=iks-4; {odp.poprawna w zaleznosci od poloz. gwiazd. w chwili
                    nacisniecia Entera}
       if odp=dobraodp then pkt:=pkt+1;
     end;
    Begin
      tc(10);dramka(8,10,73,21);
      tc(15);gw(10,10,'TEST');tc(10);
      window(9,11,72,20);
      wypel(9,11,72,20,32);
     repeat
      clrscr;
      repeat tc(15);
      gw(3,2,'  Za chwil© komputer zada Ci 6 losowo wybranych pyta‰ testo-');
      gw(3,3,'wych. Aby wybraÜ prawidàow• odpowied´ naleæy kursorami usta-');
      gw(3,4,'wiÜ gwiazdk© w odpowiednim nawiasie i nacisn•Ü ENTER.');
      gw(3,7,'  Naciònij ENTER, aby przejòÜ dalej.');
      gw(3,8,'  Naciònij ESC, aby powrociÜ do menu.');
      gw(3,9,'  Naciònij ALT+Q, aby wyjòÜ z prgramu. ');
      Istr:=readkey;
      case Istr of
         #16 : zakonczenie;
         #27 : break;
      end;
      until Istr=#13;
      if Istr=#27 then break;
      clrscr;
      pkt:=0;nr:=0;
     repeat clrscr;LosPyt until (nr=6) or (wyb=#27); {6x odczytanie pytania}
      tc(15);
      clrscr;
      gw(7,3,'Ocena : ');
       konc:='y';
       if pkt=1 then konc:='';
       if (pkt=0) or (pkt>=5) then konc:='¢w';
       str(pkt,p);
      gw(7,6,'Zdobyàe(a)ò '+p+' punkt'+konc+'.');
       if pkt=6 then koment:='ùatwe byào, co?';
       if pkt=5 then koment:='Tak trzymaÜ!';
       if pkt=4 then koment:='Moæe si© czepiam, ale to jeszcze nie jest to';
       if pkt=3 then koment:='C¢´ mog© powiedzieÜ, na pewno nie wygl•da to kolorowo';
       if pkt=2 then koment:='Nie martw si©, w ko‰cu nie jest tak ´le';
       if pkt=1 then koment:='No c¢æ, niby ´le, ale to zawsze ten jeden punkt';
       if pkt=0 then koment:='Dno, ale nie martw si©, w ko‰cu to taki prosty materiaà';
      gw(7,7,+koment+'.');
       if pkt=6 then ocena:='bardzo dobra (+)';
       if pkt=5 then ocena:='bardzo dobra';
       if pkt=4 then ocena:='dobra';
       if pkt=3 then ocena:='dostateczna';
       if pkt=2 then ocena:='mierna';
       if pkt=1 then ocena:='niedostateczna (+)';
       if pkt=0 then ocena:='niedostateczna';
      gw(7,8,'Ocena : '+ocena+'.');
      readkey;
     until Istr=#27;
     window(1,1,80,25);
     tb(0);tc(10);wypel(8,10,73,21,177);
    End;
{****************************************************************************}

{**WRZESIEN'39***************************************************************}
   Procedure Wrzesien39;
    var key:char;
        txt:string;
        ile:byte;
        plikk:text;
    Begin
      window(1,1,80,25);
      tc(10);wypel(7,10,74,21,32);
      tc(15);gw(8,9,'WRZESIE„''39');tc(10);
      dzien:=1;
     repeat
      tc(10);
      window(1,1,80,25);
      dramka(6,9,75,22);
      dramka(6,20,75,22);
      gw(6,20,'Ã');gw(75,20,'π');
      window(7,10,74,21);
      tc(15);str(dzien,dzien2);
      assign(plikk,'wrzesien\'+dzien2);
      if dzien<10 then dzien2:=' '+dzien2;
      gw(26,12,#17+'  '+dzien2+' wrzesie‰  '+#16);
      ile:=0;
      gotoxy(1,1);
      reset(plikk);
     repeat
      inc(ile);
      readln(plikk,txt);
      writeln(txt);
     until ile=9;
      kursoff;
      close(plikk);
      key:=readkey;
      case key of
           #77 : begin
                   dzien:=dzien+1;
                   if dzien=31 then dzien:=1;
                 end;
           #75 : begin
                   dzien:=dzien-1;
                   if dzien=0 then dzien:=30;
                 end;
           #16 : zakonczenie;
      end;
      clrscr;
     until key=#27;
      window(1,1,80,25);
      tb(0);tc(10);wypel(6,9,75,22,177);
    End;
{****************************************************************************}

{****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************}


{**MINIGRA*******************************************************************}
Procedure MiniGra;
   Var pol:array[1..10] of array [0..7] of integer;
       ruch,dalej,kontynuowac,czekaj:char;
       xp,yp,
       ktora,dod,yl, {zmienne pomocnicze}
       kcity :integer;
       dods,
       gdy,war,kra,mdl,poz,ldz,wiz,lww,now,
       imie1,imie2:string;
       gd,wa,kr,mo,po,lo,wi,lw,no:integer;

{****************************************************************************
*****************************************************************************
GRAFIKI POL}
 procedure mt(xx,yy:integer);
  begin MoveTo(xp+xx,yp+yy) end;
 procedure lt(xx,yy:integer);
  begin LineTo(xp+xx,yp+yy) end;
 procedure a0;
  begin
    sts(2,0,4);
  end;
 procedure a2;
  begin
    sc(lightred);
    mt(50,100);lt(44,110);lt(39,113);lt(25,125);lt(23,135);lt(2,139);
  end;
 procedure a3;
  begin
    sls(0,0,1);
    str(po+1,poz);
    sc(10);ot(xp+5,yp+166,'Pozn.('+poz+')');
    str(po,poz);
    if po=0 then begin;kcity:=9;poz:='Z';end;
    sc(kcity);
    circle(xp+38,yp+162,3);
    ot(xp+5,yp+166,'Pozn.('+poz+')');
    sc(12);kcity:=red;
  end;
 procedure a4;
  begin
    mt(2,200);lt(25,218);lt(29,220);lt(33,225);lt(43,225);lt(50,219);
  end;
 procedure b0;
  begin
    mt(100,5);lt(90,7);lt(86,21);lt(84,25);lt(69,39);lt(64,42);lt(65,50);
    mt(90,7);lt(50,2);
  end;
 procedure b01;
  begin
    mt(65,50);lt(64,56);lt(55,55);lt(54,63);lt(63,83);lt(50,100);
  end;
 procedure b4;
  begin
    mt(50,219);lt(59,225);lt(61,230);lt(74,238);lt(73,250);
  end;
 procedure b5;
  begin
    mt(73,250);lt(80,261);lt(86,257);lt(95,263);lt(100,300);
  end;
 procedure b6;
  begin
    mt(100,300);lt(87,325);lt(100,350);
  end;
 procedure c0;
  begin
    mt(100,5);lt(120,22);lt(119,25);lt(115,23);lt(107,16);lt(104,20);lt(109,28);
    lt(108,36);lt(120,40);lt(146,33);lt(150,30);
    mt(146,33);lt(150,37);lt(135,50);
    mt(109,28);lt(100,50);
    sc(lightblue);sls(0,0,3);
    mt(120,40);lt(118,50);
  end;
 procedure c1;
  begin
    sc(lightblue);sls(0,0,3);
    mt(118,50);lt(118,65);lt(112,90);lt(110,100);
    sc(lightred);sls(0,0,1);
    mt(135,50);lt(120,65);lt(114,90);lt(127,91);lt(143,96);lt(150,100);
    mt(100,50);lt(115,54);lt(120,65);
  end;
 procedure c2;
  begin
    sc(lightblue);sls(0,0,3);
    mt(110,100);lt(105,125);lt(104,138);lt(113,143);lt(125,145);lt(150,147);
    sc(lightred);sls(0,0,1);
  end;
 procedure c6;
  begin
    sc(lightblue);sls(0,0,3);
    mt(150,324);lt(144,330);lt(125,330);lt(122,335);lt(113,338);lt(110,345);
    lt(112,349);
    sc(lightred);sls(0,0,1);
  end;
 procedure c7;
  begin
    mt(100,350);lt(109,368);lt(116,365);lt(119,373);lt(125,374);lt(128,368);
    lt(142,362);lt(149,372);lt(150,375);
  end;
 procedure d0;
  begin
    mt(150,30);lt(160,13);lt(162,5);lt(180,3);lt(182,2);
    l(xp+50,yp+2,xp+182,yp+2);
    tlo(xp+155,yp+5,9,12);
  end;
 procedure d2;
  begin
    mt(150,100);lt(182,115);lt(188,110);lt(193,114);lt(200,113);
    sc(lightblue);sls(0,0,3);
    mt(150,147);lt(200,150);
    sc(lightred);sls(0,0,1);
  end;
 procedure d3;
  begin
    sls(0,0,1);
    str(mo+1,mdl);
    sc(10);ot(xp+152,yp+162,'Modlin('+mdl+')');
    str(mo,mdl);
    if mo=0 then begin;kcity:=9;mdl:='Z';end;
    sc(kcity);
    circle(xp+187,yp+158,3);
    ot(xp+152,yp+162,'Modlin('+mdl+')');
    sc(12);kcity:=red;
  end;
 procedure d4;
  begin
    sls(0,0,1);
    str(lo+1,ldz);
    sc(10);ot(xp+110,yp+223,'L¢dz('+ldz+')');
    str(lo,ldz);
    if lo=0 then begin;kcity:=9;ldz:='Z';end;
    sc(kcity);
    circle(xp+142,yp+219,3);
    ot(xp+110,yp+223,'L¢dz('+ldz+')');
    sc(12);kcity:=red;
  end;
 procedure d6;
  begin
    sc(lightblue);sls(0,0,3);
    mt(200,300);lt(175,313);lt(158,318);lt(150,324);
    sc(lightred);sls(0,0,1);
    sls(0,0,1);
    str(kr+1,kra);
    sc(10);ot(xp+150,yp+330,'Krak¢w('+kra+')');
    str(kr,kra);
    if kr=0 then begin;kcity:=9;kra:='Z';end;
    sc(kcity);
    circle(xp+156,yp+326,3);
    ot(xp+150,yp+330,'Krak¢w('+kra+')');
    sc(12);kcity:=red;
  end;
 procedure d7;
  begin
    mt(150,375);lt(153,388);lt(165,386);lt(171,389);lt(178,372);lt(195,375);
    lt(200,379);
  end;
 procedure e2;
  begin
    mt(200,113);lt(275,105);lt(283,105);lt(300,100);
  end;
 procedure e3;
  begin
    sc(lightblue);sls(0,0,3);
    mt(200,150);lt(204,175);lt(216,200);
    mt(200,150);lt(210,155);lt(250,160);
    sls(0,0,1);
    str(wa+1,war);
    sc(10);ot(xp+202,yp+180,'Warsz.('+war+')');
    str(wa,war);
    if wa=0 then begin kcity:=9;war:='Z';end;
    sc(kcity);
    ot(xp+202,yp+180,'Warsz.('+war+')');
    circle(xp+209,yp+175,4);
    sc(lightred);kcity:=red;
  end;
 procedure e4;
  begin
    sc(lightblue);sls(0,0,3);
    mt(216,200);lt(222,225);lt(226,242);lt(226,250);
    sc(lightred);sls(0,0,1);
  end;
 procedure e5;
  begin
    sc(lightblue);sls(0,0,3);
    mt(226,250);lt(222,275);lt(213,287);lt(200,300);
    sc(lightred);sls(0,0,1);
  end;
 procedure e7;
  begin
    mt(200,379);lt(206,379);lt(220,372);lt(225,368);lt(230,371);lt(238,375);
    lt(247,377);lt(250,383);
  end;
 procedure f2;
  begin
    sls(0,0,1);
    str(wi+1,wiz);
    sc(10);ot(xp+253,yp+128,'Wizna('+wiz+')');
    str(wi,wiz);
    if wi=0 then begin;kcity:=9;wiz:='Z';end;
    sc(kcity);
    circle(xp+263,yp+124,3);
    ot(xp+253,yp+128,'Wizna('+wiz+')');
    sc(12);kcity:=red;
  end;
 procedure f3;
  begin
    sc(lightblue);sls(0,0,3);
    mt(250,160);lt(275,166);lt(295,175);lt(298,186);lt(300,200);
    sc(lightred);sls(0,0,1);
  end;
 procedure f7;
  begin
    mt(250,383);lt(270,391);lt(278,392);lt(288,398);
  end;
 procedure g0;
  begin
  end;
 procedure g1;
  begin
    mt(300,100);lt(312,85);lt(315,76);lt(311,70);lt(308,63);lt(318,54);
    lt(335,62);lt(338,74);lt(344,75);lt(350,50);
  end;
 procedure g4;
  begin
    sc(lightblue);sls(0,0,3);
    mt(300,200);lt(325,250);
    sc(lightred);sls(0,0,1);
  end;
 procedure g5;
  begin
    sc(lightblue);sls(0,0,3);
    mt(325,250);lt(350,300);
    sc(lightred);sls(0,0,1);
  end;
 procedure g6;
  begin
    sls(0,0,1);
    str(lw+1,lww);
    sc(10);ot(xp+310,yp+330,'Lw¢w('+lww+')');
    str(lw,lww);
    if lw=0 then begin kcity:=9;lww:='Z';end;
    sc(kcity);
    circle(xp+338,yp+325,3);
    ot(xp+310,yp+330,'Lw¢w('+lww+')');
    sc(12);kcity:=red;
  end;
 procedure h0;
  begin
    mt(350,50);lt(355,2);
  end;
 procedure h6;
  begin
    sc(lightblue);sls(0,0,3);
    mt(350,300);lt(355,313);lt(355,325);lt(357,340);lt(362,346);lt(364,347);
    sc(lightred);sls(0,0,1);
  end;
 procedure i1;
  begin
    mt(450,2);lt(441,50);
  end;
 procedure i2;
  begin
    mt(441,50);lt(436,75);lt(440,96);lt(439,100);
  end;
 procedure i3;
  begin
    mt(439,100);lt(437,120);lt(443,124);lt(450,150);
  end;
 procedure i6;
  begin
    mt(450,300);lt(427,325);lt(428,333);lt(431,338);lt(431,350);
  end;
 procedure i7;
  begin
    mt(431,350);lt(429,356);lt(434,363);lt(435,398);
  end;
 procedure j3;
  begin
    mt(450,150);lt(453,153);lt(469,152);lt(475,151);lt(476,160);lt(474,169);
    lt(478,180);lt(473,200);
  end;
 procedure j4;
  begin
    mt(473,200);lt(478,206);lt(486,211);lt(480,238);lt(479,250);
  end;
 procedure j5;
  begin
    mt(479,250);lt(478,270);lt(479,287);lt(450,300);
  end;
 procedure obraz;
  begin
    a0;a2;a3;a4;b0;b01;b4;b5;b6;c0;c1;c2;c6;c7;d0;d2;d3;d4;d6;d7;e2;
    e3;e4;e5;e7;f2;f3;f7;g1;g4;g5;g6;h0;h6;i1;i2;i3;i6;i7;j3;j4;j5;
  end;
{****************************************************************************
 ****************************************************************************}

{****************************************************************************
 ****************************************************************************}
 Var Nazwa,Power:string;
     Sila,V,B,Kraj,Nr,N:integer;
     Akt,Win:boolean;
     s1,s2,s3,s4,s5,s6,s7,s8:byte;
     akt1,akt2,akt3,akt4,ak1,ak2,ak3,ak4,
     akt5,ak5,akt6,ak6,akt7,ak7,akt8,ak8,
     wawa,krow,moin,wina,lwow,lodz,poan,
     z1,z2,z3,z4,z5,z6,z7,z8 :boolean;
     n1,n2,n3,n4,n5,n6,n7,n8,
     m1,m2,m3,m4,m5,m6,m7,m8,
     czas :integer;
     naz1,naz2,naz3,naz4,naz5,naz6,naz7,naz8,
     sczas :string;
     r1,r2,r3,r4,r5,r6,r7,r8 :byte;


  procedure pos(qqq,www:integer);
  begin v:=qqq;b:=www;end;
{****************************************************************************
 ****************************************************************************}
 Procedure Armia;
  var v1,b1:integer;
  Begin
    sls(0,0,3);sc(kraj);
    v1:=(v*50)-50+xp;
    b1:=(b*50)+yp;
    rt(v1+10,b1+10,v1+40,b1+40);
    sls(0,0,1);rt(v1+10,b1+10,v1+20,b1+20);
    str(sila,power);
    sts(2,0,6);sc(0);ot(v1+27,b1+10,+power);
    sts(2,0,4);ot(v1+14,b1+27,+nazwa);
    tlo(v1+15,b1+15,lightgreen,kraj);
    if akt=true then begin tlo(v1+15,b1+15,15,kraj);nr:=n;end;
  End;
 Procedure Ruchy;
  var ru:integer;rs:string;
  Begin
    if ak1=true then ru:=r1;if ak5=true then ru:=r5;
    if ak2=true then ru:=r2;if ak6=true then ru:=r6;
    if ak3=true then ru:=r3;if ak7=true then ru:=r7;
    if ak4=true then ru:=r4;if ak8=true then ru:=r8;
    sc(0);sts(2,0,4);
    ot(xp+503,75,'       0');ot(xp+503,75,'       1');
    sc(15);str(ru,rs);ot(xp+503,75,'       '+rs);
  End;
 Procedure Info;
  Begin
    sc(0);sts(2,0,4);
    ot(xp+503,yp+50,'XIX-ty');ot(xp+503,yp+62,'Korpus Pancerny');ot(xp+503,yp+74,'gen.Guderiana');
    ot(xp+503,yp+50,'8-ma');ot(xp+503,yp+62,'Armia (Piechota)');ot(xp+503,yp+74,'gen.Blaskowitza');
    ot(xp+503,yp+50,'4-ta');ot(xp+503,yp+62,'Armia (Piechota)');ot(xp+503,yp+74,'gen.Kluga');
    ot(xp+503,yp+50,'1-wsza');ot(xp+503,yp+62,'Armia (Piechota)');ot(xp+503,yp+74,'gen.Kuchlera');
    ot(xp+503,yp+50,'Armia "Modlin"');ot(xp+503,yp+62,'Jedn.pancerna');ot(xp+503,yp+74,'gen.P.-Krukowicza');
    ot(xp+503,yp+50,'Armia "Lodz"');ot(xp+503,yp+62,'gen.Rommla');
    ot(xp+503,yp+50,'Armia "Poznan"');ot(xp+503,yp+62,'gen.Kutrzeby');
    ot(xp+503,yp+50,'SGO "Narew"');ot(xp+503,yp+62,'gen.Mlot-Fijalk.');
    ot(xp+503,yp+38,'NIEMCY ('+imie1+')');ot(xp+503,yp+38,'POLSKA ('+imie2+')');
    sc(15);ot(xp+503,75,'Ruch : ');
    if kraj=blue then begin ot(xp+503,yp+38,'NIEMCY ('+imie1+')');
    if ak1=true then begin
                       ot(xp+503,yp+50,'XIX-ty');
                       ot(xp+503,yp+62,'Korpus Pancerny');
                       ot(xp+503,yp+74,'gen.Guderiana');
                     end;
    if ak2=true then begin
                       ot(xp+503,yp+50,'8-ma');
                       ot(xp+503,yp+62,'Armia (Piechota)');
                       ot(xp+503,yp+74,'gen.Blaskowitza');
                     end;
    if ak3=true then begin
                       ot(xp+503,yp+50,'4-ta');
                       ot(xp+503,yp+62,'Armia (Piechota)');
                       ot(xp+503,yp+74,'gen.Kluga');
                     end;
    if ak4=true then begin
                       ot(xp+503,yp+50,'1-wsza');
                       ot(xp+503,yp+62,'Armia (Piechota)');
                       ot(xp+503,yp+74,'gen.Kuchlera');
                     end;
                     end;
    if kraj=red then begin ot(xp+503,yp+38,'POLSKA ('+imie2+')');
    if ak5=true then begin
                       ot(xp+503,yp+50,'Armia "Modlin"');
                       ot(xp+503,yp+62,'Jedn.pancerna');
                       ot(xp+503,yp+74,'gen.P.-Krukowicza');
                     end;
    if ak6=true then begin
                       ot(xp+503,yp+50,'Armia "Lodz"');
                       ot(xp+503,yp+62,'gen.Rommla');
                     end;
    if ak7=true then begin
                       ot(xp+503,yp+50,'Armia "Poznan"');
                       ot(xp+503,yp+62,'gen.Kutrzeby');
                     end;
    if ak8=true then begin
                       ot(xp+503,yp+50,'SGO "Narew"');
                       ot(xp+503,yp+62,'gen.Mlot-Fijalk.');
                     end;
                     end;
  End;
 Procedure Clean;
  var v1,b1,kol:integer;
  Begin
    sls(0,0,3);sc(10);
    v1:=(v*50)-50+xp;
    b1:=(b*50)+yp;
    str(sila,power);
    sts(2,0,6);ot(v1+27,b1+10,+power);
    sts(2,0,4);ot(v1+14,b1+27,+nazwa);
    rt(v1+10,b1+10,v1+40,b1+40);
    sls(0,0,1);rt(v1+10,b1+10,v1+20,b1+20);
    tlo(v1+15,b1+15,10,10);
    kcity:=red;
  End;
  var nq,mq:integer;
  procedure polmiasto;
   begin
   if (pol[5,3]<>nr) and (pol[4,6]<>nr) and
      (pol[4,3]<>nr) and (pol[1,3]<>nr) and (pol[3,4]<>nr) and
      (pol[6,2]<>nr) and (pol[7,6]<>nr) then pol[nq,mq]:=0;
     if pol[5,3]=nr then pol[5,3]:=10;
     if pol[4,6]=nr then pol[4,6]:=20;
     if pol[4,3]=nr then pol[4,3]:=30;
     if pol[1,3]=nr then pol[1,3]:=40;
     if pol[3,4]=nr then pol[3,4]:=50;
     if pol[6,2]=nr then pol[6,2]:=60;
     if pol[7,6]=nr then pol[7,6]:=70;
   end;
  procedure city;
   begin
     if kraj=blue then begin
   if (pol[5,3]<>nr) and (pol[4,6]<>nr) and
      (pol[4,3]<>nr) and (pol[1,3]<>nr) and (pol[3,4]<>nr) and
      (pol[6,2]<>nr) and (pol[7,6]<>nr) then begin;
     if akt1=true then pol[n1,m1]:=0;
     if akt2=true then pol[n2,m2]:=0;
     if akt3=true then pol[n3,m3]:=0;
     if akt4=true then pol[n4,m4]:=0;end;
     if pol[2,0]=nr then pol[2,0]:=0;
     if pol[5,3]=nr then pol[5,3]:=0;
     if pol[4,6]=nr then pol[4,6]:=0;
     if pol[4,3]=nr then pol[4,3]:=0;
     if pol[1,3]=nr then pol[1,3]:=0;
     if pol[3,4]=nr then pol[3,4]:=0;
     if pol[6,2]=nr then pol[6,2]:=0;
     if pol[7,6]=nr then pol[7,6]:=0;
                       end;
     if kraj=red then begin
     if akt5=true then begin nr:=5;nq:=n5;mq:=m5;polmiasto;end;
     if akt6=true then begin nr:=6;nq:=n6;mq:=m6;polmiasto;end;
     if akt7=true then begin nr:=7;nq:=n7;mq:=m7;polmiasto;end;
     if akt8=true then begin nr:=8;nq:=n8;mq:=m8;polmiasto;end;
                      end;
   end;

{****************************************************************************}

  procedure walka;
   const PR=#77;LE=#75;GR=#72;DL=#80;
   var s,wynik,u,i:integer;
    procedure ncln;
     begin
       str(sila,power);
       sc(10);sts(2,0,6);ot((v*50)-50+xp+27,(b*50)+yp+10,+power);
     end;
   begin
     if akt1=true then begin u:=n1;i:=m1;s:=s1;end;
     if akt2=true then begin u:=n2;i:=m2;s:=s2;end;
     if akt3=true then begin u:=n3;i:=m3;s:=s3;end;
     if akt4=true then begin u:=n4;i:=m4;s:=s4;end;
     if akt5=true then begin u:=n5;i:=m5;s:=s5;end;
     if akt6=true then begin u:=n6;i:=m6;s:=s6;end;
     if akt7=true then begin u:=n7;i:=m7;s:=s7;end;
     if akt8=true then begin u:=n8;i:=m8;s:=s8;end;
     win:=false;
     randomize;
       sc(15);
       sts(7,0,1);ot(xp+503,yp+100,'Bitwa');
       sts(2,0,4);ot(xp+510,yp+130,'Walka trwa');
       sts(7,0,3);czas:=4;
       repeat
       sc(0);ot(xp+530,yp+145,+sczas);
       czas:=czas-1;
       str(czas,sczas);
       sc(15);ot(xp+530,yp+145,+sczas);
       delay(random(300)+150);
       until czas=1;
       sc(15);sts(2,0,4);
       wynik:=random(2);
   if kraj=blue then begin
                  case wynik of
     {przegrana}   0 : begin
                        ot(xp+510,yp+180,'Walka przegrana.');
                        pos(u,i);sila:=s;ncln;s:=s-1;
                       end;
       {wygrana}   1 : begin
                        ot(xp+510,yp+180,'Walka wygrana.');
                         kraj:=red;
                         pos(n5,m5);sila:=s5;ncln;
                         pos(n6,m6);sila:=s6;ncln;
                         pos(n7,m7);sila:=s7;ncln;
                         pos(n8,m8);sila:=s8;ncln;
                          case ruch of
                           LE:begin
                               if pol[u-1,i]=5 then s5:=s5-1;
                               if pol[u-1,i]=6 then s6:=s6-1;
                               if pol[u-1,i]=7 then s7:=s7-1;
                               if pol[u-1,i]=8 then s8:=s8-1;
                              end;
                           PR:begin
                               if pol[u+1,i]=5 then s5:=s5-1;
                               if pol[u+1,i]=6 then s6:=s6-1;
                               if pol[u+1,i]=7 then s7:=s7-1;
                               if pol[u+1,i]=8 then s8:=s8-1;
                              end;
                           GR:begin
                               if pol[u,i-1]=5 then s5:=s5-1;
                               if pol[u,i-1]=6 then s6:=s6-1;
                               if pol[u,i-1]=7 then s7:=s7-1;
                               if pol[u,i-1]=8 then s8:=s8-1;
                              end;
                           DL:begin
                               if pol[u,i+1]=5 then s5:=s5-1;
                               if pol[u,i+1]=6 then s6:=s6-1;
                               if pol[u,i+1]=7 then s7:=s7-1;
                               if pol[u,i+1]=8 then s8:=s8-1;
                              end;
                          end;
                       if s5<>0 then begin pos(n5,m5);nazwa:=naz5;sila:=s5;armia;end;
                       if s6<>0 then begin pos(n6,m6);nazwa:=naz6;sila:=s6;armia;end;
                       if s7<>0 then begin pos(n7,m7);nazwa:=naz7;sila:=s7;armia;end;
                       if s8<>0 then begin pos(n8,m8);nazwa:=naz8;sila:=s8;armia;end;
                       if (s5=0) and (z5=false) then begin z5:=true;pos(n5,m5);nazwa:=naz5;nr:=5;polmiasto;clean;win:=true;end;
                       if (s6=0) and (z6=false) then begin z6:=true;pos(n6,m6);nazwa:=naz6;nr:=6;polmiasto;clean;win:=true;end;
                       if (s7=0) and (z7=false) then begin z7:=true;pos(n7,m7);nazwa:=naz7;nr:=7;polmiasto;clean;win:=true;end;
                       if (s8=0) and (z8=false) then begin z8:=true;pos(n8,m8);nazwa:=naz8;nr:=8;polmiasto;clean;win:=true;end;
                       end;
                  end;
                       kraj:=blue;
                       end;
   if kraj=red then begin
                  case wynik of
     {przegrana}   0 : begin
                        ot(xp+510,yp+180,'Walka przegrana.');
                        pos(u,i);sila:=s;ncln;s:=s-1;
                       end;
       {wygrana}   1 : begin
                        ot(xp+510,yp+180,'Walka wygrana.');
                         kraj:=blue;
                         pos(n1,m1);sila:=s1;ncln;
                         pos(n2,m2);sila:=s2;ncln;
                         pos(n3,m3);sila:=s3;ncln;
                         pos(n4,m4);sila:=s4;ncln;
                          case ruch of
                           LE:begin
                               if pol[u-1,i]=1 then s1:=s1-1;
                               if pol[u-1,i]=2 then s2:=s2-1;
                               if pol[u-1,i]=3 then s3:=s3-1;
                               if pol[u-1,i]=4 then s4:=s4-1;
                              end;
                           PR:begin
                               if pol[u+1,i]=1 then s1:=s1-1;
                               if pol[u+1,i]=2 then s2:=s2-1;
                               if pol[u+1,i]=3 then s3:=s3-1;
                               if pol[u+1,i]=4 then s4:=s4-1;
                              end;
                           GR:begin
                               if pol[u,i-1]=1 then s1:=s1-1;
                               if pol[u,i-1]=2 then s2:=s2-1;
                               if pol[u,i-1]=3 then s3:=s3-1;
                               if pol[u,i-1]=4 then s4:=s4-1;
                              end;
                           DL:begin
                               if pol[u,i+1]=1 then s1:=s1-1;
                               if pol[u,i+1]=2 then s2:=s2-1;
                               if pol[u,i+1]=3 then s3:=s3-1;
                               if pol[u,i+1]=4 then s4:=s4-1;
                              end;
                          end;
                       if s1<>0 then begin pos(n1,m1);nazwa:=naz1;sila:=s1;armia;end;
                       if s2<>0 then begin pos(n2,m2);nazwa:=naz2;sila:=s2;armia;end;
                       if s3<>0 then begin pos(n3,m3);nazwa:=naz3;sila:=s3;armia;end;
                       if s4<>0 then begin pos(n4,m4);nazwa:=naz4;sila:=s4;armia;end;
                       if (s1=0) and (z1=false) then begin z1:=true;pos(n1,m1);nazwa:=naz1;clean;pol[n1,m1]:=0;win:=true;end;
                       if (s2=0) and (z2=false) then begin z2:=true;pos(n2,m2);nazwa:=naz2;clean;pol[n2,m2]:=0;win:=true;end;
                       if (s3=0) and (z3=false) then begin z3:=true;pos(n3,m3);nazwa:=naz3;clean;pol[n3,m3]:=0;win:=true;end;
                       if (s4=0) and (z4=false) then begin z4:=true;pos(n4,m4);nazwa:=naz4;clean;pol[n4,m4]:=0;win:=true;end;
                       end;
                   end;
                       kraj:=red;
                    end;
     obraz;
     if akt1=true then begin r1:=0;s1:=s;end;
     if akt2=true then begin r2:=0;s2:=s;end;
     if akt3=true then begin r3:=0;s3:=s;end;
     if akt4=true then begin r4:=0;s4:=s;end;
     if akt5=true then begin r5:=0;s5:=s;end;
     if akt6=true then begin r6:=0;s6:=s;end;
     if akt7=true then begin r7:=0;s7:=s;end;
     if akt8=true then begin r8:=0;s8:=s;end;
   end;

{****************************************************************************}
  procedure miasto;
   const PR=#77;LE=#75;GR=#72;DL=#80;
   var s,wynik,u,i:integer;
    procedure ncln;
     begin
       str(sila,power);
       sc(10);sts(2,0,6);ot((u*50)-50+xp+27,(i*50)+yp+10,+power);
     end;
   begin
     sc(0);sts(7,0,1);ot(xp+503,yp+100,'Bitwa');
     ot(xp+510,yp+180,'Walka przegrana.');
     ot(xp+510,yp+180,'Walka wygrana.');
     ot(xp+530,yp+145,'1');
     if akt1=true then begin u:=n1;i:=m1;s:=s1;end;
     if akt2=true then begin u:=n2;i:=m2;s:=s2;end;
     if akt3=true then begin u:=n3;i:=m3;s:=s3;end;
     if akt4=true then begin u:=n4;i:=m4;s:=s4;end;
     win:=false;
     randomize;
     if kraj=blue then begin
                       sc(15);
                       sts(7,0,1);ot(xp+503,yp+100,'Miasto');
                       sts(2,0,4);ot(xp+510,yp+130,'Walka trwa');
                       sts(7,0,3);czas:=4;
                       repeat
                       sc(0);ot(xp+530,yp+145,+sczas);
                       czas:=czas-1;
                       str(czas,sczas);
                       sc(15);ot(xp+530,yp+145,+sczas);
                       delay(random(300)+150);
                       until czas=1;
                       sc(15);sts(2,0,4);
                       wynik:=random(2);
                  case wynik of
     {przegrana}   0 : begin
                        ot(xp+510,yp+180,'Walka przegrana.');
                        pos(u,i);sila:=s;ncln;s:=s-1;
                       end;
       {wygrana}   1 : begin
                         ot(xp+510,yp+180,'Walka wygrana.');
                         case ruch of
                           LE:begin
                               if pol[u-1,i]=pol[5,3] then wa:=wa-1;
                               if pol[u-1,i]=pol[4,6] then kr:=kr-1;
                               if pol[u-1,i]=pol[4,3] then mo:=mo-1;
                               if pol[u-1,i]=pol[1,3] then po:=po-1;
                               if pol[u-1,i]=pol[3,4] then lo:=lo-1;
                               if pol[u-1,i]=pol[6,2] then wi:=wi-1;
                               if pol[u-1,i]=pol[7,6] then lw:=lw-1;
                              end;
                           PR:begin
                               if pol[u+1,i]=pol[5,3] then wa:=wa-1;
                               if pol[u+1,i]=pol[4,6] then kr:=kr-1;
                               if pol[u+1,i]=pol[4,3] then mo:=mo-1;
                               if pol[u+1,i]=pol[1,3] then po:=po-1;
                               if pol[u+1,i]=pol[3,4] then lo:=lo-1;
                               if pol[u+1,i]=pol[6,2] then wi:=wi-1;
                               if pol[u+1,i]=pol[7,6] then lw:=lw-1;
                              end;
                           GR:begin
                               if pol[u,i-1]=pol[5,3] then wa:=wa-1;
                               if pol[u,i-1]=pol[4,6] then kr:=kr-1;
                               if pol[u,i-1]=pol[4,3] then mo:=mo-1;
                               if pol[u,i-1]=pol[1,3] then po:=po-1;
                               if pol[u,i-1]=pol[3,4] then lo:=lo-1;
                               if pol[u,i-1]=pol[6,2] then wi:=wi-1;
                               if pol[u,i-1]=pol[7,6] then lw:=lw-1;
                              end;
                           DL:begin
                               if pol[u,i+1]=pol[5,3] then wa:=wa-1;
                               if pol[u,i+1]=pol[4,6] then kr:=kr-1;
                               if pol[u,i+1]=pol[4,3] then mo:=mo-1;
                               if pol[u,i+1]=pol[1,3] then po:=po-1;
                               if pol[u,i+1]=pol[3,4] then lo:=lo-1;
                               if pol[u,i+1]=pol[6,2] then wi:=wi-1;
                               if pol[u,i+1]=pol[7,6] then lw:=lw-1;
                              end;
                          end;
                    if (wa=0) or (kr=0) or (mo=0) or (po=0) or
                       (lo=0) or (wi=0) or (lw=0) then begin
                    if (wa=0) and (wawa=false) then begin wawa:=true;pol[5,3]:=0;win:=true;end;
                    if (kr=0) and (krow=false) then begin krow:=true;pol[4,6]:=0;win:=true;end;
                    if (mo=0) and (moin=false) then begin moin:=true;pol[4,3]:=0;win:=true;end;
                    if (po=0) and (poan=false) then begin poan:=true;pol[1,3]:=0;win:=true;end;
                    if (lo=0) and (lodz=false) then begin lodz:=true;pol[3,4]:=0;win:=true;end;
                    if (wi=0) and (wina=false) then begin wina:=true;pol[6,2]:=0;win:=true;end;
                    if (lw=0) and (lwow=false) then begin lwow:=true;pol[7,6]:=0;win:=true;end;
                                                           end;
                       end;
                  end;
                             end;

     obraz;
     if akt1=true then begin r1:=0;s1:=s;end;
     if akt2=true then begin r2:=0;s2:=s;end;
     if akt3=true then begin r3:=0;s3:=s;end;
     if akt4=true then begin r4:=0;s4:=s;end;
   end;


{ AXIS **********************************************************************
 ****************************************************************************
 ****************************************************************************}

  Procedure AXIS;
   Begin
     kraj:=blue;
     ak1:=true;ak2:=false;ak3:=false;ak4:=false;
     akt1:=ak1;akt2:=ak2;akt3:=ak3;akt4:=ak4;
     r1:=1;r2:=1;r3:=1;r4:=1;
     ruchy;info;
     if (s1=0) and (z1=false) then begin ak1:=false;ak2:=true;ak3:=false;ak4:=false;
                  pos(n1,m1);nazwa:=naz1;sila:=s1;clean;pol[n1,m1]:=0;end;
     if (s2=0) and (z2=false) then begin ak1:=false;ak2:=false;ak3:=true;ak4:=false;
                  pos(n2,m2);nazwa:=naz2;sila:=s2;clean;pol[n2,m2]:=0;end;
     if (s3=0) and (z3=false) then begin ak1:=false;ak2:=false;ak3:=false;ak4:=true;
                  pos(n3,m3);nazwa:=naz3;sila:=s3;clean;pol[n3,m3]:=0;end;
     if (s4=0) and (z4=false) then begin ak1:=true;ak2:=false;ak3:=false;ak4:=false;
                  pos(n4,m4);nazwa:=naz4;sila:=s4;clean;pol[n4,m4]:=0;end;
    repeat
     akt1:=ak1;akt2:=ak2;akt3:=ak3;akt4:=ak4;
     akt5:=false;akt6:=false;akt7:=false;akt8:=false;
     kraj:=blue;
     if s1>0 then begin akt:=akt1;pos(n1,m1);nazwa:=naz1;sila:=s1;n:=1;armia;end;
     if s2>0 then begin akt:=akt2;pos(n2,m2);nazwa:=naz2;sila:=s2;n:=2;armia;end;
     if s3>0 then begin akt:=akt3;pos(n3,m3);nazwa:=naz3;sila:=s3;n:=3;armia;end;
     if s4>0 then begin akt:=akt4;pos(n4,m4);nazwa:=naz4;sila:=s4;n:=4;armia;end;
     kraj:=red;
     if s5>0 then begin akt:=akt5;pos(n5,m5);nazwa:=naz5;sila:=s5;n:=5;armia;end;
     if s6>0 then begin akt:=akt6;pos(n6,m6);nazwa:=naz6;sila:=s6;n:=6;armia;end;
     if s7>0 then begin akt:=akt7;pos(n7,m7);nazwa:=naz7;sila:=s7;n:=7;armia;end;
     if s8>0 then begin akt:=akt8;pos(n8,m8);nazwa:=naz8;sila:=s8;n:=8;armia;end;
     kraj:=blue;
     if (wa=0) and (kr=0) and (mo=0) and (po=0) and (lo=0) and (wi=0) and (lw=0) then break;
     if (s1=0) and (s2=0) and (s3=0) and (s4=0) then break;
     ruch:=readkey;
     sts(7,0,3);sc(0);ot(xp+530,yp+145,'1');
     sts(7,0,1);ot(xp+503,yp+100,'Bitwa');
                ot(xp+503,yp+100,'Miasto');
     sts(2,0,4);ot(xp+510,yp+130,'Walka trwa');
                ot(xp+510,yp+180,'Walka przegrana.');
                ot(xp+510,yp+180,'Walka wygrana.');
     case ruch of
          #82 : begin
                  if s1=0 then begin
                     if akt1=true then begin ak1:=false;ak2:=true;end;
                     if akt2=true then begin ak2:=false;ak3:=true;end;
                     if akt3=true then begin ak3:=false;ak4:=true;end;
                     if akt4=true then begin ak4:=false;ak2:=true;end;
                               end;
                  if s2=0 then begin
                     if akt1=true then begin ak1:=false;ak3:=true;end;
                     if akt2=true then begin ak2:=false;ak3:=true;end;
                     if akt3=true then begin ak3:=false;ak4:=true;end;
                     if akt4=true then begin ak4:=false;ak1:=true;end;
                               end;
                  if s3=0 then begin
                     if akt1=true then begin ak1:=false;ak2:=true;end;
                     if akt2=true then begin ak2:=false;ak4:=true;end;
                     if akt3=true then begin ak3:=false;ak4:=true;end;
                     if akt4=true then begin ak4:=false;ak1:=true;end;
                               end;
                  if s4=0 then begin
                     if akt1=true then begin ak1:=false;ak2:=true;end;
                     if akt2=true then begin ak2:=false;ak3:=true;end;
                     if akt3=true then begin ak3:=false;ak1:=true;end;
                     if akt4=true then begin ak4:=false;ak1:=true;end;
                               end;
                  if (s1=0) and (s2=0) then begin
                     if akt3=true then begin ak3:=false;ak4:=true;end;
                     if akt4=true then begin ak4:=false;ak3:=true;end;
                                            end;
                  if (s1=0) and (s3=0) then begin
                     if akt2=true then begin ak2:=false;ak4:=true;end;
                     if akt4=true then begin ak4:=false;ak2:=true;end;
                                            end;
                  if (s1=0) and (s4=0) then begin
                     if akt2=true then begin ak2:=false;ak3:=true;end;
                     if akt3=true then begin ak3:=false;ak2:=true;end;
                                            end;
                  if (s2=0) and (s3=0) then begin
                     if akt1=true then begin ak1:=false;ak4:=true;end;
                     if akt4=true then begin ak4:=false;ak1:=true;end;
                                            end;
                  if (s2=0) and (s4=0) then begin
                     if akt1=true then begin ak1:=false;ak3:=true;end;
                     if akt3=true then begin ak3:=false;ak1:=true;end;
                                            end;
                  if (s3=0) and (s4=0) then begin
                     if akt1=true then begin ak1:=false;ak2:=true;end;
                     if akt2=true then begin ak2:=false;ak1:=true;end;
                                            end;
                  if (akt1=true) and (s1>0) then begin ak1:=false;ak2:=true;end;
                  if (akt2=true) and (s2>0) then begin ak2:=false;ak3:=true;end;
                  if (akt3=true) and (s3>0) then begin ak3:=false;ak4:=true;end;
                  if (akt4=true) and (s4>0) then begin ak4:=false;ak1:=true;end;
                  if (s4>0) and (s1=0) and (s2=0) and (s3=0) then
                  begin ak1:=false;ak2:=false;ak3:=false;ak4:=true;end;
                  if (s3>0) and (s1=0) and (s2=0) and (s4=0) then
                  begin ak1:=false;ak2:=false;ak3:=true;ak4:=false;end;
                  if (s2>0) and (s1=0) and (s4=0) and (s3=0) then
                  begin ak1:=false;ak2:=false;ak3:=false;ak2:=true;end;
                  if (s1>0) and (s4=0) and (s2=0) and (s3=0) then
                  begin ak1:=true;ak2:=false;ak3:=false;ak4:=false;end;
                  info;
                end;
          #77 : begin {W PRAWO}
                   if (akt1=true) and (s1>0) and (r1>0) then begin
                              win:=true;
                              if (pol[n1+1,m1]>=5) and (pol[n1+1,m1]<9) then walka;
                              if pol[n1+1,m1]>9 then miasto;
                              if (n1<10) and (win=true) then begin
                              city;
                              pos(n1,m1);nazwa:=naz1;sila:=s1;clean;
                              inc(n1);
                              pol[n1,m1]:=nr;
                              r1:=0;end;
                                    end;
                  if (akt2=true) and (s2>0) and (r2>0) then begin
                              win:=true;
                              if (pol[n2+1,m2]>=5) and (pol[n2+1,m2]<9) then walka;
                              if pol[n2+1,m2]>9 then miasto;
                              if (n2<10) and (win=true) then begin
                              city;
                              pos(n2,m2);nazwa:=naz2;sila:=s2;clean;
                              inc(n2);
                              pol[n2,m2]:=nr;
                              r2:=0;end;
                                    end;
                  if (akt3=true) and (s3>0) and (r3>0) then begin
                              win:=true;
                              if (pol[n3+1,m3]>=5) and (pol[n3+1,m3]<9) then walka;
                              if pol[n3+1,m3]>9 then miasto;
                              if (n3<10) and (win=true) then begin
                              city;
                              pos(n3,m3);nazwa:=naz3;sila:=s3;clean;
                              inc(n3);
                              pol[n3,m3]:=nr;
                              r3:=0;end;
                                    end;
                  if (akt4=true) and (s4>0) and (r4>0) then begin
                              win:=true;
                              if (pol[n4+1,m4]>=5) and (pol[n4+1,m4]<9) then walka;
                              if pol[n4+1,m4]>9 then miasto;
                              if (n4<10) and (win=true) then begin
                              city;
                              pos(n4,m4);nazwa:=naz4;sila:=s4;clean;
                              inc(n4);
                              pol[n4,m4]:=nr;
                              r4:=0;end;
                                    end;
                       end;
          #75 : begin {W LEWO}
                  if (akt1=true) and (s1>0) and (r1>0) then begin
                              win:=true;
                              if (pol[n1-1,m1]>=5) and (pol[n1-1,m1]<9) then walka;
                              if pol[n1-1,m1]>9 then miasto;
                              if (n1>1) and (win=true) then begin
                              city;
                              pos(n1,m1);nazwa:=naz1;sila:=s1;clean;
                              n1:=n1-1;
                              pol[n1,m1]:=nr;
                              r1:=0;end;
                                    end;
                  if (akt2=true) and (s2>0) and (r2>0) then begin
                              win:=true;
                              if (pol[n2-1,m2]>=5) and (pol[n2-1,m2]<9) then walka;
                              if pol[n2-1,m2]>9 then miasto;
                              if (n2>1) and (win=true) then begin
                              city;
                              pos(n2,m2);nazwa:=naz2;sila:=s2;clean;
                              n2:=n2-1;
                              pol[n2,m2]:=nr;
                              r2:=0;end;
                                    end;
                  if (akt3=true) and (s3>0) and (r3>0) then begin
                              win:=true;
                              if (pol[n3-1,m3]>=5) and (pol[n3-1,m3]<9) then walka;
                              if pol[n3-1,m3]>9 then miasto;
                              if (n3>1) and (win=true) then begin
                              city;
                              pos(n3,m3);nazwa:=naz3;sila:=s3;clean;
                              n3:=n3-1;
                              pol[n3,m3]:=nr;
                              r3:=0;end;
                                    end;
                  if (akt4=true) and (s4>0) and (r4>0) then begin
                              win:=true;
                              if (pol[n4-1,m4]>=5) and (pol[n4-1,m4]<9) then walka;
                              if pol[n4-1,m4]>9 then miasto;
                              if (n4>1) and (win=true) then begin
                              city;
                              pos(n4,m4);nazwa:=naz4;sila:=s4;clean;
                              n4:=n4-1;
                              pol[n4,m4]:=nr;
                              r4:=0;end;
                                    end;
                end;
          #80 : begin {NA DOL}
                  if (akt1=true) and (s1>0) and (r1>0) then begin
                              win:=true;
                              if (pol[n1,m1+1]>=5) and (pol[n1,m1+1]<9) then walka;
                              if pol[n1,m1+1]>9 then miasto;
                              if (m1<7) and (win=true) then begin
                              city;
                              pos(n1,m1);nazwa:=naz1;sila:=s1;clean;
                              inc(m1);
                              pol[n1,m1]:=nr;
                              r1:=0;end;
                                    end;
                  if (akt2=true) and (s2>0) and (r2>0) then begin
                              win:=true;
                              if (pol[n2,m2+1]>=5) and (pol[n2,m2+1]<9) then walka;
                              if pol[n2,m2+1]>9 then miasto;
                              if (m2<7) and (win=true) then begin
                              city;
                              pos(n2,m2);nazwa:=naz2;sila:=s2;clean;
                              inc(m2);
                              pol[n2,m2]:=nr;
                              r2:=0;end;
                                    end;
                  if (akt3=true) and (s3>0) and (r3>0) then begin
                              win:=true;
                              if (pol[n3,m3+1]>=5) and (pol[n3,m3+1]<9) then walka;
                              if pol[n3,m3+1]>9 then miasto;
                              if (m3<7) and (win=true) then begin
                              city;
                              pos(n3,m3);nazwa:=naz3;sila:=s3;clean;
                              inc(m3);
                              pol[n3,m3]:=nr;
                              r3:=0;end;
                                    end;
                  if (akt4=true) and (s4>0) and (r4>0) then begin
                              win:=true;
                              if (pol[n4,m4+1]>=5) and (pol[n4,m4+1]<9) then walka;
                              if pol[n4,m4+1]>9 then miasto;
                              if (m4<7) and (win=true) then begin
                              city;
                              pos(n4,m4);nazwa:=naz4;sila:=s4;clean;
                              inc(m4);
                              pol[n4,m4]:=nr;
                              r4:=0;end;
                                    end;
                end;
          #72 : begin {W GORE}
                  if (akt1=true) and (s1>0) and (r1>0) then begin
                              win:=true;
                              if (pol[n1,m1-1]>=5) and (pol[n1,m1-1]<9) then walka;
                              if pol[n1,m1-1]>9 then miasto;
                              if (m1>0) and (win=true) then begin
                              city;
                              pos(n1,m1);nazwa:=naz1;sila:=s1;clean;
                              m1:=m1-1;
                              pol[n1,m1]:=nr;
                              r1:=0;end;
                                    end;
                  if (akt2=true) and (s2>0) and (r2>0) then begin
                              win:=true;
                              if (pol[n2,m2-1]>=5) and (pol[n2,m2-1]<9) then walka;
                              if pol[n2,m2-1]>9 then miasto;
                              if (m2>0) and (win=true) then begin
                              city;
                              pos(n2,m2);nazwa:=naz2;sila:=s2;clean;
                              m2:=m2-1;
                              pol[n2,m2]:=nr;
                              r2:=0;end;
                                    end;
                  if (akt3=true) and (s3>0) and (r3>0) then begin
                              win:=true;
                              if (pol[n3,m3-1]>=5) and (pol[n3,m3-1]<9) then walka;
                              if pol[n3,m3-1]>9 then miasto;
                              if (m3>0) and (win=true) then begin
                              city;
                              pos(n3,m3);nazwa:=naz3;sila:=s3;clean;
                              m3:=m3-1;
                              pol[n3,m3]:=nr;
                              r3:=0;end;
                                    end;
                  if (akt4=true) and (s4>0) and (r4>0) then begin
                              win:=true;
                              if (pol[n4,m4-1]>=5) and (pol[n4,m4-1]<9) then walka;
                              if pol[n4,m4-1]>9 then miasto;
                              if (m4>0) and (win=true) then begin
                              city;
                              pos(n4,m4);nazwa:=naz4;sila:=s4;clean;
                              m4:=m4-1;
                              pol[n4,m4]:=nr;
                              r4:=0;end;
                                    end;
                end;

          #16 : zakonczenie;
          #27 : begin break;continue;end;
     end;
     ruchy;
     if s1=0 then begin nazwa:=naz1;sila:=s1;clean;end;
     if s2=0 then begin nazwa:=naz2;sila:=s2;clean;end;
     if s3=0 then begin nazwa:=naz3;sila:=s3;clean;end;
     if s4=0 then begin nazwa:=naz4;sila:=s4;clean;end;
     obraz;
    until ruch=#20;
     info;
     akt1:=false;akt2:=false;akt3:=false;akt4:=false;
     if s1>0 then begin pos(n1,m1);nazwa:=naz1;sila:=s1;armia;end;
     if s2>0 then begin pos(n2,m2);nazwa:=naz2;sila:=s2;armia;end;
     if s3>0 then begin pos(n3,m3);nazwa:=naz3;sila:=s3;armia;end;
     if s4>0 then begin pos(n4,m4);nazwa:=naz4;sila:=s4;armia;end;
   End;


{ ALLIED ********************************************************************
 ****************************************************************************
 ***************************************************************************}

  Procedure ALLIED;
   Begin
     kraj:=red;
     ak5:=true;ak6:=false;ak7:=false;ak8:=false;
     akt5:=ak5;akt6:=ak6;akt7:=ak7;akt8:=ak8;
     r5:=1;r6:=1;r7:=1;r8:=1;
     if (s5<=0) and (akt5=true) then begin ak5:=false;ak6:=true;ak7:=false;ak8:=false;
                  pos(n5,m5);nazwa:=naz5;sila:=s5;clean;pol[n5,m5]:=0;end;
     if (s6<=0) and (akt6=true) then begin ak5:=false;ak6:=false;ak7:=true;ak8:=false;
                  pos(n6,m6);nazwa:=naz6;sila:=s6;clean;pol[n6,m6]:=0;end;
     if (s7<=0) and (akt7=true) then begin ak5:=false;ak6:=false;ak7:=false;ak8:=true;
                  pos(n7,m7);nazwa:=naz7;sila:=s7;clean;pol[n7,m7]:=0;end;
     if (s8<=0) and (akt8=true) then begin ak5:=true;ak6:=false;ak7:=false;ak8:=false;
                  pos(n8,m8);nazwa:=naz8;sila:=s8;clean;pol[n8,m8]:=0;end;
     info;ruchy;
    repeat
     if (s5=0) and (s6=0) and (s7=0) and (s8=0) then break;
     akt5:=ak5;akt6:=ak6;akt7:=ak7;akt8:=ak8;
     akt1:=false;akt2:=false;akt3:=false;akt4:=false;
     kraj:=blue;
     if s1>0 then begin akt:=akt1;pos(n1,m1);nazwa:=naz1;sila:=s1;n:=1;armia;end;
     if s2>0 then begin akt:=akt2;pos(n2,m2);nazwa:=naz2;sila:=s2;n:=2;armia;end;
     if s3>0 then begin akt:=akt3;pos(n3,m3);nazwa:=naz3;sila:=s3;n:=3;armia;end;
     if s4>0 then begin akt:=akt4;pos(n4,m4);nazwa:=naz4;sila:=s4;n:=4;armia;end;
     kraj:=red;
     if s5>0 then begin akt:=akt5;pos(n5,m5);nazwa:=naz5;sila:=s5;n:=5;armia;end;
     if s6>0 then begin akt:=akt6;pos(n6,m6);nazwa:=naz6;sila:=s6;n:=6;armia;end;
     if s7>0 then begin akt:=akt7;pos(n7,m7);nazwa:=naz7;sila:=s7;n:=7;armia;end;
     if s8>0 then begin akt:=akt8;pos(n8,m8);nazwa:=naz8;sila:=s8;n:=8;armia;end;
     if (s1=0) and (s2=0) and (s3=0) and (s4=0) then break;
     ruch:=readkey;
     sts(7,0,3);sc(0);ot(xp+530,yp+145,'1');
     sts(7,0,1);ot(xp+503,yp+100,'Bitwa');
                ot(xp+503,yp+100,'Miasto');
     sts(2,0,4);ot(xp+510,yp+130,'Walka trwa');
                ot(xp+510,yp+180,'Walka przegrana.');
                ot(xp+510,yp+180,'Walka wygrana.');
     case ruch of
          #82 : begin
                  if s5=0 then begin
                     if akt5=true then begin ak5:=false;ak6:=true;end;
                     if akt6=true then begin ak6:=false;ak7:=true;end;
                     if akt7=true then begin ak7:=false;ak8:=true;end;
                     if akt8=true then begin ak8:=false;ak6:=true;end;
                               end;
                  if s6=0 then begin
                     if akt5=true then begin ak5:=false;ak7:=true;end;
                     if akt6=true then begin ak6:=false;ak7:=true;end;
                     if akt7=true then begin ak7:=false;ak8:=true;end;
                     if akt8=true then begin ak8:=false;ak5:=true;end;
                               end;
                  if s7=0 then begin
                     if akt5=true then begin ak5:=false;ak6:=true;end;
                     if akt6=true then begin ak6:=false;ak8:=true;end;
                     if akt7=true then begin ak7:=false;ak8:=true;end;
                     if akt8=true then begin ak8:=false;ak5:=true;end;
                               end;
                  if s8=0 then begin
                     if akt5=true then begin ak5:=false;ak6:=true;end;
                     if akt6=true then begin ak6:=false;ak7:=true;end;
                     if akt7=true then begin ak7:=false;ak5:=true;end;
                     if akt8=true then begin ak8:=false;ak5:=true;end;
                               end;
                  if (s5=0) and (s6=0) then begin
                     if akt7=true then begin ak7:=false;ak8:=true;end;
                     if akt8=true then begin ak8:=false;ak7:=true;end;
                                            end;
                  if (s5=0) and (s7=0) then begin
                     if akt6=true then begin ak6:=false;ak8:=true;end;
                     if akt8=true then begin ak8:=false;ak6:=true;end;
                                            end;
                  if (s5=0) and (s8=0) then begin
                     if akt6=true then begin ak6:=false;ak7:=true;end;
                     if akt7=true then begin ak7:=false;ak6:=true;end;
                                            end;
                  if (s6=0) and (s7=0) then begin
                     if akt5=true then begin ak5:=false;ak8:=true;end;
                     if akt8=true then begin ak8:=false;ak5:=true;end;
                                            end;
                  if (s6=0) and (s8=0) then begin
                     if akt5=true then begin ak5:=false;ak7:=true;end;
                     if akt7=true then begin ak7:=false;ak5:=true;end;
                                            end;
                  if (s7=0) and (s8=0) then begin
                     if akt5=true then begin ak5:=false;ak6:=true;end;
                     if akt6=true then begin ak6:=false;ak5:=true;end;
                                            end;
                  if (akt5=true) and (s5>0) then begin ak5:=false;ak6:=true;end;
                  if (akt6=true) and (s6>0) then begin ak6:=false;ak7:=true;end;
                  if (akt7=true) and (s7>0) then begin ak7:=false;ak8:=true;end;
                  if (akt8=true) and (s8>0) then begin ak8:=false;ak5:=true;end;
                  if (s8>0) and (s5=0) and (s6=0) and (s7=0) then
                  begin ak5:=false;ak6:=false;ak7:=false;ak8:=true;end;
                  if (s7>0) and (s5=0) and (s6=0) and (s8=0) then
                  begin ak5:=false;ak6:=false;ak7:=true;ak8:=false;end;
                  if (s6>0) and (s5=0) and (s7=0) and (s8=0) then
                  begin ak5:=false;ak6:=false;ak7:=false;ak8:=true;end;
                  if (s5>0) and (s8=0) and (s6=0) and (s7=0) then
                  begin ak5:=true;ak6:=false;ak7:=false;ak8:=false;end;
                  info;
                end;
          #77 : begin {W PRAWO}
                   if (akt5=true) and (s5>0) and (r5>0) then begin
                              win:=true;
                              if (pol[n5+1,m1]>=1) and (pol[n5+1,m5]<5) then walka;
                              if (n5<10) and (win=true) then begin
                              city;
                              pos(n5,m5);nazwa:=naz5;sila:=s5;clean;
                              inc(n5);
                              pol[n5,m5]:=nr;
                              r5:=0;end;
                                    end;
                  if (akt6=true) and (s6>0) and (r6>0) then begin
                              win:=true;
                              if (pol[n6+1,m6]>=1) and (pol[n6+1,m6]<5) then walka;
                              if (n6<10) and (win=true) then begin
                              city;
                              pos(n6,m6);nazwa:=naz6;sila:=s6;clean;
                              inc(n6);
                              pol[n6,m6]:=nr;
                              r6:=0;end;
                                    end;
                  if (akt7=true) and (s7>0) and (r7>0) then begin
                              win:=true;
                              if (pol[n7+1,m7]>=1) and (pol[n7+1,m7]<5) then walka;
                              if (n7<10) and (win=true) then begin
                              city;
                              pos(n7,m7);nazwa:=naz7;sila:=s7;clean;
                              inc(n7);
                              pol[n7,m7]:=nr;
                              r7:=0;end;
                                    end;
                  if (akt8=true) and (s8>0) and (r8>0) then begin
                              win:=true;
                              if (pol[n8+1,m8]>=1) and (pol[n8+1,m8]<5) then walka;
                              if (n8<10) and (win=true) then begin
                              city;
                              pos(n8,m8);nazwa:=naz8;sila:=s8;clean;
                              inc(n8);
                              pol[n8,m8]:=nr;
                              r8:=0;end;
                                    end;
                       end;
          #75 : begin {W LEWO}
                  if (akt5=true) and (s5>0) and (r5>0) then begin
                              win:=true;
                              if (pol[n5-1,m5]>=1) and (pol[n5-1,m5]<5) then walka;
                              if (n5>1) and (win=true) then begin
                              city;
                              pos(n5,m5);nazwa:=naz5;sila:=s5;clean;
                              n5:=n5-1;
                              pol[n5,n5]:=nr;
                              r5:=0;end;
                                    end;
                  if (akt6=true) and (s6>0) and (r6>0) then begin
                              win:=true;
                              if (pol[n6-1,m6]>=1) and (pol[n6-1,m6]<5) then walka;
                              if (n6>1) and (win=true) then begin
                              city;
                              pos(n6,m6);nazwa:=naz6;sila:=s6;clean;
                              n6:=n6-1;
                              pol[n6,m6]:=nr;
                              r6:=0;end;
                                    end;
                  if (akt7=true) and (s7>0) and (r7>0) then begin
                              win:=true;
                              if (pol[n7-1,m7]>=1) and (pol[n7-1,m7]<5) then walka;
                              if (n7>1) and (win=true) then begin
                              city;
                              pos(n7,m7);nazwa:=naz7;sila:=s7;clean;
                              n7:=n7-1;
                              pol[n7,m7]:=nr;
                              r7:=0;end;
                                    end;
                  if (akt8=true) and (s8>0) and (r8>0) then begin
                              win:=true;
                              if (pol[n8-1,m8]>=1) and (pol[n8-1,m8]<5) then walka;
                              if (n8>1) and (win=true) then begin
                              city;
                              pos(n8,m8);nazwa:=naz8;sila:=s8;clean;
                              n8:=n8-1;
                              pol[n8,m8]:=nr;
                              r8:=0;end;
                                    end;
                end;
          #80 : begin {NA DOL}
                  if (akt5=true) and (s5>0) and (r5>0) then begin
                              win:=true;
                              if (pol[n5,m5+1]>=1) and (pol[n5,m5+1]<5) then walka;
                              if (m5<7) and (win=true) then begin
                              city;
                              pos(n5,m5);nazwa:=naz5;sila:=s5;clean;
                              inc(m5);
                              pol[n5,m5]:=nr;
                              r5:=0;end;
                                    end;
                  if (akt6=true) and (s6>0) and (r6>0) then begin
                              win:=true;
                              if (pol[n6,m6+1]>=1) and (pol[n6,m6+1]<5) then walka;
                              if (m6<7) and (win=true) then begin
                              city;
                              pos(n6,m6);nazwa:=naz6;sila:=s6;clean;
                              inc(m6);
                              pol[n6,m6]:=nr;
                              r6:=0;end;
                                    end;
                  if (akt7=true) and (s7>0) and (r7>0) then begin
                              win:=true;
                              if (pol[n7,m7+1]>=1) and (pol[n7,m7+1]<5) then walka;
                              if (m3<7) and (win=true) then begin
                              city;
                              pos(n7,m7);nazwa:=naz7;sila:=s7;clean;
                              inc(m7);
                              pol[n7,m7]:=nr;
                              r7:=0;end;
                                    end;
                  if (akt8=true) and (s8>0) and (r8>0) then begin
                              win:=true;
                              if (pol[n8,m8+1]>=1) and (pol[n8,m8+1]<5) then walka;
                              if (m8<7) and (win=true) then begin
                              city;
                              pos(n8,m8);nazwa:=naz8;sila:=s8;clean;
                              inc(m8);
                              pol[n8,m8]:=nr;
                              r8:=0;end;
                                    end;
                end;
          #72 : begin {W GORE}
                  if (akt5=true) and (s5>0) and (r5>0) then begin
                              win:=true;
                              if (pol[n5,m5-1]>=1) and (pol[n5,m5-1]<5) then walka;
                              if (m1>0) and (win=true) then begin
                              city;
                              pos(n5,m5);nazwa:=naz5;sila:=s5;clean;
                              m5:=m5-1;
                              pol[n5,m5]:=nr;
                              r5:=0;end;
                                    end;
                  if (akt6=true) and (s6>0) and (r6>0) then begin
                              win:=true;
                              if (pol[n6,m6-1]>=1) and (pol[n6,m6-1]<5) then walka;
                              if (m2>0) and (win=true) then begin
                              city;
                              pos(n6,m6);nazwa:=naz6;sila:=s6;clean;
                              m6:=m6-1;
                              pol[n6,m6]:=nr;
                              r6:=0;end;
                                    end;
                  if (akt7=true) and (s7>0) and (r7>0) then begin
                              win:=true;
                              if (pol[n7,m7-1]>=1) and (pol[n7,m7-1]<5) then walka;
                              if (m7>0) and (win=true) then begin
                              city;
                              pos(n7,m7);nazwa:=naz7;sila:=s7;clean;
                              m7:=m7-1;
                              pol[n7,m7]:=nr;
                              r7:=0;end;
                                    end;
                  if (akt8=true) and (s8>0) and (r8>0) then begin
                              win:=true;
                              if (pol[n8,m8-1]>=1) and (pol[n8,m8-1]<5) then walka;
                              if (m4>0) and (win=true) then begin
                              city;
                              pos(n8,m8);nazwa:=naz8;sila:=s8;clean;
                              m8:=m8-1;
                              pol[n8,m8]:=nr;
                              r8:=0;end;
                                    end;
                end;

          #16 : zakonczenie;
          #27 : begin break;continue;end;
     end;
     ruchy;
     if s5<=0 then begin nazwa:=naz5;sila:=s5;clean;end;
     if s6<=0 then begin nazwa:=naz6;sila:=s6;clean;end;
     if s7<=0 then begin nazwa:=naz7;sila:=s7;clean;end;
     if s8<=0 then begin nazwa:=naz8;sila:=s8;clean;end;
     obraz;
    until ruch=#20;
     akt5:=false;akt6:=false;akt7:=false;akt8:=false;
     info;
     if s5>0 then begin pos(n5,m5);nazwa:=naz5;sila:=s5;armia;end;
     if s6>0 then begin pos(n6,m6);nazwa:=naz6;sila:=s6;armia;end;
     if s7>0 then begin pos(n7,m7);nazwa:=naz7;sila:=s7;armia;end;
     if s8>0 then begin pos(n8,m8);nazwa:=naz8;sila:=s8;armia;end;
   End;
{****************************************************************************
 ****************************************************************************}

     Begin
       setgraphmode(vgahi);
     repeat
       cleardevice;
       sls(0,0,3);
       sc(10);rt(160,40,480,400);
              l(160,120,480,120);
       sc(15);sts(7,0,3);
       ot(265,50,'MINIGRA');
       sts(7,0,1);ot(195,80,'Kampania wrzesniowa ''39');
       sts(2,0,4);
       ot(190,130,'Jest to, jak sama nazwa wskazuje MINIGRA, wiec');
       ot(180,142,'nie nalezy sie po niej spodziewac nic wielkiego.');
       ot(180,154,'Gre ta mozna zaliczyc do typu gier strategicznych');
       ot(180,166,'i prezentuje ona oczywiscie kampanie wrzesniowa.');
       ot(190,178,'Strona niemiecka dysponuje czterema armiami, 1');
       ot(180,190,'pancerna i 3 piechoty. Podobnie jest ze strona');
       ot(180,202,'polska. Jednak sily armi polskich sa o wiele mnie-');
       ot(180,214,'jsze. Strony radzieckiej nie uwzgledniono.');
       ot(190,234,'Celem strony niemieckiej jest zdobycie wszyst-');
       ot(180,246,'kich miast przed koncem 30 wrzesnia.');
       ot(180,258,'Natomiast strony polskiej : obronienie chociaz');
       ot(180,270,'jednego miasta przed koncem 30 wrzesnia lub zni-');
       ot(180,282,'szczenie wszystkich armii niemieckich.');
       ot(190,302,'Z przyczyn czasowo-technicznych dostepna jest');
       ot(180,314,'tylko wersja dla 2 graczy. Z tego samego powodu');
       ot(180,326,'w trybie graficznym nie ma polskich liter.');
       ot(190,362,'ESC - powrot do menu');
       ot(190,374,'ALT+Q - wyjscie z programu');
       ot(190,350,'ENTER - dalej');
       dalej:=readkey;
       if dalej=#0 then begin dalej:=readkey;if dalej=#16 then zakonczenie;end;
       if dalej=#27 then break;
       cleardevice;
       sc(10);rt(160,40,480,400);
       l(160,220,480,220);sc(15);tc(15);
       ot(180,80,'PODAJ IMIE I-WSZEGO GRACZA (NIEMCY)');ot(195,145,'>');
       gotoxy(27,10);readln(imie1);
       ot(180,260,'PODAJ IMIE II-GIEGO GRACZA (POLSKA)');ot(195,320,'>');
       gotoxy(27,21);readln(imie2);
       cleardevice;
      xp:=30;yp:=49;
      sts(0,0,1);sc(15);
      ot(5,2,'MiniGra - Wrzesien 1939 (programowanie:P.Sobstel,pomysl:A.Jasinski & P.Sobstel)');
      sts(2,0,4);ot(xp+504,yp+230,'ESC - powrot do');
                 ot(xp+503,yp+240,'     wstepn.info  ');
                 ot(xp+503,yp+255,'ALT+Q - wyjscie');
                 ot(xp+503,yp+265,'     z programu');
                 ot(xp+503,yp+280,'INS - zmiana akty-');
                 ot(xp+503,yp+290,'     wnej armii');
                 ot(xp+503,yp+305,'Strzalki - ruch');
                 ot(xp+503,yp+320,'ALT+T - koniec');
                 ot(xp+503,yp+330,'     tury');
                 ot(xp+503,yp+345,'Atak odbywa sie');
                 ot(xp+503,yp+355,'poprzez ruch w ta');
                 ot(xp+503,yp+365,'strone,gdzie znaj-');
                 ot(xp+503,yp+375,'duje sie wroga');
                 ot(xp+503,yp+385,'armia (ew.miasto).');
       sc(10);sts(7,0,1);ot(xp+503,yp+203,'Klawisze :');
                 ot(xp+503,yp+3,'Info :');
       sc(15);sts(0,0,1);
       {liczby 0-7 pisane w pionie}
        dod:=-1;ktora:=2;
       repeat
        inc(dod);
        inc(ktora,50);
        yl:=(yp-30)+ktora;
        str(dod,dods);
        ot(xp-18,yl,dods);
       until dod=7;
       {litery A-J pisane w poziomie)}
       ot(xp+24,yp-19,'A');ot(xp+74,yp-19,'B');
       ot(xp+124,yp-19,'C');ot(xp+174,yp-19,'D');
       ot(xp+224,yp-19,'E');ot(xp+274,yp-19,'F');
       ot(xp+324,yp-19,'G');ot(xp+374,yp-19,'H');
       ot(xp+424,yp-19,'I');ot(xp+474,yp-19,'J');
      sc(lightgreen);sls(0,0,3);
      rt(xp,yp,xp+500,yp+400);
      sls(0,0,3);
      sc(green);
      rt(xp-29,yp,638,yp+400);
      rt(xp,yp-30,xp+500,yp+430);
      l(xp+500,yp+200,640,yp+200);
      tlo(xp+3,yp+3,10,green);
        sls(1,0,1);ktora:=0;
       {linie przerywane pionowe}
       repeat
        inc(ktora,50);
        l(xp+ktora,yp,xp+ktora,yp+400);
       until ktora=450;
       {linie przerywane poziome}
        ktora:=0;
       repeat
        inc(ktora,50);
        l(xp,yp+ktora,xp+500,yp+ktora);
       until ktora=350;
       gd:=1;wa:=4;kr:=2;mo:=3;po:=1;lo:=1;wi:=1;lw:=3;
       kcity:=red;
       sc(lightred);sls(0,0,1);sts(2,0,4);
       for ktora:=0 to 7 do for dod:=1 to 10 do pol[dod,ktora]:=0;
       obraz;
       ktora:=0;dod:=0;
       akt:=false;
       kraj:=red;
       naz1:='19KP';naz2:='8Arm';naz3:='4Arm';naz4:='1Arm';
       naz5:='Mdln';naz6:='Lodz';naz7:='Pozn';naz8:='Narw';
       s5:=4;s6:=2;s7:=2;s8:=1;
       v:=6;b:=4;nazwa:=naz5;sila:=s5;armia;pol[v,b]:=5;
       v:=4;b:=4;nazwa:=naz6;sila:=s6;armia;pol[v,b]:=6;
       v:=2;b:=3;nazwa:=naz7;sila:=s7;armia;pol[v,b]:=7;
       v:=7;b:=2;nazwa:=naz8;sila:=s8;armia;pol[v,b]:=8;
       n1:=1;m1:=5;n2:=1;m2:=6;n3:=1;m3:=1;n4:=4;m4:=1;
       n5:=6;m5:=4;n6:=4;m6:=4;n7:=2;m7:=3;n8:=7;m8:=2;
       s1:=9;s2:=5;s3:=6;s4:=4;
       wawa:=false;krow:=false;wina:=false;poan:=false;lodz:=false;lwow:=false;moin:=false;
       pol[5,3]:=10; {Warszawa} pol[4,6]:=20; {Krakow} pol[4,3]:=30; {Modlin}
       pol[1,3]:=40; {Poznan} pol[3,4]:=50; {Lodz}
       pol[6,2]:=60; {Wizna} pol[7,6]:=70; {Lwow}
       z1:=false;z2:=false;z3:=false;z4:=false;z5:=false;z6:=false;z7:=false;z8:=false;
       dzien:=0;
     repeat
       sc(black);sts(7,0,1);
       ot(225,451,dzien2+' wrzesien');
       inc(dzien);sc(15);
       str(dzien,dzien2);
       ot(225,451,dzien2+' wrzesien');
      AXIS;
       if (wa=0) and (kr=0) and (mo=0) and (po=0) and (lo=0) and (wi=0) and (lw=0) then break;
       if (s1=0) and (s2=0) and (s3=0) and (s4=0) then break;
       if ruch=#27 then break;
      ALLIED;
       if (s1=0) and (s2=0) and (s3=0) and (s4=0) then break;
     until (ruch=#27) or (dzien=30);
     if ruch=#27 then continue;
     cleardevice;
     sls(0,0,3);sc(10);rt(160,40,480,400);sc(15);
     sts(7,0,2);
      if dzien=30 then begin
                ot(170,65,'Wojna w Polsce skonczona!');
                ot(170,110,'Zachodnia granice Niemiec');
                ot(170,135,'przekroczyla Francja i dla-');
                ot(170,160,'tego Hitler zostal zmuszony');
                ot(170,185,'do wycofania wszystkich ');
                ot(170,210,'wojsk z frontu wsch., aby');
                ot(170,235,'wzmocnic slabiutki front');
                ot(170,260,'zachodni.');
                ot(170,285,'Polska jest znowu wolna.');
                ot(170,320,'Gratuluje Ci');
                ot(250,350,+imie2+'.');end;
     if ((s1=0) and (s2=0) and (s3=0) and (s4=0)) then begin
                ot(170,65,'Wojna w Polsce skonczona!');
                ot(170,110,'Gratuluje Ci');
                ot(250,135,+imie2+'.');
                ot(170,170,'Dokonales rzeczy niemoz-');
                ot(170,185,'liwej. Udowodniles, ze ');
                ot(170,210,'Polska jakkolwiek bylaby');
                ot(170,235,'slaba i bezbronna to moze');
                ot(170,260,'sie zjednoczyc i w walce');
                ot(170,285,'o wolnosc ojczyzny poko-');
                ot(170,320,'nac nawet najsilniejszego');
                ot(250,350,'wroga');end;
      if (wa=0) and (kr=0) and (mo=0) and (po=0) and (lo=0) and (wi=0) and (lw=0) then begin
                ot(170,65,'Polsce zostala pokonana!');
                ot(170,110,'Niestety Polska nie wytrzy-');
                ot(170,135,'mala naporu wojsk niemiec-');
                ot(170,160,'kich i nie zdolala obronic');
                ot(170,185,'ani jednego miasta. ');
                ot(170,215,'Gratuluje Ci');
                ot(250,245,+imie1+'.');
                ot(170,260,'Twoje umiejetnosci stra-');
                ot(170,285,'tegiczne sa godne uznania.');
                ot(170,320,'A ty, '+imie2+' .....');
                ot(250,350,'No coz, przykro mi.');end;
     czekaj:=readkey;
     cleardevice;
     ot(165,48,'Od : ');
     ot(300,120,'Do :');
     sts(2,0,5);
     ot(175,60,'Adolf Hitler');ot(175,75,'Fasism Strasse 1');ot(175,90,'Berlin (Deutschland)');
     ot(310,132,'Gen.'+imie1);ot(310,147,'Pole bitwy');
     if ((s1=0) and (s2=0) and (s3=0) and (s4=0)) or ((dzien=30)) then
     begin
     sts(2,0,4);
     ot(385,45,'Berlin '+dzien2+'.09.1939');
     sts(2,0,4);
     ot(190,187,'Jestem zawiedziony wynikiem kampani wrzesniowej,');
     ot(180,200,'a tym samym wielce niezadowolony z dowodztwa,czyli');
     ot(180,213,'z panskiej postawy. Tym samym zaczynam watpic w');
     ot(180,226,'panskie umiejetnosci, dlatego jestem zmuszony ode-');
     ot(180,239,'brac panu tytul generala i zdegradowac do stopnia');
     ot(180,252,'szeregowca. Ponadto powstaly niejasnosci co do ');
     ot(180,264,'panskiego czystego pochodzenia niemieckiego. Dla-');
     ot(180,276,'tego tez zostaje panu odebrane obywatelstwo nie-');
     ot(180,288,'mieckie jako osobnikowi zagrazajacemu czystosci');
     ot(180,300,'naszej nadludzkiej rasy. Tym samym staje sie pan');
     ot(180,312,'od tej chwili naszym wrogiem i dlatego tez zos-');
     ot(180,324,'taje pan skazany na smierc przed plutonem egeku-');
     ot(180,336,'cyjnym jako szpieg, ktory bedac naszym wrogiem');
     ot(180,348,'smial dowodzic armia niemiecka.');
     sts(5,0,1);ot(370,360,'Adolf Hitler');
     end;
     if (wa=0) and (kr=0) and (mo=0) and (po=0) and (lo=0) and (wi=0) and (lw=0) then
     begin
     sts(2,0,4);
     ot(385,45,'Berlin '+dzien2+'.09.1939');
     sts(2,0,4);
     ot(190,187,'Jestem zadowolony wynikiem kampani wrzesniowej,');
     ot(180,200,'a tym usatysfakcjonowany panskimi umiejetnosciami.');
     ot(180,213,'Dlatego otrzymuje pan specjalne odznaczenie z rak');
     ot(180,226,'moich w dowod uznania panskiego geniuszu wzoruja-');
     ot(180,239,'cegogo sie na moim. Jednak sam pan wie, ze nie do-');
     ot(180,252,'rownuje mi pan w zadnym wzgledzie dlatego musi pan ');
     ot(180,264,'duzo cwiczyc, aby osiagnac ten najlepszy dla pana');
     ot(180,276,'poziom (chociaz ten bedzie i tak dla mnie zawsze');
     ot(180,288,'slaby). Ale nie ma sie czym martwic, mojemu geniu-');
     ot(180,300,'szu nikt nigdy nie dorownal i nigdy nie dorowna,');
     ot(180,312,'ale zawsze musi byc ten drugi za mna i mama szcze-');
     ot(180,324,'re nadzieje, ze pan nim bedzie. ');
     ot(180,340,'                            Z powazaniem');
     sts(5,0,1);ot(370,348,'Adolf Hitler');
     end;
     cleardevice;
     sc(10);rt(160,40,480,400);
     sts(7,0,3);sc(15);ot(200,200,'Jeszcze raz (T/N) ?');
     kontynuowac:=readkey;
    until (kontynuowac='N') or (kontynuowac='n');
      restorecrtmode;
      tc(10);tb(0);wypel(1,2,80,24,177);
      tc(15);tb(3);gw(8,1,'Do wyboru');
      tb(0);ramka(8,2,24,6);
      gw(75,1,'Zabawa');
    End;
{****************************************************************************}


{****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************
 ****************************************************************************}

  procedure WYBRANE;
  begin
    if g1=3 then Test;
    if g2=3 then Wrzesien39;
    if g3=3 then MiniGra;
    tc(15);tb(0);gw(3,1,'[*]');       {zmiana koloru tla napisu na czarny}
    tb(0);tc(15);ramka(8,2,24,6);
  end;

  procedure DoWyboru;
     begin
       tc(10);tb(0);wypel(3,2,24,5,177); {zmazanie menu rozw. opcji [*]}
       tc(15);tb(0);gw(3,1,'[*]');       {zmiana koloru tla napisu na czarny}
       tb(3);gw(8,1,'Do wyboru');        {kolor nr.3 tla napisu}
       tb(0);tc(15);ramka(8,2,24,6);     {rysow. ramki (menu rozw.) Do Wyboru}
       h1:=3;h2:=0;h3:=0;
  repeat
    g1:=h1;g2:=h2;g3:=h3;
   {napisy w ramce DoWyboru - podswietlane ruchoma "belka"}
    tc(15);
    tb(g1);gw(9,3,' 1.Test        ');
    tb(g2);gw(9,4,' 2.Wrzesie‰''39 ');
    tb(g3);gw(9,5,' 3.MiniGra     ');
    r.ax:=3;go; {sprawdzenie polozenia i stanu przyciskow myszy}
    if (r.bx=1) and (r.dx<9) and (r.cx>15) and (r.cx<33) then break;
    if (r.cx>55) and (r.cx<185) then begin
       if r.dx=16 then begin h1:=3;h2:=0;h3:=0;end;
       if r.dx=24 then begin h1:=0;h2:=3;h3:=0;end;
       if r.dx=32 then begin h1:=0;h2:=0;h3:=3;end;
    if r.bx=1 then if r.dx>9 then wybrane;
                                     end;
    if keypressed then begin nacklw:=readkey;
    case nacklw of
{GORA}   #72 : begin
                 if g2=3 then begin h1:=3;h2:=0;end;
                 if g3=3 then begin h2:=3;h3:=0;end;
                 pgre;
               end;
{DOL}    #80 : begin
                 if g1=3 then begin h1:=0;h2:=3;end;
                 if g2=3 then begin h2:=0;h3:=3;end;
                 pgre;
               end;
{ENTER}  #13 : wybrane;
{PRAWO}  #77 : wybrane;
{LEWO}   #75 : break;
{ALT+F1} #104 : begin g1:=3;wybrane;end;
{ALT+F2} #105 : begin g2:=3;wybrane;end;
{ALT+F3} #106 : begin g3:=3;wybrane;end;
{ALT+Q}  #16 : zakonczenie;
{ESC}    #27 : powrotdomenu:=true;
     end;              end;
  until nacklw=#27;
  end;

   begin
     restorecrtmode;
     window(1,1,80,25);
     r.cx:=1;r.dx:=1;r.ax:=4;go; {ustalenie polozenia kursora myszy}
     r.ax:=1;go; {pokazanie kursora myszy}
     tc(10);wypel(1,2,80,24,177); {tlo}
     v1:=3;v2:=0; {Powrot do menu - ma byc podswietlone}
     tc(15);tb(3);gw(3,1,'[*]');
     tb(0);gw(8,1,'Do wyboru');
     gw(75,1,'Zabawa');
     tb(0);tc(15);ramka(3,2,24,5); {ramka [*]}
     powrotdomenu:=false;
      repeat
       if powrotdomenu=true then break;
       tb(v1);gw(4,3,' Powr¢t do menu     ');
       tb(v2);gw(4,4,' Wyjòcie z programu ');
       r.ax:=3;go;
        if (r.cx>15) and (r.cx<185) then begin
           if (r.dx>8) and (r.dx<17) then begin v1:=3;v2:=0; {Powrot do menu}
              if r.bx=1 then break;       end;
           if (r.dx>16) and (r.dx<25) then begin v1:=0;v2:=3;  { Wyjscie  z }
              if r.bx=1 then zakonczenie;  end;                {  programu  }
                                         end;
        if (r.cx>55) and (r.cx<121) and (r.dx<9) and (r.bx=1)
        {gdy nacisniecie kursora myszki na napisie Do Wyboru to rozwiniecie menu}
        then begin dowyboru;
                   tc(15);tb(3);gw(3,1,'[*]');    {po ukonczeniu...}
                   tb(0);gw(8,1,'Do wyboru');     {...procedury... }
                   tc(10);wypel(8,2,24,8,177);    {...DOWYBORU wyczy-}
                   tb(0);tc(15);ramka(3,2,24,5);  {szczenie pola}
              end;
       if keypressed then begin na:=readkey;
       case na of
            #80 : begin v1:=0;v2:=3;pgre;end;
            #72 : begin v1:=3;v2:=0;pgre;end;
            #16 : zakonczenie;
            #77 : begin dowyboru;
                        tc(15);tb(3);gw(3,1,'[*]');    {po ukonczeniu...}
                        tb(0);gw(8,1,'Do wyboru');     {...procedury... }
                        tc(10);wypel(8,2,24,8,177);    {...DOWYBORU wyczy-}
                        tb(0);tc(15);ramka(3,2,24,5);  {szczenie pola}
                   end;
            #13 : begin
                   if v1=3 then break; { Powrot do menu glownego}
                   if v2=3 then zakonczenie; {Wyjscie z programu}
                  end;
            #27 : break;
       end;               end;
       until na=#27;
       setgraphmode(vgahi);
       NapisySztywne;
   end;

{****************************************************************************
 ********************************* POMOC ************************************
 ****************************************************************************}
  procedure Pomoc;
   begin
     restorecrtmode; {przejscie w tryb tekstowy}
     tc(15);gw(11,1,'Pomoc uæytkownika programu Kampania Wrzeòniowa - wersja 1.00');
     gw(2,25,+#24+','+#25+',PgUp,PgDn - przewijanie tekstu   ESC - powr¢t   ALT+Q - wyjòcie z programu');
     tc(10);
     wypel(1,2,80,24,177);
     dramka(3,4,78,22);  {ramka, w ktorej wyswietlany jest tekst pomocy}
     tc(0);wypel(4,5,77,21,32);
     xx11:=6;xx22:=75;yy11:=5;yy22:=21;
     window(xx11,yy11,xx22,yy22);tc(15);
     przewtext('pomoc.txt',163,16); {wyòwietlenie tekstu pliku pomocy}
     window(1,1,80,25);
     setgraphmode(vgahi);
     NapisySztywne;
   end;
{****************************************************************************}
{****************************************************************************}
{****************************************************************************}

{reakcja na nacisniecie ktoregos z klawiszy klawiatury}
  procedure NacKlawisza;
   begin
     nackl:=readkey;
     case nackl of
     {zmiana podswietlenia i wypisanie objasnienia}
     #72 : begin {gora, zostaje podswietlona opcja znajd.sie wyzej}
             if k1=15 then begin kl1:=10;kl4:=15;end;
             if k2=15 then begin kl1:=15;kl2:=10;end;
             if k3=15 then begin kl2:=15;kl3:=10;end;
             if k4=15 then begin kl3:=15;kl4:=10;end;
           end;
     #80 : begin {dol, zostaje podswietlona opcja znajd.sie nizej}
             if k1=15 then begin kl1:=10;kl2:=15;end;
             if k2=15 then begin kl2:=10;kl3:=15;end;
             if k3=15 then begin kl3:=10;kl4:=15;end;
             if k4=15 then begin kl1:=15;kl4:=10;end;
           end;
     #13 : begin {gdy nacisniecie entera to wykonac odpowiednia procedure}
             if k1=15 then Fakty;
             if k2=15 then Zabawa;
             if k3=15 then Pomoc;
           end;
     #25 : pomoc; {ALT+P}
     #44 : zabawa; {ALT+Z}
     #33 : fakty; {ALT+F}
     end;
   end;

{glowna czesc procedury MENU}
 BEGIN
   kl1:=15;kl2:=10;kl3:=10;kl4:=10; {ustalenie kolorow napisow menu KLx}
   NapisySztywne; {wyswietlenie napisow "niepodswietlanych"}
   repeat
    k1:=kl1;k2:=kl2;k3:=kl3;k4:=kl4; {ustalenie kolorow naspisow Kx}
    r.ax:=3;go;
    r1.cx:=r.cx;r1.dx:=r.dx; {odczytanie wspolrzednych poloz. myszki}
    sts(7,0,4);
    sc(k1);                 {ustalenie koloru napisu I-wszego}
    ot(200,170,'Fakty');    {jesli k1=10 to fakty sa podswietlone (k.zielony)}
    sc(k2);                 {jesli k1=15 to fakty nie sa podwietl.(k.bialy)}
    ot(280,230,'Zabawa');   {analogicznie jest z reszta}
    sc(k3);
    ot(200,290,'Pomoc');
    sc(k4);
    ot(280,350,'Wyjscie');ot(349,346,'''');
    sts(7,0,2);sc(10);
    if keypressed then NacKlawisza; {jesli nacisniecia klawisza to wykonac procedure NacKlawisza}
    r.ax:=3;go; {odczytanie stanu przyciskow i polozenia myszy}
    if (r1.cx<>r.cx) or (r1.dx<>r.dx) then begin {sprawdzenie czy nastapil ruch myszki}
    if r.dx<230 then begin kl1:=15;kl2:=10;kl3:=10;kl4:=10;end;
    if (r.dx>=230) and (r.dx<280) then begin kl1:=10;kl2:=15;kl3:=10;kl4:=10;end;
    if (r.dx>=280) and (r.dx<330) then begin kl1:=10;kl2:=10;kl3:=15;kl4:=10;end;
    if (r.dx>=330) then begin kl1:=10;kl2:=10;kl3:=10;kl4:=15;end;
                                           end;
    if (r.bx=1) then begin {jesli nastapilo nacisniecie lewgo przycisku myszy}
       {wykonuje odpowiednia procedure w zaleznosci od polozenia}
                       if r.dx<230 then Fakty;
                       if (r.dx>=230) and (r.dx<280) then Zabawa;
                       if (r.dx>=280) and (r.dx<330) then Pomoc;
                       if (r.dx>=330) then break;
                     end;
   until ((k4=15) and (nackl=#13)) or (nackl=#16) {alt+Q} or (nackl=#27) {ESC};
   {zakonczenie, gdy jest podswietlona opcja WYJSCIE i zostanie nacisniety
    ENTER lub prawy przycisk myszki, albo oprocz tego ALT+Q lub ESC}
   zakonczenie;
  end;

{****************************************************************************
 *********************** CZESC GLOWNA PROGRAMU ******************************
 ****************************************************************************}

BEGIN
  tb(0);clrscr; {ustalenie koloru tla na czarny i wyczyszczenie ekranu}
    iloscpytan:=45; {ogolna ilosc pytan testowych}
    {dlugosci plikow tekstowych (*.TXT) w katalogu FAKTY}
    dp1:=84;  {wybuch}
    dp2:=56;  {granica}
    dp3:=79;  {wybrzeze}
    dp4:=45;  {nowarmie}
    dp5:=63;  {bzura}
    dp6:=165; {czerwona}
    dp7:=38;  {tomaszow}
    dp8:=50;  {lwow}
    dp9:=124;   {warszawa}
    dp10:=16; {modlin}
    dp11:=47; {ostatnie}
    dp12:=65;  {bilans}
  init(vga,vgahi,'tools'); {inicjalizacja trybu graficznego}
  r.ax:=0;go;  {inicjalizacja myszki}
  if r.ax=0 then begin  {sprawdzenie obecnosci myszki}
     cleardevice;ot(1,10,'Mysz nie jest zainstalowana. Kontynuowac (t/n) ?');
     kontynuowac:=readkey;
     if (kontynuowac<>'t') and (kontynuowac<>'T') then zakonczenie;
                 end;
  MENU {!!!!}
END.