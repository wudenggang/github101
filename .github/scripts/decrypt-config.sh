#!/bin/bash

# 解密配置信息的脚本
# 使用方法: ./decrypt-config.sh [encrypted_data]

ENCRYPTED_DATA=$1

if [ -z "$ENCRYPTED_DATA" ]; then
    echo "错误: 未提供加密数据"
    exit 1
fi

# 解密数据
echo "$ENCRYPTED_DATA" | base64 -d > /tmp/decrypted-config.env

# 读取解密后的配置
source /tmp/decrypted-config.env

# 输出配置信息（供工作流使用）
echo "API_TOKEN=$API_TOKEN"
echo "API_URL=$API_URL"
echo "COURSE_ID=$COURSE_ID"

# 清理临时文件
rm /tmp/decrypted-config.env