-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-11-25 20:13:33 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE grupy (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(20) NOT NULL,
    typ   VARCHAR2(20) NOT NULL
);

ALTER TABLE grupy
    ADD CHECK ( typ IN ( 'Cwiczeniowa', 'Laboratoryjna', 'Wykladowa' ) );

ALTER TABLE grupy ADD CONSTRAINT grupa_pk PRIMARY KEY ( id );

CREATE TABLE grupy_studentow (
    id         INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    grupa_id   INTEGER NOT NULL
);

ALTER TABLE grupy_studentow ADD CONSTRAINT grupy_studentow_pk PRIMARY KEY ( id );

ALTER TABLE grupy_studentow ADD CONSTRAINT grupy_studentow__un UNIQUE ( student_id,
                                                                        grupa_id );

CREATE TABLE kierunki_studentow (
    id                  INTEGER NOT NULL,
    student_id          INTEGER NOT NULL,
    kierunek_studiow_id INTEGER NOT NULL
);

ALTER TABLE kierunki_studentow ADD CONSTRAINT kierunki_studentow_pk PRIMARY KEY ( id );

ALTER TABLE kierunki_studentow ADD CONSTRAINT kierunki_studentow__un UNIQUE ( student_id,
                                                                              kierunek_studiow_id );

CREATE TABLE kierunki_studiow (
    id         INTEGER NOT NULL,
    nazwa      VARCHAR2(50) NOT NULL,
    wydzial_id INTEGER NOT NULL
);

ALTER TABLE kierunki_studiow ADD CONSTRAINT kierunek_studi�w_pk PRIMARY KEY ( id );

CREATE TABLE kursy (
    id                  INTEGER NOT NULL,
    nazwa               VARCHAR2(50) NOT NULL,
    punkty_ects         INTEGER NOT NULL,
    rok_akademicki      VARCHAR2(20) NOT NULL,
    kierunek_studiow_id INTEGER NOT NULL,
    kierownik_kursu     INTEGER
);

ALTER TABLE kursy ADD CONSTRAINT kurs_pk PRIMARY KEY ( id );

CREATE TABLE oceny (
    id         INTEGER NOT NULL,
    stopien    VARCHAR2(3) NOT NULL,
    komentarz  VARCHAR2(1999),
    data       DATE NOT NULL,
    student_id INTEGER NOT NULL,
    zajecia_id INTEGER NOT NULL
);

ALTER TABLE oceny
    ADD CHECK ( stopien IN ( '2.0', '3.0', '3.5', '4.0', '4.5',
                             '5.0' ) );

ALTER TABLE oceny ADD CONSTRAINT ocena_pk PRIMARY KEY ( id );

ALTER TABLE oceny ADD CONSTRAINT oceny__un UNIQUE ( student_id,
                                                    zajecia_id );

CREATE TABLE pracownicy (
    id                      INTEGER NOT NULL,
    imie                    VARCHAR2(30) NOT NULL,
    nazwisko                VARCHAR2(30) NOT NULL,
    stopien_naukowy         VARCHAR2(30),
    tygodniowy_limit_godzin INTEGER
);

ALTER TABLE pracownicy ADD CONSTRAINT pracownik_pk PRIMARY KEY ( id );

CREATE TABLE rezerwacje_sal (
    id                  INTEGER NOT NULL,
    jednostka_zajeciowa INTEGER NOT NULL,
    dzien_tygodnia      VARCHAR2(30) NOT NULL,
    tydzien             CHAR(1) NOT NULL,
    zajecia_id          INTEGER NOT NULL,
    sala_id             INTEGER NOT NULL
);

ALTER TABLE rezerwacje_sal ADD CHECK ( jednostka_zajeciowa BETWEEN 1 AND 20 );

ALTER TABLE rezerwacje_sal
    ADD CHECK ( dzien_tygodnia IN ( 'Czw', 'Nd', 'Pon', 'Pt', 'Sob',
                                    'Sr', 'Wt' ) );

COMMENT ON COLUMN rezerwacje_sal.tydzien IS
    '0 - parzyste
1 - nieparzyste

jezli zajecia odbywaja sie w kazdy tydzien to nalezy dodac 2 rekordy z 0 i 1';

ALTER TABLE rezerwacje_sal ADD CONSTRAINT rezerwacja_sali_pk PRIMARY KEY ( id );

ALTER TABLE rezerwacje_sal
    ADD CONSTRAINT rezerwacje_unique UNIQUE ( jednostka_zajeciowa,
                                              dzien_tygodnia,
                                              tydzien,
                                              sala_id );

CREATE TABLE sale (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(30) NOT NULL,
    typ   VARCHAR2(30) NOT NULL
);

ALTER TABLE sale ADD CONSTRAINT sala_pk PRIMARY KEY ( id );

