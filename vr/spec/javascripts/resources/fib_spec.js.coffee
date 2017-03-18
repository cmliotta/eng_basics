#= require angular
#= require resources/fib
#= require angular-mocks

describe 'Fib', ->
  $httpBackend = undefined
  Fib = undefined
  serviceResult = undefined

  beforeEach ->
    module("VR")

  beforeEach inject (_$httpBackend_, _Fib_)->
    $httpBackend = _$httpBackend_
    Fib = _Fib_

  describe '.all', ->
    fib = {id: 1, name: 'fib'}
    fibTwo = {id: 2, name: 'fibsTwo'}

    beforeEach ->
      $httpBackend.expect('GET', '/api/fibs').respond([fib, fibTwo])
      Fib.all().then (result)->
        serviceResult = result.data
      $httpBackend.flush()
      @serviceResult = serviceResult

    it 'responds with fib array', ->
      expect(@serviceResult[0].id).toEqual(fib.id)
      expect(@serviceResult[0].name).toEqual(fib.name)
      expect(@serviceResult[1].id).toEqual(fibTwo.id)
      expect(@serviceResult[1].name).toEqual(fibTwo.name)

  describe '.get', ->
    fib = {id: 1, name: 'fib'}

    beforeEach ->
      $httpBackend.expect('GET', '/api/fibs/' + fib.id).respond(fib)
      Fib.get(fib.id).then (result)->
        serviceResult = result.data
      $httpBackend.flush()
      @serviceResult = serviceResult

    it 'responds with fib object', ->
      expect(@serviceResult.id).toEqual(fib.id)
      expect(@serviceResult.name).toEqual(fib.name)

  describe '.create', ->
    params = {name: 'new fib'}
    fib = {id: 1, name: 'new fib'}

    beforeEach ->
      $httpBackend.expect('POST', '/api/fibs').respond(fib)
      Fib.create(params).then (result)->
        serviceResult = result.data
      $httpBackend.flush()
      @serviceResult = serviceResult

    it 'responds with created fib object', ->
      expect(@serviceResult.name).toEqual(fib.name)

  describe '.update', ->
    fib = {id: 1, name: 'fib'}
    params = {name: 'new name'}
    updatedFib = {id: 1, name: 'new name'}

    beforeEach ->
      $httpBackend.expect('PUT', '/api/fibs/' + fib.id).respond(updatedFib)
      Fib.update(fib.id, params).then (result)->
        serviceResult = result.data
      $httpBackend.flush()
      @serviceResult = serviceResult

    it 'responds with updated fib object', ->
      expect(@serviceResult.id).toEqual(updatedFib.id)
      expect(@serviceResult.name).toEqual(updatedFib.name)

  describe '.destroy', ->
    fib = {id: 1, name: 'fib'}

    beforeEach ->
      $httpBackend.expect('DELETE', '/api/fibs/' + fib.id).respond(fib)
      Fib.destroy(fib.id).then (result)->
        serviceResult = result.data
      $httpBackend.flush()
      @serviceResult = serviceResult

    it 'responds with successfully destroyed fib', ->
      expect(@serviceResult.id).toEqual(fib.id)
      expect(@serviceResult.name).toEqual(fib.name)
