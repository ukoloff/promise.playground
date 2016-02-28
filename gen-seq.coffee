{log, delay, co} = require './common'

co ->
  log "Resolved #{yield delay 1000}"

  for p in [20, 10, 30]
    log "Chapter #{yield delay p}"

  0
.catch (err)->
  log "ERR #{err}"
.then ->
  log "That's all folks!"
