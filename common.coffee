@co = require 'co'

@list = [20, 10, 30]

Start = new Date             

@log = log = (text)->
  console.log "[#{(new Date)-Start}] #{text}"

@delay = (ms)->
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
