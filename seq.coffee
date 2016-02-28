{log, delay} = require './common'

delay 1000
.then (i)->
  log "Resolved #{i}"
.then ->
  x = Promise.resolve()
  [20, 10, 30].forEach (n)->
    x = x
    .then ->
      delay n
    .then (n)->
      log "Chapter #{n}"
  x
.catch (err)->
  log "Failed: #{err}"
.then ->
   log "That's all folks!"
