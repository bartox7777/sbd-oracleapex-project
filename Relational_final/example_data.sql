BEGIN
INSERT INTO sale (nazwa, typ) VALUES ('A1', 'Laboratoryjna');
INSERT INTO sale (nazwa, typ) VALUES ('A2', 'Wykladowa');
INSERT INTO sale (nazwa, typ) VALUES ('A3', 'Cwiczeniowa');
END;

BEGIN
INSERT INTO wydzialy (nazwa) VALUES ('Automatyki, Robotyki i Elektrotechniki');
INSERT INTO wydzialy (nazwa) VALUES ('Informatyki i Telekomunikacji');
INSERT INTO wydzialy (nazwa) VALUES ('Architektury');
INSERT INTO wydzialy (nazwa) VALUES ('Inżynierii Lądowej i Transportu');
INSERT INTO wydzialy (nazwa) VALUES ('Inżynierii Mechanicznej');
END;

BEGIN
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Automatyka i Robotyka', (SELECT id FROM wydzialy WHERE nazwa = 'Automatyki, Robotyki i Elektrotechniki'));
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Elektrotechnika', (SELECT id FROM wydzialy WHERE nazwa = 'Automatyki, Robotyki i Elektrotechniki'));
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Informatyka', (SELECT id FROM wydzialy WHERE nazwa = 'Informatyki i Telekomunikacji'));
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Telekomunikacja', (SELECT id FROM wydzialy WHERE nazwa = 'Informatyki i Telekomunikacji'));
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Architektura', (SELECT id FROM wydzialy WHERE nazwa = 'Architektury'));
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Inżynieria Lądowa', (SELECT id FROM wydzialy WHERE nazwa = 'Inżynierii Lądowej i Transportu'));
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Inżynieria Transportu', (SELECT id FROM wydzialy WHERE nazwa = 'Inżynierii Lądowej i Transportu'));
INSERT INTO kierunki_studiow (nazwa, wydzial_id) VALUES ('Inżynieria Mechaniczna', (SELECT id FROM wydzialy WHERE nazwa = 'Inżynierii Mechanicznej'));
END;

BEGIN
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Jan', 'Kowalski', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Adam', 'Nowak', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Anna', 'Kowalska', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Katarzyna', 'Nowak', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Piotr', 'Kowalski', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Jan', 'Nowak', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Adam', 'Kowalski', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Anna', 'Nowak', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Katarzyna', 'Kowalska', 1, 1);
INSERT INTO studenci (imie, nazwisko, obecny_semestr, stopien_studiow) VALUES ('Piotr', 'Nowak', 1, 1);
END;

BEGIN
INSERT INTO grupy (nazwa, typ) VALUES ('1A', 'Wykladowa');
INSERT INTO grupy (nazwa, typ) VALUES ('1B', 'Cwiczeniowa');
INSERT INTO grupy (nazwa, typ) VALUES ('1C', 'Cwiczeniowa');
INSERT INTO grupy (nazwa, typ) VALUES ('1D', 'Laboratoryjna');
INSERT INTO grupy (nazwa, typ) VALUES ('1E', 'Laboratoryjna');
INSERT INTO grupy (nazwa, typ) VALUES ('1F', 'Laboratoryjna');
INSERT INTO grupy (nazwa, typ) VALUES ('1G', 'Laboratoryjna');
END;

BEGIN
INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Jan', 'Kowalski', 'dr inż.', 40);
INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Adam', 'Nowak', 'mgr.', 40);
INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Anna', 'Kowalska', 'prof. dr hab.', 40);
INSERT INTO pracownicy (imie, nazwisko, stopien_naukowy, tygodniowy_limit_godzin) VALUES ('Katarzyna', 'Nowak', 'dr', 40);
END;

