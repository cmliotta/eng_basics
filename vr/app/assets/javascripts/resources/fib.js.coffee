angular.module("VR").factory "Fib", [
  "$http"
  ($http)->
    urlBase = '/api/fibs'

    all: (params)->
      $http.get(urlBase, params)

    get: (id)->
      $http.get(urlBase + '/' + id)

    create: (params)->
      $http.post(urlBase, params)

    update: (id, params)->
      $http.put(urlBase + '/' + id, params)

    destroy: (id)->
      $http.delete(urlBase + '/' + id)
]
