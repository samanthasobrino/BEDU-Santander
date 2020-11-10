# Requires the PyMongo package.
# https://api.mongodb.com/python/current

##### RETO 1

#Fecha, nombre y texto de cada comentario.
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'date': 1, 
    'name': 1, 
    'text': 1
}

result = client['sample_mflix']['comments'].find(
  filter=filter,
  projection=project
)


#Título, elenco y año de cada película.
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1, 
    'cast': 1, 
    'year': 1
}

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project
)

#Nombre y contraseña de cada usuario.
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'name': 1, 
    'password': 1
}

result = client['sample_mflix']['users'].find(
  filter=filter,
  projection=project
)

##### RETO 2
#¿Qué comentarios ha hecho Greg Powell?
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'name': 'Greg Powell'
}

result = client['sample_mflix']['comments'].find(
  filter=filter
)

#¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    '$or': [
        {
            'name': 'Greg Powell'
        }, {
            'name': 'Mercedes Tyler'
        }
    ]
}

result = client['sample_mflix']['comments'].find(
  filter=filter
)

#¿Cuál es el máximo número de comentarios en una película?
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'num_mflix_comments': 1
}
sort=list({
    'num_mflix_comments': -1
}.items())
limit=1

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project,
  sort=sort,
  limit=limit
)

#¿Cuál es título de las cinco películas más comentadas?
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1
}
sort=list({
    'num_mflix_comments': -1
}.items())
limit=5

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project,
  sort=sort,
  limit=limit
)