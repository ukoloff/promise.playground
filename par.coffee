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
  Promise.all [20, 10, 30].map delay
  .then (ns)->
    ns.forEach (n)->
      log "Chapter #{n}"
.catch (err)->
  log "Failed: #{err}"
.then ->
   log "That's all folks!"
