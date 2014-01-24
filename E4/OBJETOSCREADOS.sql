--CIUDADES
  
  INSERT INTO ciudad_table(
  nombre,                    --VARCHAR(100),
  pais,                      --VARCHAR(100), 
  nombreMonedaLocal,         --VARCHAR(30),
  relacionLocalUSD,          --NUMERIC(30,5),
  seEncuentraEnRefs,         --refs_to_via,
  estaEnRefs                --refs_to_ruta
  )VALUES(
  'Caracas',
  'Venezuela',
  'Bolivares',
  6.30,
  NULL,
  NULL);
  
   
  
    INSERT INTO ciudad_table(
  nombre,                    --VARCHAR(100),
  pais,                      --VARCHAR(100), 
  nombreMonedaLocal,         --VARCHAR(30),
  relacionLocalUSD,          --NUMERIC(30,5),
  seEncuentraEnRefs,         --refs_to_via,
  estaEnRefs                --refs_to_ruta
  )VALUES(
  'Barcelona',
  'Espana',
  'Euro',
  8.30,
  NULL,
  NULL);
  
  INSERT INTO ciudad_table(
  nombre,                    --VARCHAR(100),
  pais,                      --VARCHAR(100), 
  nombreMonedaLocal,         --VARCHAR(30),
  relacionLocalUSD,          --NUMERIC(30,5),
  seEncuentraEnRefs,         --refs_to_via,
  estaEnRefs                --refs_to_ruta
  )VALUES(
  'Bogota',
  'Colombia',
  'Pesos',
  2.30,
  NULL,
  NULL);
  
 -- VIAS
  
  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  
  seEncuentraEn
  )VALUES(
  'HoyoDeLaPuerta',
  'calle',
   multis_t(multi_t('taxi'),multi_t('carro'),multi_t('moto'),multi_t('bicicleta')),
   coordenada_t(48,67,89),
   coordenada_t(48,67,89),
   coordenada_t(48,67,89),
   coordenada_t(48,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  


  
INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  
  seEncuentraEn
  )VALUES(
  'LaNuezDeAdan',
  'autopista',
   multis_t(multi_t('taxi'),multi_t('carro')),
   coordenada_t(47,67,89),
   coordenada_t(47,67,89),
   coordenada_t(47,67,89),
   coordenada_t(47,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));


  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  
  seEncuentraEn
  )VALUES(
  'ElHatillo',
  'avenida',
   multis_t(multi_t('taxi'),multi_t('carro')),
   coordenada_t(46,67,89),
   coordenada_t(46,67,89),
   coordenada_t(46,67,89),
   coordenada_t(46,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  

  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'viaSantisimaTrinidad',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  

  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'Tazon',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  

  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'LaPared',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  
  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'MariPerez',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  
  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'ElCandado',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  

  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'MariPerez',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  
  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'BellasArtes',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  


--HITOS

  INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'UniversidadSimonBolivar',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);


  INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'MuseoArtesModernos',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);

INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'PuebloElHAtillo',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);



INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'HogarDeLaFelicidad',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);


INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'ElAvila',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);


INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'IglesiaCatolica',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);


INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'ElAvila',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);


INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'HermandadGallega',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);


  
INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'MuseoDeCaracas',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);


  
INSERT INTO hito_table(
    nombre, 
    latitud,
    longitud,
    altitud,
    descripcion,
    estado,
    categoria,
    edadApropiada,
    paginaweb,
    telefono,
    email,
    tarifadescuento,
    costoTicketMonedaLocal,   
    foto,
    horario,
    contieneRef,               
    rutaEnRefs,               
    contieneNT           
    )VALUES(
    'MuseoBellasArtes',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Universidad de prestigio.',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
   ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
    NULL);










  INSERT INTO via_table(
  nombre,                  
  tipo,
  tiposTransporte,           
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,                
  finLongintud,             
  rutasPresentes, 
  todoRuta,  -- NESTED TABLE QUE SE DEBE BORRADA.
  seEncuentraEn
  )VALUES(
  'viaSantisimaTrinidad',
  'calle',
   multis_t(multi_t('taxi')),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   coordenada_t(45,67,89),
   0,
   NULL,
   (SELECT REF(c) FROM ciudad_table c WHERE c.nombre = 'Caracas'));
  

  INSERT INTO ruta_Table(
  nombre,
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,               
  finLongitud,               
  cantidadVisitas,          
  tipo,                     
  fechaIngreso,             
  descripcion,               
  partesVia,                 
  estaEn,
  rutaEn
  )VALUES(
  'RutaMargarita',
  coordenada_t(34,45,56),
  coordenada_t(45,45,67),
  coordenada_t(23,45,67),
  coordenada_t(12,34,12),
  4,
  'dinamica',
  '01-APR-2013',
  'Esta ruta tiene cosas interesantes',
  refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'HoyoDeLaPuerta'))),
  (SELECT REF(ciudad) FROM ciudad_table ciudad WHERE ciudad.nombre = 'Caracas'),
  (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'MuseoArtesModernas'));
  
 INSERT INTO ruta_Table(
  nombre,
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,               
  finLongitud,               
  cantidadVisitas,          
  tipo,                     
  fechaIngreso,             
  descripcion,               
  partesVia,                 
  estaEn,
  rutaEn
  )VALUES(
  'RutaUSB',
  coordenada_t(34,45,56),
  coordenada_t(45,45,67),
  coordenada_t(23,45,67),
  coordenada_t(12,34,12),
  4,
  'dinamica',
  '01-APR-2013',
  'Esta ruta tiene cosas interesantes',
  refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'HoyoDeLaPuerta'))),
  (SELECT REF(ciudad) FROM ciudad_table ciudad WHERE ciudad.nombre = 'Caracas'),
  NULL);



 INSERT INTO ruta_Table(
  nombre,
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,               
  finLongitud,               
  cantidadVisitas,          
  tipo,                     
  fechaIngreso,             
  descripcion,               
  partesVia,                 
  estaEn,
  rutaEn
  )VALUES(
  'RutaAvila',
  coordenada_t(34,45,56),
  coordenada_t(45,45,67),
  coordenada_t(23,45,67),
  coordenada_t(12,34,12),
  4,
  'dinamica',
  '01-APR-2013',
  'Esta ruta tiene cosas interesantes',
  refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'HoyoDeLaPuerta'))),
  (SELECT REF(ciudad) FROM ciudad_table ciudad WHERE ciudad.nombre = 'Caracas'),
  NULL);



 INSERT INTO ruta_Table(
  nombre,
  inicioLatitud,             
  inicioLongitud,            
  finLatitud,               
  finLongitud,               
  cantidadVisitas,          
  tipo,                     
  fechaIngreso,             
  descripcion,               
  partesVia,                 
  estaEn,
  rutaEn
  )VALUES(
  'RutaMuseoCaracas',
  coordenada_t(34,45,56),
  coordenada_t(45,45,67),
  coordenada_t(23,45,67),
  coordenada_t(12,34,12),
  4,
  'dinamica',
  '01-APR-2013',
  'Esta ruta tiene cosas interesantes',
  refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'Tazon'))),
  (SELECT REF(ciudad) FROM ciudad_table ciudad WHERE ciudad.nombre = 'Caracas'),
  NULL);






Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'HoyoDeLaPuerta'))) where nombre='Caracas';
Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'ElHatillo'))) where nombre='Caracas';
Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'LaNuezDeAdan'))) where nombre='Caracas';
Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'Tazon'))) where nombre='Caracas';
Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'LaPared'))) where nombre='Caracas';
Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'MariPerez'))) where nombre='Caracas';
Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'ElCandado'))) where nombre='Caracas';
Update ciudad_table Set seEncuentraEnRefs = refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'BellasArtes'))) where nombre='Caracas';

Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMargarita'))) where nombre='MuseoArtesModernas';
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMargarita'))) where nombre='UniversidadSimonBolivar';                         


Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaAvila'))) where nombre='ElAvila';  
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaAvila'))) where nombre='IglesiaCatolica';  
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaAvila'))) where nombre='HermandadGallega';  



Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaUSB'))) where nombre='UniversidadSimonBolivar';  

Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaUSB'))) where nombre='PuebloElHAtillo';  

Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaUSB'))) where nombre='HogarDeLaFelicidad';  


Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMuseoCaracas'))) where nombre='MuseoArtesModernos';  
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMuseoCaracas'))) where nombre='MuseoDeCaracas'; 

Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMuseoCaracas'))) where nombre='MuseoBellasArtes'; 






-- NO SE SI COMO S UNA NESTED, SE JODE.
-- SEGUN ESTO. Ya en ciudad tenemos todas las vías que hay.
-- Por ruta, ya ciudad tiene todas las rutas que tiene
-- Los hitos tienes una nestescon las rutas que pertenecen en el.

  
  
  
  
  
  
  
  
  
