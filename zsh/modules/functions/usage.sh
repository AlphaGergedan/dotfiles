# listing memory usage of an application (includes all running processes)
function usage() {
  local process_name="$1"
  echo $process_name
  ps -C $process_name -o %cpu,%mem --no-headers | awk '{cpu+=$1; mem+=$2} END {printf "CPU Usage:\t%.2f%%\nMemory Usage:\t%.2f%%\n", cpu, mem}'
}
