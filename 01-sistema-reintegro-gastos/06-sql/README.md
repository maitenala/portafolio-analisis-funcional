# Base de Datos y Consultas SQL

## Contexto

Dentro del desarrollo del Sistema de Reintegro de Gastos se creó un modelo de base de datos relacional utilizando PostgreSQL.

La información utilizada es completamente ficticia y fue creada únicamente para simular el funcionamiento del sistema y realizar pruebas sobre el modelo de datos.

---

# Creación de tablas

La estructura creada permite vincular:

- Un empleado con varias solicitudes de reintegro.
- Una solicitud con un único comprobante asociado.
- Una solicitud liquidada con su registro de pago correspondiente.

El script utilizado para crear la estructura se puede ver a continuación:

```sql
CREATE TABLE empleado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    legajo INT NOT NULL,
    rol VARCHAR(50) NOT NULL
);

CREATE TABLE comprobante (
    id SERIAL PRIMARY KEY,
    nombre_archivo VARCHAR(100) NOT NULL,
    ruta_archivo VARCHAR(255) NOT NULL,
    fecha_carga DATE NOT NULL
);

CREATE TABLE solicitud (
    id SERIAL PRIMARY KEY,
    empleado_id INT NOT NULL,
    comprobante_id INT NOT NULL,
    fecha DATE NOT NULL,
    importe NUMERIC(12,2) NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    estado VARCHAR(30) NOT NULL,

    CONSTRAINT fk_empleado
        FOREIGN KEY (empleado_id)
        REFERENCES empleado(id),

    CONSTRAINT fk_comprobante
        FOREIGN KEY (comprobante_id)
        REFERENCES comprobante(id)
);

CREATE TABLE liquidacion (
    id SERIAL PRIMARY KEY,
    solicitud_id INT UNIQUE NOT NULL,
    fecha DATE NOT NULL,
    importe NUMERIC(12,2) NOT NULL,

    CONSTRAINT fk_solicitud
        FOREIGN KEY (solicitud_id)
        REFERENCES solicitud(id)
);
```
---

# Carga de datos de prueba

Los datos incluyen solicitudes con distintos estados:

- Pendiente de aprobación.
- Aprobada.
- Rechazada.
- Liquidada.

Esto permite consultar información similar a la que podría analizar un equipo de soporte, administración o finanzas dentro de una aplicación real.

---

# Consultas SQL

Las siguientes consultas fueron realizadas sobre la base de datos creada con el objetivo de obtener información útil para el seguimiento del proceso.

El código completo de las consultas se encuentra en:

`06-Consultas SQL.pdf`

---

# Evidencias de ejecución de consultas

A continuación se muestran capturas de los resultados obtenidos al ejecutar las consultas sobre la base de datos.

---

## SQL-001 - Solicitudes pendientes de aprobación

Consulta utilizada para identificar solicitudes que todavía requieren revisión por parte del Supervisor.

<img width="1575" height="774" alt="1" src="https://github.com/user-attachments/assets/79a9aff6-e458-4ccf-b0db-e635d4417dd8" />

---

## SQL-002 - Solicitudes registradas por empleado

Consulta utilizada para visualizar el historial de solicitudes generadas por un empleado específico.

<img width="1578" height="791" alt="2" src="https://github.com/user-attachments/assets/1a7a1b03-53f1-4437-a273-69542abb9dee" />

---

## SQL-003 - Solicitudes aprobadas pendientes de liquidación

Consulta utilizada para identificar solicitudes aprobadas que aún deben ser procesadas por Finanzas.

<img width="1580" height="692" alt="3" src="https://github.com/user-attachments/assets/3db7f70c-2b60-4acd-baca-9fd2c7509b1f" />

---

## SQL-004 - Historial de liquidaciones

Consulta utilizada para visualizar solicitudes que completaron el proceso y cuentan con una liquidación registrada.

<img width="1574" height="745" alt="4" src="https://github.com/user-attachments/assets/064b623e-f89a-4e8d-be1a-9c86f75261df" />

---

## SQL-005 - Cantidad de solicitudes por estado

Consulta utilizada para obtener una vista general de la cantidad de solicitudes agrupadas según su estado actual.

<img width="1575" height="797" alt="5" src="https://github.com/user-attachments/assets/dc74c280-25ed-4339-a6f3-4a68b8c2e2d7" />

---

## SQL-006 - Solicitudes rechazadas

Consulta utilizada para consultar las solicitudes que fueron rechazadas durante el proceso de aprobación.

<img width="1579" height="683" alt="6" src="https://github.com/user-attachments/assets/379f2d98-e4fe-44ad-b264-e12a6b4a6fbf" />

---

## SQL-007 - Solicitud con comprobante asociado

Consulta utilizada para verificar la información de una solicitud junto con el comprobante adjunto correspondiente.

Esto permite validar que la documentación presentada por el empleado se encuentre relacionada correctamente con la solicitud generada.

<img width="1580" height="662" alt="7" src="https://github.com/user-attachments/assets/d329d94b-dca6-4441-ac09-e03092fe1a72" />

---

## SQL-008 - Solicitudes registradas en un período

Consulta utilizada para obtener las solicitudes generadas dentro de un rango de fechas determinado.

<img width="1579" height="794" alt="8" src="https://github.com/user-attachments/assets/0aa51587-d05c-427b-93d3-b7be1facf7c5" />

---

# Resultado

La creación de esta base de datos permitió representar el circuito principal del Sistema de Reintegro de Gastos y contar con información de prueba para validar distintos escenarios del proceso.

Las consultas realizadas sirven como apoyo para analizar información operativa del sistema y validar que el modelo diseñado responde a las necesidades planteadas durante el análisis funcional.laborar con equipos técnicos durante las distintas etapas de desarrollo.
