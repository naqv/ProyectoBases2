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
   multis_t(multi_t('taxi'),multi_t('carro')),
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
  'autopista',
   multis_t(multi_t('taxi'),multi_t('carro'),multi_t('moto')),
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
   multis_t(multi_t('taxi'),multi_t('carro'),multi_t('moto')),
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
   multis_t(multi_t('taxi'),multi_t('carro'),multi_t('moto')),
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
   multis_t(multi_t('taxi'),multi_t('carro'),multi_t('moto')),
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
   multis_t(multi_t('taxi'),multi_t('carro'),multi_t('moto')),
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
    'www.usb.com.ve',
    telefono_t(0212,6909090),
    'USB-DACE@usb.ve',
   'La entrada a la universidad es totalmente gratuita para todos' ,
    0,
    NULL,
   'Lunes-Viernes 6:30 - 21:30',
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
    'MuseoArtesModernas',
    coordenada_t(105,66,89),
    coordenada_t(34,106,12),
    coordenada_t(35,106,12),
    'Museo con hermosas obras Venezolanas',
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
    'Una camino y un destino a la felicidad. Hermoso pueblo.',
    'disponible',
    multis_t(multi_t('Historia')),
    18,
    'www.elhatillo.com',
    telefono_t(0212,6789098),
    'puebloelhatillo@gmail.com',
    'GRATUITO',
    0,
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
    'Restaurante',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('comida')),
    5,
    'www.restaurantehogar.com',
    telefono_t(0212,8907865),
    'restaurantehogar@gmail.com',
   '  Nino : 30 % de descuento',
    120,
    NULL,
   'Lunes-Viernes 9:30 - 22:00',
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
    'Cerro El Avila',
    'disponible',
     multis_t(multi_t('Historia')),
    8,
    'www.elavila.com',
    telefono_t(0212,6908945),
    'elavila@gmail.com',
    'Estudiante : gratis. Adulto: gratis. Nino : gratis',
    0,
    NULL,
   'Lunes-Viernes 8:30 - 17:00',
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
    'Estar cerca del senor es una bendicion',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('religion')),
    1,
    'www.elsenoresmipastor.com',
    telefono_t(0212,6786545),
    'cercadelsenor@gmail.com',
    'GRATIS',
    0,
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
    'Museo natural',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    5,
    'www.museodecaracas.com',
    telefono_t(0212,8975645),
    'museodecaracas@gmail.com',
   ' Estudiante: gratis. Adulto: 150 Bsf. Nino : 100 bsf',
    150,
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
    'Museo de artes contemporaneas',
    'disponible',
    multis_t(multi_t('Historia')),
    10,
    'www.bellasartes.com',
    telefono_t(0212,876456),
    'bellasartes@gmail.com',
    'Estudiante : 50 Bsf. Adulto: 200 Bsf. Nino : 100 bsf',
    200,
    NULL,
   'Lunes-Viernes 8:30 - 12:30 pm',
    NULL,
    NULL,
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
  'RutaNueva',
  coordenada_t(34,45,56),
  coordenada_t(45,45,67),
  coordenada_t(23,45,67),
  coordenada_t(12,34,12),
  4,
  'fija',
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
  'RutaMargarita',
  coordenada_t(34,45,56),
  coordenada_t(45,45,67),
  coordenada_t(23,45,67),
  coordenada_t(12,34,12),
  4,
  'fija',
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
  1231,
  'fija',
  '02-APR-2013',
  'Conocer los alrededores de la Universidad Simon Bolivar',
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
  'fija',
  '05-APR-2013',
  'Venezuela y sus cerros',
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
  'Museos perfectos en la ciudad de Caracas',
  refs_to_via(ref_to_via((SELECT REF(viacreada) FROM via_table viacreada WHERE viacreada.nombre = 'Tazon'))),
  (SELECT REF(ciudad) FROM ciudad_table ciudad WHERE ciudad.nombre = 'Caracas'),
  NULL);

INSERT INTO evento_table(
    nombre,                    
    categoria,                 
    costoMonedaLocal,         
    descripcion,              
    fechaInicio,               
    fechaFin,                  
    ocurre)VALUES(
    'Juana de arco',
    'musical',
    50,
    'Obra feminista.',
    '01-APR-2013',
    '03-APR-2013',
    (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'MuseoArtesModernas')
);
  
  
INSERT INTO evento_table(
    nombre,                    
    categoria,                 
    costoMonedaLocal,         
    descripcion,              
    fechaInicio,               
    fechaFin,                  
    ocurre
    )VALUES(
    'El fin de los tiempos',
    'musical',
    50,
    'Excelente pelicula venezolana.',
    '10-APR-2013',
    '20-APR-2013',
    (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'MuseoArtesModernas')
);

INSERT INTO evento_table(
    nombre,                    
    categoria,                 
    costoMonedaLocal,         
    descripcion,              
    fechaInicio,               
    fechaFin,                  
    ocurre
    )VALUES(
    'Jornada de siembra de arboles',
    'social',
    10,
    'Se cubrira toda la zona este.',
    '12-APR-2014',
    '25-APR-2014',
    (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'HogarDeLaFelicidad')
);
  

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
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaUSB'))) where nombre='UniversidadSimonBolivar';  
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaUSB'))) where nombre='PuebloElHAtillo';  
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaUSB'))) where nombre='HogarDeLaFelicidad';  


Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMuseoCaracas'))) where nombre='MuseoArtesModernas';  
Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMuseoCaracas'))) where nombre='MuseoDeCaracas'; 

Update hito_table Set rutaEnRefs = refs_to_ruta(ref_to_ruta((SELECT REF(rutacreada) FROM ruta_table rutacreada WHERE rutacreada.nombre = 'RutaMuseoCaracas'))) where nombre='MuseoBellasArtes'; 


  INSERT INTO agr_hito_table(
  ruta,
  hito
  )VALUES(
  (SELECT REF(ruta) FROM ruta_table ruta WHERE ruta.nombre = 'RutaUSB'),
  (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'UniversidadSimonBolivar'));



  
  INSERT INTO agr_hito_table(
  ruta,
  hito
  )VALUES(
  (SELECT REF(ruta) FROM ruta_table ruta WHERE ruta.nombre = 'RutaMuseoCaracas'),
  (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'MuseoBellasArtes'));




INSERT INTO paquete_table(
nombrePaquete,
 costoEstudiante,           
  costoEstandar,            
  costoTerceraEdad,          
  costoNino,                
  descripcionPaquete,      
  incluye
  )VALUES(
  'Barato',
  50,
  100,
  120,
  60,
  'Excelente paquete',
 (SELECT REF(shushu2) FROM ruta_table shushu2 WHERE shushu2.nombre = 'RutaNueva'));

  

  
