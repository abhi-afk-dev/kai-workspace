FROM python:3.11-slim
RUN pip install --no-cache-dir workspace-mcp==2.1.2
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]