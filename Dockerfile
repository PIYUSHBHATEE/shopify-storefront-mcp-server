FROM python:3.11-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY shopify_storefront_mcp_server/ ./shopify_storefront_mcp_server/
COPY shopify_storefront_mcp_server.py .

# Set environment variables
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# Expose port (if needed for MCP server)
EXPOSE 8000

# Run the MCP server
CMD ["python", "shopify_storefront_mcp_server.py"]
