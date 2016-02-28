co = require 'co'

Start = 0
do Reset = -> Start = new Date             

log = (text)->
  console.log "[#{(new Date)-Start}] #{text}"

delay = (ms)->
  new Promise (ok, fail)->
    log "Started timer for #{ms}"
    setTimeout ->
      if 666!=ms
        log "Elapsed: #{ms}"
        ok ms
      else
        log "Oops: #{ms}"
        fail Error "Waiting for #{ms}"
    , ms

co ->
  log "Resolved #{yield delay 1000}"

  for p in [20, 10, 30]
    log "Chapter #{yield delay p}"

  0
.catch (err)->
  log "ERR #{err}"
.then ->
  log "That's all folks!"