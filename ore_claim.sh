#!/bin/bash

# 设置默认参数
default_rpc="https://api.mainnet-beta.solana.com"
keypair="$HOME/.config/solana/id.json" # 修改这里
rpc="$default_rpc"

# 解析命令行参数
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -k|--keypair) keypair="$2"; shift ;;
        -r|--rpc) rpc="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# 执行 ore 命令
while true; do
    ore \
        --keypair "$keypair" \
        --rpc "$rpc" \
        claim && echo "Claimed"
done
