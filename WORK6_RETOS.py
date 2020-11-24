##### WORK 6: AGREGACIONES #####

#### RETO 1
# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
result = client['sample_airbnb']['listingsAndReviews'].aggregate([
    {
        '$match': {
            'property_type': 'House', 
            'bedrooms': {
                '$gte': 1
            }
        }
    }, {
        '$addFields': {
            'costo_recamara': {
                '$divide': [
                    '$price', '$bedrooms'
                ]
            }
        }
    }, {
        '$group': {
            '_id': '$address.country', 
            'recamaras': {
                '$sum': 1
            }, 
            'total': {
                '$sum': '$costo_recamara'
            }
        }
    }, {
        '$addFields': {
            'pais': '$_id', 
            'costo_promedio': {
                '$divide': [
                    '$total', '$recamaras'
                ]
            }
        }
    }, {
        '$project': {
            '_id': 0, 
            'pais': 1, 
            'costo_promedio': 1
        }
    }
])

#### RETO 2
# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://sam_sobrino:DPJMinS_987@clusterbedu.p2vjo.mongodb.net/test?authSource=admin&replicaSet=atlas-ti1tqg-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
result = client['sample_mflix']['comments'].aggregate([
    {
        '$lookup': {
            'from': 'users', 
            'localField': 'email', 
            'foreignField': 'email', 
            'as': 'usuario'
        }
    }, {
        '$addFields': {
            'usuario_object': {
                '$arrayElemAt': [
                    '$usuario', 0
                ]
            }
        }
    }, {
        '$addFields': {
            'usuario_password': '$usuario_objeto.password'
        }
    }, {
        '$project': {
            '_id': 0, 
            'name': 1, 
            'email': 1, 
            'usuario_password': 1
        }
    }
])