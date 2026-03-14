# Guion para Video – Examen I DBT & BigQuery

Este documento sirve como **guion para el video del examen**, indicando qué explicar y qué mostrar en pantalla durante la demostración del flujo completo de DBT con BigQuery.

---

# 1. Introducción (mostrar presentación o terminal)

Explicar brevemente el objetivo del proyecto.

**Narración sugerida**

> En este proyecto demostramos un flujo completo de transformación de datos usando DBT y BigQuery.
> El proceso incluye autenticación con Google Cloud, carga de datos mediante seeds, transformación con modelos DBT y visualización de los resultados en BigQuery.

**Mostrar en pantalla**

* Estructura del repositorio
* Carpeta del proyecto DBT

---

# 2. Mostrar la estructura del proyecto

Mostrar en la terminal la estructura del proyecto.

```bash
ls
```

Mostrar principalmente:

```text
dbt_project_exam
├── dbt_project.yml
├── models
├── seeds
├── macros
├── tests
```

**Explicación**

* `models/` contiene las transformaciones SQL.
* `seeds/` contiene los archivos CSV que se cargan en BigQuery.
* `dbt_project.yml` contiene la configuración principal del proyecto.

---

# 3. Verificar conexión con BigQuery

En la terminal ejecutar:

```bash
dbt debug
```

**Explicación**

Este comando verifica:

* conexión con BigQuery
* autenticación mediante Service Account
* configuración del archivo `profiles.yml`

**Mostrar**

Resultado:

```text
All checks passed
```

---

# 4. Cargar los datos iniciales (Seeds)

Ejecutar:

```bash
dbt seed
```

**Explicación**

Este comando carga los archivos CSV de la carpeta `seeds/` y crea tablas en BigQuery.

Tablas creadas:

```text
raw_customers_updated
raw_orders_updated
```

**Mostrar en BigQuery**

Dataset:

```text
exam_1
```

y las tablas creadas.

---

# 5. Mostrar el modelo de transformación

Abrir el archivo del modelo principal.

Ruta:

```text
models/example/my_first_dbt_model.sql
```

Mostrar el código:

```sql
{{ config(materialized='table') }}

SELECT
    customer_id AS id,
    name,
    country_code,
    city,
    customer_tier
FROM {{ ref('raw_customers_updated') }}
WHERE customer_id IS NOT NULL
```

**Explicación**

Este modelo realiza una transformación sobre la tabla de clientes:

* renombra la columna `customer_id` a `id`
* selecciona columnas relevantes del dataset
* elimina registros donde `customer_id` sea nulo

La tabla utilizada proviene del seed:

```text
raw_customers_updated
```

y se referencia usando:

```text
ref()
```

lo cual permite a DBT manejar las dependencias entre modelos.

---

# 6. Nota sobre la transformación

Esta transformación es **solo un ejemplo** y puede modificarse según las necesidades del análisis.

Por ejemplo, se podrían:

* agregar más columnas
* realizar joins con la tabla de órdenes
* crear métricas o agregaciones

El modelo DBT puede adaptarse fácilmente cambiando la consulta SQL.

---

# 7. Ejecutar las transformaciones

En la terminal ejecutar:

```bash
dbt run
```

**Explicación**

Este comando ejecuta los modelos definidos en la carpeta `models/` y crea las tablas o vistas correspondientes en BigQuery.

**Mostrar en la terminal**

```text
Finished running 1 table model, 1 view model
Completed successfully
```

---

# 8. Ver resultados en BigQuery

Ir a la consola de BigQuery.

Mostrar el dataset:

```text
exam_1
```

Tablas generadas:

```text
raw_customers_updated
raw_orders_updated
my_first_dbt_model
my_second_dbt_model
```

Ejecutar la consulta:

```sql
SELECT *
FROM `data-transformation-486715.exam_1.my_second_dbt_model`
```

**Explicación**

Esto muestra el resultado final de la transformación realizada por DBT.

---

# 9. Conclusión

**Narración sugerida**

> En este proyecto implementamos un pipeline de transformación de datos usando DBT y BigQuery.
> Primero cargamos datos con seeds, luego aplicamos transformaciones con modelos DBT y finalmente verificamos los resultados en BigQuery.

Esto demuestra un flujo completo de **ingeniería de datos utilizando DBT**.

---
