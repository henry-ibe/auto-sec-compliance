#!/usr/bin/env bash
set -euo pipefail
: "${REGION:?Set REGION}"; : "${IID:?Set IID}"
DASH="Compliance-$IID"
FILE="cloudwatch/dashboards/compliance.json"
aws cloudwatch put-dashboard \
  --dashboard-name "$DASH" \
  --dashboard-body "$(cat "$FILE")" \
  --region "$REGION"
echo "Published $DASH from $FILE"
