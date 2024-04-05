#!/bin/bash

# 默认参数值
rpc="https://api.mainnet-beta.solana.com"
keypair="$HOME/.config/solana/id.json" # 修改这里
priority_fee=100
threads=4

# 解析命令行参数
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -r|--rpc) rpc="$2"; shift ;;
        -k|--keypair) keypair="$2"; shift ;;
        -p|--priority-fee) priority_fee="$2"; shift ;;
        -t|--threads) threads="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# 执行ore命令
while true; do
    ore \
        --rpc "$rpc" \
        --keypair "$keypair" \
        --priority-fee "$priority_fee" \
        mine \
        --threads "$threads"
done
