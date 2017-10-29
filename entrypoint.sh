#!/bin/bash
cd /app

set -e
run_cmd="dotnet run -c Debug"
exec $run_cmd