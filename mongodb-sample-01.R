library(RMongo)
library(dplyr)

# cards = new Schema({
#  pregunta: String,
#  media: [{ type: Schema.Types.ObjectId, ref: 'Media'}],
#  respostes: [{sText:String, bTrue: Boolean}],
#  tags: [{ type: Schema.Types.ObjectId, ref: 'Tag'}],
#  estat: Number,
#  insert_date: { type: Date, default: Date.now },
#  uploader: String
# })

# parametros para la conexión
server <- "atlas.uic.es"
port <- 27017
db <- "derma"

# conectamos con la db de mongodb ...
mg <- mongoDbConnect(db, server, port)

# ver que colecciones hay disponibles ...
print(dbShowCollections(mg))

# seleccionar todas las cards cuyo estat > 0 (limitamos a 3 la salida)
#query <- dbGetQuery(mg, 'cards', "{'estat': {'$gt' : 0}}", skip=0, limit=3)

# seleccionar toda la coleccion de cards
query <- dbGetQuery(mg, 'cards', "{}")

# obtener solo el campo preguntas ...
pregs <- select(query, pregunta)

# mostrar resultados
print(pregs)

# desconexion con mongo
dbDisconnect(mg)
