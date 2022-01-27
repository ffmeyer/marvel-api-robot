from faker import Faker
faker = Faker()


def factory_deadpool():
    return {
	"name": "wade",
	"aliases": "deadpool",
	"age": 40,
	"team": "x force",
	"active": True
}