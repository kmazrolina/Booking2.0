# Booking2.0

## Database Diagram

### dbdiagram.io

- [Link to diagram](https://dbdiagram.io/d/63d2c531296d97641d7c61c4) (view only)
- [Source file](./diagram-src.txt)

***TO DO:***

~~8poprawnie zaprojektowanych tabel (na osob�), przy czym w bazie danych powinno by� minimum 10 tabel,~~

 - dane dotyczące atrybutów, których wartość zmienia się w czasie,
 Ceny domków

 - tabele realizujące jeden ze schematów dziedziczenia,
 
 - 10 widoków lub funkcji
Widoki:
1. Domki w danym mieście 
2. Domek wraz z informacjami (rating, rating gospodarza, udogodnienia, atrakcje w pobliżu, odległość od centrum)
3. Najwyz
4. przyszle/trwajace rezerwacje ownera od najblizszej 
5.
6.
Funkcje:
1. Obliczanie ratingu
2. Obliczanie wskaźnika atrakcyjności domku
3. Ile wolnych domkow w danym dniu ?
4. Wyliczanie ceny (cena od ownera + prowizja apikacji + podatek)*ilosc dni
...

- baza odpowiednio oprogramowana z wykorzystaniem procedur składowanych i wyzwalaczy (co najmniej po 5 procedur i po 5 wyzwalaczy)
Wyzwalacze:
1. Przy anulowaniu / zmianie dat rezerwacji zwolnienie dat "w kalendarzu"
2. [After update] wiadomosc dla wynajmujacego o tym ze zaakceptowano wynajem
3. before insert, przed dodaniem konta o tym samym mailu
4.
5.
Procedury składowane:
1. Domki w danym miescie posortowane po: cenie, odleglosci od centurm, ratingu, ilosci atrakcji w pobliżu 
2. Domki w danym mieście przy zdanych datach
3. Domki w danym miescie przy zdanych datach ponizej danej ceny
4. Domki w danym mieście przy zdanych datach w odleglosci X ode mnie
5. Domki w danym mieście przy zdanych datach w odleglosci nie mniejszej niz X od centrum
6. Domki w danym mieście przy zdanych datach o ratingu nie mniejszym niz X
7. Domki w danym mieście przy zdanych datach o ratingu właściciela nie mniejszym niz X
8. Domki w danym mieście przy zdanych datach z udogodnieniem X
9. Dodawanie recenzji domku, gospodarza, gościa
10. Dodawanie pytania do gospodarza
11. Dodawanie odpowiedzi do pytania
12. Dokonanie rezerwacji domku
13. Opłacenie rezerwacji
14. Anulowanie rezerwacji
15. Zmiana daty rezerwacji

- strategia pielęgnacji bazy danych (kopie zapasowe)

- można utworzyć dwa programy klienckie � jeden umo�liwiaj�cy prac� �administrator�w� (u�ytkownik�w ze zwi�kszonymi uprawnieniami), drugi umo�liwiaj�cy prac� zwyk�ych u�ytkownik�w.

Plik z opisem:
- podstawowe za�o�enia projektu (cel, g��wne za�o�enia, mo�liwo�ci, ograniczenia przyj�te przy projektowaniu),
- diagram ER,
- schemat bazy danych (diagram relacji),
- dodatkowe wi�zy integralno�ci danych (nie zapisane w schemacie),
- utworzone indeksy,
- opis stworzonych widok�w,
- opis procedur sk�adowanych,
- opis wyzwalaczy,
- skrypt tworz�cy baz� danych,
- typowe zapytania.
