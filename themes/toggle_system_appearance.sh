#!/usr/bin/env bash
set -e -u -o pipefail

HELIX_CONFIG_PATH="${HOME}/go/src/github.com/voigt/dotfiles/helix"
HELIX_THEME_LIGHT="catppuccin_latte"
HELIX_THEME_DARK="catppuccin_frappe"

ZELLIX_CONFIG_PATH="${HOME}/.config/zellij/config.kdl"
ZELLIJ_THEME_LIGHT="catppuccin-latte"
ZELLIJ_THEME_DARK="catppuccin-frappe"

switch_helix_theme() {
  local theme=$1
  if [[ $theme == "light" ]]; then
    sed -i '' -E "s/^theme.*/theme = \"$HELIX_THEME_LIGHT\"/" "$HELIX_CONFIG_PATH"
  elif [[ $theme == "dark" ]]; then
    sed -i '' -E "s/^theme.*/theme = \"$HELIX_THEME_DARK\"/" "$HELIX_CONFIG_PATH"
  else
    echo "Error: Invalid theme '$theme'. Expected 'light' or 'dark'." >&2
    exit 1
  fi

  pkill -USR1 hx || true
}

switch_zellij_theme() {
  local theme=$1
  if [[ $theme == "light" ]]; then
    sed -i '' -E "s/^theme .*/theme \"$ZELLIJ_THEME_LIGHT\"/" "$ZELLIX_CONFIG_PATH"
  elif [[ $theme == "dark" ]]; then
    sed -i '' -E "s/^theme .*/theme \"$ZELLIJ_THEME_DARK\"/" "$ZELLIX_CONFIG_PATH"
  else
    echo "Error: Invalid theme '$theme'. Expected 'light' or 'dark'." >&2
    exit 1
  fi
}

if [[ $# -eq 0 ]]; then
  echo "Error: Missing theme argument." >&2
  exit 1
fi

GHOSTTY_CONFIG_PATH="${HOME}/go/src/github.com/voigt/dotfiles/ghostty"
GHOSTTY_THEME_LIGHT="catppuccin-latte"
GHOSTTY_THEME_DARK="catppuccin-frappe"

switch_ghostty_theme() {
  local theme=$1
  if [[ $theme == "light" ]]; then
    sed -i '' -E "s/^theme = .*/theme = \"dark:$GHOSTTY_THEME_DARK,light:$GHOSTTY_THEME_LIGHT\"/" "$GHOSTTY_CONFIG_PATH"
  elif [[ $theme == "dark" ]]; then
    sed -i '' -E "s/^theme = .*/theme = \"dark:$GHOSTTY_THEME_DARK,light:$GHOSTTY_THEME_LIGHT\"/" "$GHOSTTY_CONFIG_PATH"
  else
    echo "Error: Invalid theme '$theme'. Expected 'light' or 'dark'." >&2
    exit 1
  fi

  pkill -USR1 hx || true
}

switch_ghostty_theme "$1"
switch_helix_theme "$1"
switch_zellij_theme "$1"
