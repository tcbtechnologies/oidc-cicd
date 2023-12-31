#!/bin/bash
curl -H "Content-Type: application/x-www-form-urlencoded" -d "access_token=$(gcloud auth application-default print-access-token)" https://www.googleapis.com/oauth2/v1/tokeninfo
