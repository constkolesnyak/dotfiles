alias click='echo "CLICKHOUSE_CLI_MODE=$CLICKHOUSE_CLI_MODE\n" && clickhouse'
alias clicki='click client --host $CLICKHOUSE_CLI_HOST --secure --password $CLICKHOUSE_CLI_PASSWORD'
alias clickf='click client --host $CLICKHOUSE_CLI_HOST --secure --password $CLICKHOUSE_CLI_PASSWORD\
              --format PrettyCompact --queries-file'

clickff() {
    clicki --queries-file $1 --format $2
}
