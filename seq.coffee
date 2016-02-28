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
