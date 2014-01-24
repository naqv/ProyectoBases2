-- CIUDADES
  
INSERT INTO ciudad_table
VALUES ('Caracas','Venezuela','Bolivares', 6.30, NULL, NULL);
  
INSERT INTO ciudad_table
VALUES('Paris','Francia','Euro', 8.30, NULL, NULL);
  
INSERT INTO ciudad_table
VALUES('Barcelona','Espana','Euro',8.30,NULL,NULL);
  
INSERT INTO ciudad_table
VALUES('Bogota','Colombia','Pesos',2.30,NULL,NULL);
  
INSERT INTO ciudad_table
VALUES('Londres','Ingleterra','Libras',5.30,NULL,NULL);
  
-- VIAS

INSERT INTO via_table
VALUES('viaSantisimaTrinidad','calle',
        multis_t(multi_t('taxi')), 
        coordenada_t(45,67,89),coordenada_t(45,67,89),coordenada_t(45,67,89),coordenada_t(45,67,89),
        0, NULL,
        (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  
INSERT INTO via_table
VALUES('ElHatillo','avenida',
        multis_t(multi_t('taxi'),multi_t('carro')),
        coordenada_t(46,67,89), coordenada_t(46,67,89), coordenada_t(46,67,89), coordenada_t(46,67,89),
        0,NULL,
        (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  
  
INSERT INTO via_table
VALUES('LaNuezDeAdan','autopista',
        multis_t(multi_t('taxi'),multi_t('carro')),
        coordenada_t(47,67,89), coordenada_t(47,67,89), coordenada_t(47,67,89),coordenada_t(47,67,89),
        0, NULL,
        (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  
  
INSERT INTO via_table
VALUES('HoyoDeLaPuerta','calle',
        multis_t(multi_t('taxi'),multi_t('carro'),multi_t('moto'),multi_t('bicicleta')),
        coordenada_t(48,67,89),coordenada_t(48,67,89),coordenada_t(48,67,89),coordenada_t(48,67,89),
        0,NULL,
        (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  
  
INSERT INTO hito_table
VALUES('MuseoArtesModernas',
        coordenada_t(45,66,89), coordenada_t(34,45,12), coordenada_t(35,45,12),
        'Muy bueno este museo.Arte','disponible',
        multis_t(multi_t('Historia'),multi_t('Musica')),
        18,'www.museoartesmodernas.com',telefono_t(0212,7777777),
        'museomoderno@gmail.com',NULL,
        ' Lunes-Viernes 8:30 - 12:30 pm',
        ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
        50, NULL, NULL);
  
INSERT INTO ruta_Table
VALUES('RutaMargarita',
        coordenada_t(34,45,56), coordenada_t(45,45,67), coordenada_t(23,45,67), coordenada_t(12,34,12),
        4,'dinamica','01-APR-2013','Esta ruta tiene cosas interesantes',
        refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'HoyoDeLaPuerta'))),
        (SELECT REF(ciudad) FROM ciudad_table ciudad WHERE ciudad.nombre = 'Caracas'),
        (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'MuseoArtesModernas'));


  
  
  
  
  
  
  
  
  
  
  
