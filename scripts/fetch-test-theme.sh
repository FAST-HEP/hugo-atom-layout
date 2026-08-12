#!/usr/bin/env bash
set -euo pipefail

REPOSITORY_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
THEMES_DIR="${REPOSITORY_ROOT}/.build/themes"

THEME_NAME="scientific-python-hugo-theme"
THEME_URL="https://github.com/scientific-python/scientific-python-hugo-theme.git"
THEME_REVISION="${SCIENTIFIC_PYTHON_THEME_REVISION:-main}"
THEME_DIR="${THEMES_DIR}/${THEME_NAME}"

LAYOUT_NAME="hugo-atom-layout"
LAYOUT_LINK="${THEMES_DIR}/${LAYOUT_NAME}"

mkdir -p "${THEMES_DIR}"

if [[ ! -d "${THEME_DIR}/.git" ]]; then
    git clone \
        --no-checkout \
        "${THEME_URL}" \
        "${THEME_DIR}"
fi

git -C "${THEME_DIR}" fetch \
    --depth 1 \
    origin \
    "${THEME_REVISION}"

git -C "${THEME_DIR}" checkout \
    --detach \
    FETCH_HEAD

if [[ -e "${LAYOUT_LINK}" && ! -L "${LAYOUT_LINK}" ]]; then
    echo "Refusing to replace non-symlink path: ${LAYOUT_LINK}" >&2
    exit 1
fi

ln -sfn "${REPOSITORY_ROOT}" "${LAYOUT_LINK}"
