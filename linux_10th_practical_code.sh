#!/bin/bash

TEMPLATE="template.txt"
DATAFILE="data.csv"
OUTPUT_DIR="merged_mails"

# Create template.txt if it doesn't exist
if [ ! -f "$TEMPLATE" ]; then
cat <<EOT > "$TEMPLATE"
Subject: Welcome [NAME]!

Dear [NAME],

We are excited to welcome you to our service.

Please confirm your details:

Email: [EMAIL]

Address: [ADDRESS]

Thank you!

Support Team
EOT
echo "Created sample $TEMPLATE"
fi

# Create data.csv if it doesn't exist
if [ ! -f "$DATAFILE" ]; then
cat <<EOT > "$DATAFILE"
Name,Email,Address
Tanmay,tanmay@example.com,123 Nagpur
Samarth,samarth@example.com,456 Gondia
EOT
echo "Created sample $DATAFILE"
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Read the CSV file line by line (skip header)
tail -n +2 "$DATAFILE" | while IFS=',' read -r NAME EMAIL ADDRESS; do
    # Trim whitespace
    NAME=$(echo "$NAME" | xargs)
    EMAIL=$(echo "$EMAIL" | xargs)
    ADDRESS=$(echo "$ADDRESS" | xargs)

    # Read template and replace placeholders
    OUTPUT=$(<"$TEMPLATE")
    OUTPUT="${OUTPUT//\[NAME\]/$NAME}"
    OUTPUT="${OUTPUT//\[EMAIL\]/$EMAIL}"
    OUTPUT="${OUTPUT//\[ADDRESS\]/$ADDRESS}"

    # Create a safe filename
    SAFE_NAME=$(echo "$NAME" | tr -cd '[:alnum:]_')
    OUTPUT_FILE="$OUTPUT_DIR/mail_to_${SAFE_NAME}.txt"

    # Save to file
    echo "$OUTPUT" > "$OUTPUT_FILE"
    echo "Send mail to $NAME -> $OUTPUT_FILE"
done
