--EJEMPLOS

INSERT INTO ruta_table (
  2    ,
  3    customer,
  4    product
  5  ) VALUES (
  6    1,
  7    (SELECT REF(oc) FROM object_customers oc WHERE oc.id = 1),
  8    (SELECT REF(op) FROM object_products  op WHERE op.id = 1)
  9  );

  
  CREATE TYPE address_t AS OBJECT (
   street  VARCHAR2(30),
   city    VARCHAR2(20),
   state   CHAR(2),
   zip     CHAR(5) );
/
CREATE TYPE address_tab IS TABLE OF address_t;
/
CREATE TABLE customers (
   custid  NUMBER,
   address address_tab )
NESTED TABLE address STORE AS customer_addresses;

INSERT INTO customers VALUES (1,
            address_tab(
              address_t('101 First', 'Redwood Shores', 'CA', '94065'),
              address_t('123 Maple', 'Mill Valley',    'CA', '90952')

  





CIUDADES
  
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
  'Paris',
  'Francia',
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
  'Barcelina',
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
  
    INSERT INTO ciudad_table(
  nombre,                    --VARCHAR(100),
  pais,                      --VARCHAR(100), 
  nombreMonedaLocal,         --VARCHAR(30),
  relacionLocalUSD,          --NUMERIC(30,5),
  seEncuentraEnRefs,         --refs_to_via,
  estaEnRefs                --refs_to_ruta
  )VALUES(
  'Londres',
  'Ingleterra',
  'Libras',
  5.30,
  NULL,
  NULL);
  
  
  VIAS
  
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
  'viaSantisimaTrinidad',
  'calle',
   multis_t('taxi'),
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
    email ,
    foto,
    horario,
    tarifadescuento,
    costoTicketMonedaLocal,   
    contiene,
    rutaEnRefs
    )VALUES(
    'MuseoArtesModernas',
    coordenada_t(45,66,89),
    coordenada_t(34,45,12),
    coordenada_t(35,45,12),
    'Muy bueno este museo.Arte',
    'disponible',
    multis_t(multi_t('Historia'),multi_t('Musica')),
    18,
    'www.museoartesmodernas.com',
    telefono_t(0212,7777777),
    'museomoderno@gmail.com',
    NULL,
    ' Lunes-Viernes 8:30 - 12:30 pm',
    ' Estudiante : gratis. Adulto: 50 Bsf. Nino : 30 bsf',
    50,
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
  
-- Esto ya no.
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
  NULL,
  (SELECT REF(ciudad) FROM ciudad_table ciudad WHERE ciudad.nombre = 'Caracas'),
  (SELECT REF(hito) FROM hito_table hito WHERE hito.nombre = 'MuseoArtesModernas')
  );
  
  
CREATE or REPLACE TRIGGER ActualizarVia
AFTER INSERT
   ON ruta_table
   [ FOR EACH ROW ]

DECLARE
    cursos

BEGIN
   Recorrer la nested table y por cada via, actualizar el atributo que asocia el numero de vias

EXCEPTION
   WHEN ...
   -- exception handling

END;
  
  
  
  
  
  
  
  
  
  
  
