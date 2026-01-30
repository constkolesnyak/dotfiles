alias click='echo "CLICKHOUSE_CLI_MODE=$CLICKHOUSE_CLI_MODE\n" && clickhouse client --secure --host $CLICKHOUSE_CLI_HOST --password $CLICKHOUSE_CLI_PASSWORD'
alias clickf='click --format PrettyCompact --queries-file'
alias clickq='click --query'

clickff() {
    click --queries-file $1 --format $2
}
