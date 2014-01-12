CREATE OR REPLACE TYPE empleado_t AS OBJECT(
  nombre       	VARCHAR(100),
  estado       	VARCHAR(50),
  edad   		INTEGER(2),
  paginaweb     VARCHAR(30),
  email         VARCHAR(100)
  )NOT FINAL;
/
  
CREATE OR REPLACE TYPE ref_to_empleado AS OBJECT(toEmpleado REF empleado_t);
/

CREATE OR REPLACE TYPE refs_to_empleado AS TABLE OF ref_to_empleado;
/

CREATE OR REPLACE TYPE departamento_t AS OBJECT(
    nombre          	VARCHAR(20),
    descripcion     	VARCHAR(100),
    empleadosActuales 	refs_to_empleado
);
/

ALTER TYPE empleado_t ADD ATTRIBUTE (departamento REF departamento_t) CASCADE;

/Users/naqv1991/Dropbox/Bases de datos II/ProyectoBases2/E3/EJEMPLO PARA NATACHA/tablas.sql