BEGIN
INSERT INTO kursy (nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES ('Analiza Matematyczna', 5, '2023/2024', (SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT id FROM pracownicy WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO kursy (nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES ('Algebra Liniowa', 5, '2023/2024', (SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT id FROM pracownicy WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO kursy (nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES ('Fizyka', 5, '2023/2024', (SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT id FROM pracownicy WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO kursy (nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES ('Podstawy Programowania', 5, '1998/1999', (SELECT id FROM kierunki_studiow WHERE nazwa = 'Informatyka'), (SELECT id FROM pracownicy WHERE imie = 'Adam' AND nazwisko = 'Nowak'));
INSERT INTO kursy (nazwa, punkty_ects, rok_akademicki, kierunek_studiow_id, kierownik_kursu) VALUES ('Podstawy Elektrotechniki', 5, '1998/1999', (SELECT id FROM kierunki_studiow WHERE nazwa = 'Inżynieria Lądowa'), (SELECT id FROM pracownicy WHERE imie = 'Anna' AND nazwisko = 'Kowalska'));
END;

BEGIN
INSERT INTO zajecia (forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES ('Wyklad', 30, (SELECT id FROM grupy WHERE nazwa = '1A'), (SELECT id FROM kursy WHERE nazwa = 'Analiza Matematyczna'), (SELECT id FROM pracownicy WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO zajecia (forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES ('Cwiczenia', 30, (SELECT id FROM grupy WHERE nazwa = '1B'), (SELECT id FROM kursy WHERE nazwa = 'Analiza Matematyczna'), (SELECT id FROM pracownicy WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO zajecia (forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES ('Cwiczenia', 30, (SELECT id FROM grupy WHERE nazwa = '1C'), (SELECT id FROM kursy WHERE nazwa = 'Analiza Matematyczna'), (SELECT id FROM pracownicy WHERE imie = 'Adam' AND nazwisko = 'Nowak'));
INSERT INTO zajecia (forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES ('Laboratoria', 30, (SELECT id FROM grupy WHERE nazwa = '1D'), (SELECT id FROM kursy WHERE nazwa = 'Analiza Matematyczna'), (SELECT id FROM pracownicy WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO zajecia (forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES ('Laboratoria', 30, (SELECT id FROM grupy WHERE nazwa = '1E'), (SELECT id FROM kursy WHERE nazwa = 'Analiza Matematyczna'), (SELECT id FROM pracownicy WHERE imie = 'Adam' AND nazwisko = 'Nowak'));
INSERT INTO zajecia (forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES ('Laboratoria', 30, (SELECT id FROM grupy WHERE nazwa = '1F'), (SELECT id FROM kursy WHERE nazwa = 'Analiza Matematyczna'), (SELECT id FROM pracownicy WHERE imie = 'Anna' AND nazwisko = 'Kowalska'));
INSERT INTO zajecia (forma_zajec, ilosc_godzin, grupa_id, kurs_id, pracownik_id) VALUES ('Laboratoria', 30, (SELECT id FROM grupy WHERE nazwa = '1G'), (SELECT id FROM kursy WHERE nazwa = 'Analiza Matematyczna'), (SELECT id FROM pracownicy WHERE imie = 'Katarzyna' AND nazwisko = 'Nowak'));
END;

BEGIN
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1A'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1A'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1A'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Kowalska'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1A'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1A'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1B'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1B'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1B'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1B'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Kowalska'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1B'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1C'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1C'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1C'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Kowalska'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1C'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1C'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1D'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1D'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1D'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1D'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Kowalska'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1D'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1E'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1E'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1E'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Kowalska'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1E'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1E'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1F'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1F'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Kowalski'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1F'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Nowak'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1F'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Kowalska'));
INSERT INTO grupy_studentow (grupa_id, student_id) VALUES ((SELECT id FROM grupy WHERE nazwa = '1F'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Nowak'));
END;

BEGIN
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Kowalski'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Nowak'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Kowalska'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Nowak'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Kowalski'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Jan' AND nazwisko = 'Nowak'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Adam' AND nazwisko = 'Kowalski'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Anna' AND nazwisko = 'Nowak'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Katarzyna' AND nazwisko = 'Kowalska'));
INSERT INTO kierunki_studentow (kierunek_studiow_id, student_id) VALUES ((SELECT id FROM kierunki_studiow WHERE nazwa = 'Automatyka i Robotyka'), (SELECT nr_indeksu FROM studenci WHERE imie = 'Piotr' AND nazwisko = 'Nowak'));
END;


-- DELETE FROM studenci;
-- DELETE FROM sale;
-- DELETE FROM zajecia;
-- DELETE FROM grupy;
-- DELETE FROM kursy;
-- DELETE FROM kierunki_studiow;
-- DELETE FROM pracownicy;
-- DELETE FROM wydzialy;
