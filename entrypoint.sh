#!/bin/sh

set -e

if [ -z "$INPUT_FILE" ]
then
  echo "Must specify INPUT_FILE env var"
  exit 1
fi

if [ -z "$INPUT_OUTPUT_DIR" ]
then
  OUTPUT_DIR_ARG=""
else
  OUTPUT_DIR_ARG="-m $INPUT_OUTPUT_DIR"
fi

if [ -z "$INPUT_PLAINTEXT" ]
then
  PLAINTEXT_ARG=""
else
  PLAINTEXT_ARG="-S"
fi

if [ -z "$INPUT_PARAMS" ]
then
  EXTERNAL_PARAMS_ARG=""
else
  INPUT_PARAMS=$(echo $INPUT_PARAMS | sed 's/[,;]/ /g')
  EXTERNAL_PARAMS_ARG=""
  for PARAM in $INPUT_PARAMS
  do
    EXTERNAL_PARAMS_ARG="$EXTERNAL_PARAMS_ARG --ext-str $PARAM"
  done
fi

if [ -z "$INPUT_OUTPUT_FILE" ]
then
  echo "Running jsonnet $OUTPUT_DIR_ARG $PLAINTEXT_ARG $INPUT_FILE"
  jsonnet $EXTERNAL_PARAMS_ARG $OUTPUT_DIR_ARG $PLAINTEXT_ARG $INPUT_FILE
else
  echo "Running jsonnet $OUTPUT_DIR_ARG $PLAINTEXT_ARG $INPUT_FILE > $INPUT_OUTPUT_FILE"
  OUTPUT=$(jsonnet $EXTERNAL_PARAMS_ARG $OUTPUT_DIR_ARG $PLAINTEXT_ARG $INPUT_FILE)
  echo "$OUTPUT" > $INPUT_OUTPUT_FILE
fi
