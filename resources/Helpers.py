import bson

def get_unique_id():
    return  bson.objectid.ObjectId()