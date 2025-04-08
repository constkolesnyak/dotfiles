alias click='source $(gpath)/.env ; clickhouse'
alias clicki='click client --host $CLICKHOUSE_HOST --secure --password $CLICKHOUSE_PASSWORD'
alias clickf='click client --host $CLICKHOUSE_HOST --secure --password $CLICKHOUSE_PASSWORD\
              --format PrettyCompact --queries-file'
clickff() {clicki --queries-file $1 --format $2}

alias uvicont='$(pybin)/uvicorn vox_harbor.big_bot.services.controller:app --reload'
