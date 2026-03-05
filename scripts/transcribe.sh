#!/usr/bin/env bash
#
# transcribe.sh — Transcribe audio files using the Nexara API
#
# Usage:
#   ./scripts/transcribe.sh <audio_file> [audio_file ...]
#   ./scripts/transcribe.sh --dir <directory>
#
# Options:
#   --dir <path>      Transcribe all audio files in a directory
#   --out-dir <path>  Save transcripts here (default: same folder as source)
#   --diarize         Speaker diarization mode (requires jq)
#   --lang <code>     Language hint, e.g. ru or en
#
# Environment:
#   NEXARA_API_KEY    Required. Your Nexara API key.
#
# Supported formats: mp3 wav m4a flac ogg opus mp4 mov avi mkv
#
# Output: saves a .md file next to each audio file (or in --out-dir).

set -euo pipefail

API_URL="https://api.nexara.ru/api/v1/audio/transcriptions"
SUPPORTED_EXT="mp3 wav m4a flac ogg opus mp4 mov avi mkv"

# --- helpers ---

die() { echo "Error: $*" >&2; exit 1; }

NEXARA_API_KEY="${NEXARA_API_KEY:-nx-Iux3AjSO7EBZR9pA73wNv3qT}"

check_api_key() {
  [[ -n "${NEXARA_API_KEY:-}" ]] || die "NEXARA_API_KEY is not set.\nSet it with: export NEXARA_API_KEY=your_key_here"
}

is_audio() {
  local ext="${1##*.}"
  ext="$(echo "$ext" | tr '[:upper:]' '[:lower:]')"
  [[ " $SUPPORTED_EXT " == *" $ext "* ]]
}

out_path() {
  local src="$1"
  local out_dir="${2:-}"
  local stem="${src%.*}"
  local base
  base="$(basename "$stem")"
  if [[ -n "$out_dir" ]]; then
    echo "${out_dir}/${base}.md"
  else
    echo "${stem}.md"
  fi
}

transcribe_file() {
  local file="$1"
  local out="$2"
  local diarize="${3:-false}"
  local lang="${4:-}"

  echo "  Transcribing: $(basename "$file")"

  local extra_fields=()
  if [[ "$diarize" == "true" ]]; then
    extra_fields+=(-F "task=diarize" -F "diarization_setting=meeting")
  fi
  if [[ -n "$lang" ]]; then
    extra_fields+=(-F "language=$lang")
  fi

  local response
  response=$(curl --silent --show-error --fail \
    --request POST \
    --url "$API_URL" \
    --header "Authorization: Bearer $NEXARA_API_KEY" \
    -F "file=@${file}" \
    -F "response_format=text" \
    "${extra_fields[@]+"${extra_fields[@]}"}")

  {
    echo "# Транскрипция: $(basename "$file")"
    echo ""
    echo "$response"
    echo ""
  } > "$out"

  echo "  Saved: $out"
}

# --- argument parsing ---

FILES=()
DIR=""
OUT_DIR=""
DIARIZE="false"
LANG=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dir)    DIR="$2";     shift 2 ;;
    --out-dir) OUT_DIR="$2"; shift 2 ;;
    --diarize) DIARIZE="true"; shift ;;
    --lang)   LANG="$2";   shift 2 ;;
    --help|-h)
      sed -n '3,20p' "$0" | sed 's/^# //' | sed 's/^#//'
      exit 0
      ;;
    -*)       die "Unknown option: $1" ;;
    *)        FILES+=("$1"); shift ;;
  esac
done

check_api_key

# collect files from --dir
if [[ -n "$DIR" ]]; then
  [[ -d "$DIR" ]] || die "Directory not found: $DIR"
  while IFS= read -r f; do
    is_audio "$f" && FILES+=("$f")
  done < <(find "$DIR" -maxdepth 1 -type f | sort)
fi

[[ ${#FILES[@]} -gt 0 ]] || die "No audio files specified. Use --help for usage."

if [[ -n "$OUT_DIR" ]]; then
  mkdir -p "$OUT_DIR"
fi

# --- process ---

ERRORS=0
for file in "${FILES[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "File not found: $file" >&2
    ((ERRORS++))
    continue
  fi
  if ! is_audio "$file"; then
    echo "Skipping unsupported file: $(basename "$file")" >&2
    continue
  fi

  out=$(out_path "$file" "$OUT_DIR")
  if transcribe_file "$file" "$out" "$DIARIZE" "$LANG"; then
    :
  else
    echo "  Failed: $file" >&2
    ((ERRORS++))
  fi
done

if [[ $ERRORS -gt 0 ]]; then
  echo "$ERRORS file(s) failed." >&2
  exit 1
fi

echo "Done."
