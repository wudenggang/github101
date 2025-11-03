#!/bin/bash

# 加密配置信息的脚本
# 使用方法: ./encrypt-config.sh

# 敏感信息
API_TOKEN="e3619ccddafc47589bbe788ca31a2df0"
API_URL="https://api.opencamp.cn/web/api/courseRank/createByThirdToken"
COURSE_ID="1948"

# 创建临时文件存储敏感信息
echo "API_TOKEN=$API_TOKEN" > /tmp/sensitive.env
echo "API_URL=$API_URL" >> /tmp/sensitive.env
echo "COURSE_ID=$COURSE_ID" >> /tmp/sensitive.env

# 使用base64加密
ENCRYPTED_DATA=$(base64 -w 0 /tmp/sensitive.env)

# 输出加密后的数据（实际使用中会存储在安全位置）
echo "ENCRYPTED_CONFIG=$ENCRYPTED_DATA" > /tmp/encrypted-config.txt

# 清理临时文件
rm /tmp/sensitive.env

echo "配置信息已加密完成"
echo "加密数据已保存到 /tmp/encrypted-config.txt"