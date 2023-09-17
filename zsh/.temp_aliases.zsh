alias click='clickhouse'
alias clicki='clickhouse client --host $CLICKHOUSE_HOST --secure --password $CLICKHOUSE_PASSWORD'
alias clickf='clickhouse client --host $CLICKHOUSE_HOST --secure --password $CLICKHOUSE_PASSWORD\
              --format PrettyCompact --queries-file'
clickff() {clicki --queries-file $1 --format $2}

alias uvicont='$(pybin)/uvicorn vox_harbor.big_bot.services.controller:app --reload'
