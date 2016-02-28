{list, log, delay} = require './common'

delay 1000
.then (i)->
  log "Resolved #{i}"
.then ->
  list.map delay
  .reduce (x, p)->
    x
    .then ->
      p
    .then (n)->
      log "Chapter #{n}"
  , Promise.resolve()
.catch (err)->
  log "Failed: #{err}"
.then ->
   log "That's all folks!"
