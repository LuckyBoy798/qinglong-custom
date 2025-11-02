FROM whyour/qinglong:latest
LABEL "language"="docker"
ENV QlBaseUrl="/"
ENV QlPort="5700"

# 创建启动脚本
RUN mkdir -p /ql/scripts && cat > /ql/scripts/init.sh << 'EOF'
#!/bin/bash
# 后台执行依赖安装
bash -c "$(curl -fsSL https://raw.githubusercontent.com/FlechazoPh/QLDependency/main/Shell/QLOneKeyDependency.sh)" &
# 启动青龙面板
node /ql/dist/index.js
EOF
RUN chmod +x /ql/scripts/init.sh
EXPOSE 5700
CMD ["/bin/bash", "/ql/scripts/init.sh"]
