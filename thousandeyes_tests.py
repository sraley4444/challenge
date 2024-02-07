import requests, json

user = open('./secret_user.txt').read()

basic_token = open('./secret_token.txt').read()

url = 'https://api.thousandeyes.com/v6'

basic_req = requests.get(url + '/tests.json', auth=(user, basic_token))

data = json.loads(basic_req.text)

if __name__ == '__main__':
    print(data)