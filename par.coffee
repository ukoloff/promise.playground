{log, delay} = require './common'

delay 1000
.then (i)->
  log "Resolved #{i}"
.then ->
  Promise.all [20, 10, 30].map delay
  .then (ns)->
    ns.forEach (n)->
      log "Chapter #{n}"
.catch (err)->
  log "Failed: #{err}"
.then ->
   log "That's all folks!"
