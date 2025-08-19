#!/bin/bash
# 祝日CSVをダウンロードしUTF-8で保存

set -e

URL="https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv"
OUT="syukujitsu.csv"

# 一時ファイル
TMPFILE=$(mktemp)

# ダウンロード
curl -fsSL "$URL" -o "$TMPFILE"

# 文字コード変換（BOM除去も含む）
iconv -f SHIFT_JIS -t UTF-8 "$TMPFILE" | sed '1s/^\xEF\xBB\xBF//' > "$OUT"

rm "$TMPFILE"

echo "ダウンロードとUTF-8変換が完了しました: $OUT"