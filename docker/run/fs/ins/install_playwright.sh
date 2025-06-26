#!/bin/bash
set -e

# activate venv
. "/ins/setup_venv.sh" "$@"

# install playwright if not installed (should be from requirements.txt)
uv pip install playwright

# set PW installation path to /a0/tmp/playwright
export PLAYWRIGHT_BROWSERS_PATH=/a0/tmp/playwright

# install chromium with dependencies
# for kali-based
if [ "$@" = "hacking" ]; then
    apt-get install -y fonts-unifont libnss3 libnspr4
    playwright install chromium-headless-shell
else
    # for debian based
    playwright install --with-deps chromium-headless-shell
fi

