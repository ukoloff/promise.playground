{log, delay} = require './common'

delay 1000
.then (i)->
  log "Resolved #{i}"
.then ->
  [20, 10, 30].reduce (x, n)->
    x
    .then ->
      delay n
    .then (n)->
      log "Chapter #{n}"
  , Promise.resolve()
.catch (err)->
  log "Failed: #{err}"
.then ->
   log "That's all folks!"
