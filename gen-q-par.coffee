{list, log, delay, co} = require './common'

co ->
  log "Resolved #{yield delay 1000}"

  for p in list.map delay
    log "Chapter #{yield p}"

  0
.catch (err)->
  log "ERR #{err}"
.then ->
  log "That's all folks!"
