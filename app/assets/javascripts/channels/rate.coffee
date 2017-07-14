App.rate = App.cable.subscriptions.create "RateChannel",
  connected: ->
    console.log('connected')
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    rateApp.rate = data.message.rate
