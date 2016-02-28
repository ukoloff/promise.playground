{list, log, delay, co} = require './common'

co ->
  log "Resolved #{yield delay 1000}"

  for n in yield list.map delay
    log "Chapter #{n}"

  0
.catch (err)->
  log "ERR #{err}"
.then ->
  log "That's all folks!"
