CREATE TABLE empleado_table OF empleado_t;

CREATE TABLE departamento_table OF departamento_t
    NESTED TABLE empleadosActuales STORE AS EMPLEADOS_ACTUALES;