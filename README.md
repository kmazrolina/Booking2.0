# Booking2.0

## Database Diagram

### dbdiagram.io

- [Link to diagram](https://dbdiagram.io/d/63a201e199cb1f3b55a296f4) (view only)
- [Source file](./diagram-src.txt)

***TO DO:***

~~8poprawnie zaprojektowanych tabel (na osob�), przy czym w bazie danych powinno by� minimum 10 tabel,~~

 - dane dotyczące atrybutów, których wartość zmienia się w czasie,

 - tabele realizujące jeden ze schematów dziedziczenia,
 
 - 10 widoków lub funkcji
Widoki:
1. Domki w danym mieście 
2. Domek wraz z informacjami (rating, rating gospodarza, udogodnienia, atrakcje w pobliżu, odległość od centrum)
3.
4.
5.
6.
Funkcje:
1. 
...

- baza odpowiednio oprogramowana z wykorzystaniem procedur składowanych i wyzwalaczy (co najmniej po 5 procedur i po 5 wyzwalaczy)
Wyzwalacze:
1.
2.
3.
4.
5.
Procedury składowane:
1. Domki w danym miescie posortowane po: cenie, odleglosci od centurm, ratingu, ilosci atrakcji w pobliżu 
2. Domki w danym miescie ponizej danej ceny
3. Domki w odleglosci X ode mnie
4. Domki w odleglosci nie mniejszej niz X od centrum
5. Domki o ratingu nie mniejszym niz X
6. Domki o ratingu właściciela nie mniejszym niz X
7. Domki z udogodnieniem X
8. Dodawanie recenzji domku, gospodarza, gościa
9. Dodawanie pytania do gospodarza
10. Dodawanie odpowiedzi do pytania
11. Dokonanie rezerwacji domku
12. Opłacenie rezerwacji

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
