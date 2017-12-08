library(RMySQL)

# creamos una conexión a la base de datos
con <- dbConnect(MySQL(), user='root', password='XXXX', dbname='pruebas', host='localhost')

# lista de tablas en la conexión
dbListTables(con)

# lectura de los datos
datos <- read.csv2("../dat/RPT_NOV_2017.csv", fileEncoding = "latin1")

# los subimos
dbWriteTable(con, value = datos, name = "ayto_madrid")

# no nos gustan y los borramos
dbSendQuery(con, "drop table ayto_madrid;")

# renombramos las columnas
colnames(datos) <- c("fecha", "cod_unidad", "desc_unidad", "area", "coordinacion", "direccion_gral",
                     "cod_unidad_puesto", "desc_unidad_puesto", "cod_puesto", "desc_puesto",
                     "nivel_complemento", "complemento_especifico", "dotacion", "forma_provision",
                     "tipo_puesto", "admon_procedencia", "grupo", "cod_escala",
                     "cod_subescala", "cod_especialidad", "requisitos", "observaciones",
                     "nombre", "vinculacion")

datos$complemento_especifico <- gsub("\\.", "", datos$complemento_especifico)
datos$complemento_especifico <- gsub(",", ".", datos$complemento_especifico)
datos$complemento_especifico <- as.numeric(datos$complemento_especifico)

# los subimos
dbWriteTable(con, value = datos, name = "ayto_madrid")

# queries sobre la base de datos

res <- dbGetQuery(con, "select * from ayto_madrid order by complemento_especifico desc limit 100")

