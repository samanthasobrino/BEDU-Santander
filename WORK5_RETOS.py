## RETO 1
#Propiedades que no permitan fiestas.
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'house_rules': re.compile(r"No Parties(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

#Propiedades que admitan mascotas.
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'house_rules': re.compile(r"Pets Allowed(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

#Propiedades que no permitan fumadores.
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'house_rules': re.compile(r"No Smoking(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

#Propiedades que no permitan fiestas ni fumadores.
client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'house_rules': re.compile(r"No Smoking|No Parties(?i)")
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

## RETO 2
# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={
    'number_of_reviews': {
        '$gte': 50
    }, 
    'review_scores.review_scores_rating': {
        '$gte': 80
    }, 
    'amenities': {
        '$in': [
            re.compile(r"ethernet(?i)")
        ]
    }, 
    'address.country_code': 'BR'
}

result = client['sample_airbnb']['listingsAndReviews'].find(
  filter=filter
)

## RETO 3
# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
result = client['sample_airbnb']['listingsAndReviews'].aggregate([
    {
        '$match': {
            'amenities': {
                '$in': [
                    'Internet', 'Wifi', 'Ethernet'
                ]
            }
        }
    }, {
        '$count': 'Número de casas con servicio de Internet'
    }
])