#!/bin/sh
set -e
mkdir -p "$WORKSPACE_MCP_CREDENTIALS_DIR"

# Seed the token file only if it isn't already on the volume,
# so a restart never overwrites refreshed tokens with stale ones.
TARGET="$WORKSPACE_MCP_CREDENTIALS_DIR/$GOOGLE_CREDS_FILENAME"
if [ -n "$GOOGLE_CREDS_B64" ] && [ ! -f "$TARGET" ]; then
  echo "$GOOGLE_CREDS_B64" | base64 -d > "$TARGET"
  echo "Seeded credentials into $TARGET"
fi

exec workspace-mcp --transport streamable-http --single-user --tool-tier core