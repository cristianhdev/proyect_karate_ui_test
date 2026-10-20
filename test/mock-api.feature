@ignore
Feature: API mock

  Background:
    * def users = [ { "id":1, "name":"andres"},{ "id":2, "name":"pablo"}]

    # Enable CORS - browser needs this for cross-origin requests
    * configure cors = true

  Scenario: pathMatches('/users/{id}') && methodIs('get')
    * def user = users.find((item)=> item.id == pathParams.id )
    # pathParams.id contains the {id} from URL, e.g., /users/123 -> id = "123"
    * def response =  user ||  { error: "User not found"}
    * def responseStatus = user ? 200 : 404

  Scenario: pathMatches('/users') && methodIs('post')
    * def userNew = request
    * def userId = users.length+1
    * users.push(userNew)
    * def response = userNew
    * def responseStatus = 201

  Scenario: pathMatches('/users') && methodIs('get')
    * def response = users
    * def responseStatus = 200

  Scenario: pathMatches('/users/{id}') && methodIs('delete')
    * def userElement = users.find((item)=> item.id == pathParams.id )
    * karate.log(userElement)
    * def indexItem = users.findIndex((item)=> item.id == ~~(pathParams.id) )
    * if (userElement) users.splice(indexItem,1)
    * def response = userElement || { message: `User Id ${pathParams.id} not found`}
    * def responseStatus = userElement ? 204 : 404


  Scenario: pathMatches('/data')
    # Return data from a JSON file
    * def response = read('mock-data.json')
    * def token = ''

  Scenario:
     # Catch-all: returns 404 for any unmatched request
    * def response = { error: 'Endpoint not found' }
    * def responseStatus = 404

  Scenario: pathMatches('/protected') 
  * karate.log(requestHeaders)
  * def auth = requestHeaders
  * def token = if (auth.hasOwnProperty('authorization')) auth.authorization[0].trim().substring(6)
  * def responseToken = !auth.hasOwnProperty('authorization') ? {message: 'Lock User'} : { message: 'Authorized access' }
  * def response = responseToken