
# README - Migración de Datos a la Base de Datos

## Método Elegido

Para la migración de los datos, se eligió el siguiente flujo de trabajo:

1. **Conversión de datos a formato CSV**: Cada una de las hojas de Excel que contiene información para una tabla específica fue exportada como un archivo CSV. Este formato fue seleccionado debido a su compatibilidad con la mayoría de los sistemas de gestión de bases de datos (DBMS) y su simplicidad en el manejo de grandes cantidades de datos.

2. **Importación de archivos CSV a la base de datos SQL**: Los archivos CSV fueron cargados a las tablas correspondientes en la base de datos SQL, utilizando los comandos nativos de importación de datos que permiten una carga rápida y eficiente.

## Pasos de la Migración

### 1. Conversión de Hojas de Excel a Archivos CSV

- **Abrir archivo Excel**: Se abrió el archivo Excel que contiene las 7 hojas correspondientes a las tablas de la base de datos.
- **Guardar cada hoja como archivo CSV**: Cada hoja fue guardada como un archivo CSV utilizando la opción "Guardar como" de Excel:
  - Seleccionamos "CSV (delimitado por comas)" como formato de archivo.
  - Guardamos cada hoja como un archivo CSV separado con un nombre descriptivo.

### 2. Carga de Archivos CSV a la Base de Datos

Una vez que los archivos CSV fueron creados, se cargaron en las tablas de la base de datos utilizando los comandos SQL correspondientes.

#### Para MySQL:

Para importar los archivos CSV a MySQL, se utilizó el siguiente comando:

```sql
LOAD DATA INFILE 'C:/ruta/a/tu/archivo.csv'
INTO TABLE nombre_de_tu_tabla
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 2 LINES
(columna1, columna2, columna3, ...);
```

Este comando cargó cada archivo CSV a la tabla correspondiente. Se utilizó la opción `IGNORE 2 LINES` para omitir laa primera 2 línea (que contiene los encabezados de columna) de los archivos CSV.


### 3. Verificación de la Migración

Después de completar la importación de los datos, se verificó la correcta migración de los registros mediante consultas `SELECT`:

```sql
SELECT COUNT(*) FROM nombre_de_tu_tabla;
```

Esto nos permitió confirmar que el número de registros importados coincida con los 138,123 registros en cada tabla.
