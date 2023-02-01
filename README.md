# Booking2.0

## Database diagram

### dbdiagram.io

- [Link to diagram](https://dbdiagram.io/d/63d96b3b296d97641d7d76f9) (view only)
- [Source file](./docs/diagram_src.txt)

## Docker + VSCode setup

Setup with SQL server as docker container and VSCode as GUI.

1. Requirements: Docker, VSCode with [SQL Server](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql) extension.
1. Go to `docker/` directory and execute `sh start.sh` command.
1. Wait for mssql to setup.
1. Connect via extension using below values:
   - hostname: `localhost`
   - database: `booking2`
   - authentication type: `SQL Login`
   - username: `sa`
   - password: `zaq1@WSX`

## Countries and cities map

Countries and cities polygons with complete explanation and guide for adding new ones can be found in [docs/wtk.md](./docs/wkt.md).

In order to recreate map in database following programs were used (more on that in above mentioned file):

- [OpenStreetMap](https://www.openstreetmap.org/)
- [Polygons.OpenStreetMap](https://polygons.openstreetmap.fr/)

## TO DO

- ~~!!Sprawdzić czy rezerwacje są poprawne (czy nie ma zbyt dużo rezerwacji na jeden obiekt w danych datach) !!~~
- ~~8poprawnie zaprojektowanych tabel (na osobę), przy czym w bazie danych powinno być minimum 10 tabel,~~
- dane dotyczące atrybutów, których wartość zmienia się w czasie,
  Ceny domków
- ~~- tabele realizujące jeden ze schematów dziedziczenia,~~
- 10 widoków lub funkcji

### Widoki

1. Domki w danym mieście
2. Domki w danym miescie posortowane po: cenie, odległości od centurm, ratingu, ilosci atrakcji w pobliżu
3. Domki w danym mieście przy zdanych datach
4. Domki w danym miescie przy zdanych datach poniżej danej ceny
5. Domki w danym mieście przy zdanych datach w odległości X ode mnie
6. Domki w danym mieście przy zdanych datach w odległości nie mniejszej niz X od centrum
7. Domki w danym mieście przy zdanych datach o ratingu nie mniejszym niz X
8. Domki w danym mieście przy zdanych datach o ratingu właściciela nie mniejszym niz X
9. Domki w danym mieście przy zdanych datach z udogodnieniem X

~~10. Domki z ich pokojami~~

11.~~Informacja o gosciach~~ 

12. ~~Informacja o rezerwacjach z rodzajem obiektu~~

13. ~~QA view~~

### Funkcje

~~1. Obliczanie ratingu~~

Karolina 2. Obliczanie wskaźnika atrakcyjności domku

3. ~~Obliczanie ilości wolnych domków w danym dniu~~
4. ~~Obliczanie średniej długości pobytu~~
5. ~~Sprawdzenie, czy dany domek jest dostępny w danych datach.~~

- baza odpowiednio oprogramowana z wykorzystaniem procedur składowanych i wyzwalaczy (co najmniej po 5 procedur i po 5 wyzwalaczy)

### Wyzwalacze:

Karolina 1. Aktualizacja odpowiednich widoków przy dodaniu ratingu.

wiki 2. Aktualizacja ratingu domku / gospodarza / użytkownika przy dodaniu nowej recenzji

~~3. Sprawdzenie, czy dany obiekt jest wolny w podanych datach przy próbie rezerwacji~~

~~4. Sprawdzenie, czy dany obiekt jest wolny w podanych datach przy próbie zmiany dat rezerwacji~~

### Procedury składowane

~~1. Dodawanie: recenzji domku,~~
profilu gospodarza, profilu gościa

~~2. Dodawanie pytania do gospodarza~~

~~3. Dodawanie odpowiedzi do pytania~~

~~4. Dokonanie rezerwacji domku~~

5. Opłacenie rezerwacji

~~6. Anulowanie rezerwacji~~

~~7. Zmiana daty rezerwacji~~

~~8. Zmiana ceny noclegu w danym domku~~

- strategia pielęgnacji bazy danych (kopie zapasowe)
- można utworzyć dwa programy klienckie jeden umożliwiający pracę administratorów (użytkowników ze zwiększonymi uprawnieniami), drugi umożliwiający prac zwykłych użytkowników.

### Plik z opisem

- podstawowe założenia projektu (cel, główne założenia, możliwości, ograniczenia przyj�te przy projektowaniu),
- diagram ER,
- schemat bazy danych (diagram relacji),
- dodatkowe wi�zy integralności danych (nie zapisane w schemacie),
- utworzone indeksy,
- opis stworzonych widok�w,
- opis procedur składowanych,
- opis wyzwalaczy,
- skrypt tworzący bazę danych,
- typowe zapytania.
