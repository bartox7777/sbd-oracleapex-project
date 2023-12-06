INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123456, 'Jan', 'Kowalski', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123457, 'Adam', 'Nowak', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123458, 'Anna', 'Kowalska', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123459, 'Katarzyna', 'Nowak', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123460, 'Piotr', 'Kowalski', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123461, 'Jan', 'Nowak', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123462, 'Adam', 'Kowalski', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123463, 'Anna', 'Nowak', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123464, 'Katarzyna', 'Kowalska', 1, 1 );
INSERT INTO studenci ( nr_indeksu, imie, nazwisko, obecny_semestr, stopien_studiow ) VALUES ( 123465, 'Piotr', 'Nowak', 1, 1 );


INSERT INTO wydzialy (id, nazwa) VALUES (1, 'Automatyki, Robotyki i Elektrotechniki');
INSERT INTO wydzialy (id, nazwa) VALUES (2, 'Informatyki i Telekomunikacji');
INSERT INTO wydzialy (id, nazwa) VALUES (3, 'Architektury');
INSERT INTO wydzialy (id, nazwa) VALUES (4, 'Inżynierii Lądowej i Transportu');
INSERT INTO wydzialy (id, nazwa) VALUES (5, 'Inżynierii Mechanicznej');

INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Automatyka i Robotyka', 1);
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Elektrotechnika', 1);
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Informatyka', 2);
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Telekomunikacja', 2);
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Architektura', 3);
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Inżynieria Lądowa', 4);
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Inżynieria Transportu', 4);
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Inżynieria Mechaniczna', 5);

INSERT INTO grupy (id, nazwa, typ) VALUES (1, '1A', 'Wykladowa');
INSERT INTO grupy (id, nazwa, typ) VALUES (2, '1B', 'Cwiczeniowa');
INSERT INTO grupy (id, nazwa, typ) VALUES (3, '1C', 'Cwiczeniowa');
INSERT INTO grupy (id, nazwa, typ) VALUES (4, '1D', 'Laboratoryjna');
INSERT INTO grupy (id, nazwa, typ) VALUES (5, '1E', 'Laboratoryjna');
INSERT INTO grupy (id, nazwa, typ) VALUES (6, '1F', 'Laboratoryjna');
INSERT INTO grupy (id, nazwa, typ) VALUES (7, '1G', 'Laboratoryjna');

INSERT INTO sale (nazwa, typ) VALUES ('A1', 'Laboratoryjna');
INSERT INTO sale (nazwa, typ) VALUES ('A2', 'Wykladowa');
INSERT INTO sale (nazwa, typ) VALUES ('A3', 'Cwiczeniowa');

INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Jan', 'Kowalski', 'dr inż.', 40);
INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Adam', 'Nowak', 'mgr.', 40);
INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Anna', 'Kowalska', 'prof. dr hab.', 40);
INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Katarzyna', 'Nowak', 'dr', 40);

INSERT INTO kursy (id, nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES (1, 'Analiza Matematyczna', 5, '2023/2024', 1, 1);
INSERT INTO kursy (id, nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES (2, 'Algebra Liniowa', 5, '2023/2024', 1, 1);
INSERT INTO kursy (id, nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES (3, 'Fizyka', 5, '2023/2024', 1, 1);
INSERT INTO kursy (id, nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES (4, 'Podstawy Programowania', 5, '1998/1999', 3, 2);
INSERT INTO kursy (id, nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES (5, 'Podstawy Elektrotechniki', 5, '1998/1999', 4, 3);

INSERT INTO zajecia (id, forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES (1, 'Wyklad', 30, 1, 1, 1);
INSERT INTO zajecia (id, forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES (2, 'Cwiczenia', 30, 2, 1, 1);
INSERT INTO zajecia (id, forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES (3, 'Cwiczenia', 30, 3, 1, 2);
INSERT INTO zajecia (id, forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES (4, 'Laboratoria', 30, 4, 1, 1);
INSERT INTO zajecia (id, forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES (5, 'Laboratoria', 30, 5, 1, 2);
INSERT INTO zajecia (id, forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES (6, 'Laboratoria', 30, 6, 1, 3);
INSERT INTO zajecia (id, forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES (7, 'Laboratoria', 30, 7, 1, 4);
