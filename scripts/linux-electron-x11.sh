#!/usr/bin/env sh
set -eu
if [ -n "${DSH_WHALE_ELECTRON_BIN:-}" ]; then
  electron_bin=$DSH_WHALE_ELECTRON_BIN
elif command -v electron44 >/dev/null 2>&1; then
  electron_bin=$(command -v electron44)
elif command -v electron >/dev/null 2>&1; then
  electron_bin=$(command -v electron)
else
  echo 'No Electron binary found; set DSH_WHALE_ELECTRON_BIN.' >&2
  exit 127
fi
exec "$electron_bin" --ozone-platform=x11 "$@"