ALTER TABLE sale ADD CONSTRAINT sale__un UNIQUE ( nazwa );

CREATE TABLE studenci (
    nr_indeksu          INTEGER NOT NULL,
    imie                VARCHAR2(30) NOT NULL,
    nazwisko            VARCHAR2(30) NOT NULL,
    obecny_semestr      INTEGER NOT NULL,
    liczba_punkt�w_ects INTEGER,
    stopien_studiow     INTEGER NOT NULL
);

ALTER TABLE studenci ADD CHECK ( obecny_semestr BETWEEN 1 AND 12 );

ALTER TABLE studenci ADD CHECK ( liczba_punkt�w_ects > 0 );

ALTER TABLE studenci ADD CONSTRAINT student_pk PRIMARY KEY ( nr_indeksu );

CREATE TABLE wydzialy (
    id    INTEGER NOT NULL,
    nazwa VARCHAR2(50) NOT NULL
);

ALTER TABLE wydzialy ADD CONSTRAINT wydzial_pk PRIMARY KEY ( id );

CREATE TABLE zajecia (
    id           INTEGER NOT NULL,
    forma_zajec  VARCHAR2(20) NOT NULL,
    ilosc_godzin INTEGER NOT NULL,
    grupa_id     INTEGER NOT NULL,
    kurs_id      INTEGER NOT NULL,
    pracownik_id INTEGER NOT NULL
);

ALTER TABLE zajecia
    ADD CHECK ( forma_zajec IN ( 'Cwiczenia', 'Laboratoria', 'Projekt', 'Wyklad' ) );

ALTER TABLE zajecia ADD CHECK ( ilosc_godzin > 0 );

ALTER TABLE zajecia ADD CONSTRAINT zajecia_pk PRIMARY KEY ( id );

ALTER TABLE zajecia
    ADD CONSTRAINT dydaktyk FOREIGN KEY ( pracownik_id )
        REFERENCES pracownicy ( id );

ALTER TABLE zajecia
    ADD CONSTRAINT grupa FOREIGN KEY ( grupa_id )
        REFERENCES grupy ( id );

ALTER TABLE grupy_studentow
    ADD CONSTRAINT grupav2 FOREIGN KEY ( grupa_id )
        REFERENCES grupy ( id );

ALTER TABLE kursy
    ADD CONSTRAINT kierownik_kursu_id FOREIGN KEY ( kierownik_kursu )
        REFERENCES pracownicy ( id );

ALTER TABLE kursy
    ADD CONSTRAINT kierunek FOREIGN KEY ( kierunek_studiow_id )
        REFERENCES kierunki_studiow ( id );

ALTER TABLE kierunki_studentow
    ADD CONSTRAINT kierunek_id FOREIGN KEY ( kierunek_studiow_id )
        REFERENCES kierunki_studiow ( id );

ALTER TABLE zajecia
    ADD CONSTRAINT kurs FOREIGN KEY ( kurs_id )
        REFERENCES kursy ( id );

ALTER TABLE oceny
    ADD CONSTRAINT przedmiot_id FOREIGN KEY ( zajecia_id )
        REFERENCES zajecia ( id );

ALTER TABLE rezerwacje_sal
    ADD CONSTRAINT sala FOREIGN KEY ( sala_id )
        REFERENCES sale ( id );

ALTER TABLE grupy_studentow
    ADD CONSTRAINT student FOREIGN KEY ( student_id )
        REFERENCES studenci ( nr_indeksu );

ALTER TABLE kierunki_studentow
    ADD CONSTRAINT student_id FOREIGN KEY ( student_id )
        REFERENCES studenci ( nr_indeksu );

ALTER TABLE oceny
    ADD CONSTRAINT student_idv2 FOREIGN KEY ( student_id )
        REFERENCES studenci ( nr_indeksu );

ALTER TABLE kierunki_studiow
    ADD CONSTRAINT wydzial FOREIGN KEY ( wydzial_id )
        REFERENCES wydzialy ( id );

ALTER TABLE rezerwacje_sal
    ADD CONSTRAINT zajecia FOREIGN KEY ( zajecia_id )
        REFERENCES zajecia ( id );

CREATE SEQUENCE kierunki_studiow_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER kierunki_studiow_id_trg BEFORE
    INSERT ON kierunki_studiow
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := kierunki_studiow_id_seq.nextval;
END;
/

CREATE SEQUENCE pracownicy_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pracownicy_id_trg BEFORE
    INSERT ON pracownicy
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := pracownicy_id_seq.nextval;
END;
/

CREATE SEQUENCE sale_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER sale_id_trg BEFORE
    INSERT ON sale
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := sale_id_seq.nextval;
END;
/