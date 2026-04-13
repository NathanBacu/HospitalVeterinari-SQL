# 🏥 Hospital Veterinari - Base de Datos SQL

Proyecto de diseño y desarrollo de una base de datos relacional para la gestión integral de un hospital veterinario. Este repositorio contiene el esquema lógico, las restricciones de integridad y el diagrama Entidad-Relación generado.

## 📊 Diagrama Entidad-Relación (E-R)
El esquema ha sido validado y extraído mediante ingeniería inversa con **DBeaver**:

![Diagrama E-R](HospitalVeterinariE-R.png)

## 🛠️ Características Técnicas
El script SQL implementa los siguientes conceptos avanzados de bases de datos:
* **Relaciones Reflexivas:** Gestión de jerarquías de supervisión en la tabla `Veterinario`.
* **Entidades Asociativas:** Resolución de relaciones N:M entre `Medicament` y `Tractament`, y en la gestión de visitas.
* **Integridad Referencial:** Uso de `FOREIGN KEY` con políticas `ON DELETE CASCADE` y `ON DELETE SET NULL` para mantener la consistencia.
* **Claves Primarias Compuestas:** Implementadas en tablas intermedias para asegurar la unicidad de los registros.
* **Estandarización:** Uso del motor `InnoDB` y codificación `utf8mb4_spanish_ci`.

## 📂 Archivos
* `HospitalVeterinari.sql`: Script completo de MariaDB con la estructura de todas las tablas.
* `image_0cf744.png`: Diagrama visual del modelo relacional.
