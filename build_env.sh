#!/usr/bin/env bash

function get_build_env() {
  local env=dev
  if [[ "$CIRCLE_BRANCH" =~ ^develop$ ]]; then
    env=dev
  elif [[ "$CIRCLE_BRANCH" =~ ^qa$ ]]; then
    env=qa
  elif [[ "$CIRCLE_BRANCH" =~ main$ ]]; then
    env=stage
  elif [[ "$CIRCLE_TAG" =~ [0-9]+(\.[0-9]+)* ]]; then
    env=prod
  fi

  echo "$env"
}

build_env=$(get_build_env)


echo export ENVIRONMENT="$build_env" >> $BASH_ENV
echo export REACT_APP_DEPLOY_ENV="$build_env" >> $BASH_ENV
