You can set the Terraform log level and location via the TF_LOG and TF_LOG_PATH environment variables.

The environment variable TF_LOG defines the log level. Valid log levels are (in order of increasing verbosity): TRACE, DEBUG, INFO, WARN or ERROR.

Setting TF_LOG to JSON outputs logs at the TRACE level or higher, and uses a parseable JSON encoding as the formatting.

LINUX:

export TF_LOG_PATH=/tmp/crash.log

export TF_LOG=TRACE

POWERSHELL:

$env:TF_LOG="TRACE"

$env:TF_LOG_PATH=/tmp/crash.log
