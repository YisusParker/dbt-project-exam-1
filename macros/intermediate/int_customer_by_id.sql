select
    id_cliente,
    nombre,
    pais,
    ciudad,
    clase
from {{ ref('stg_customers') }}
where id = 1