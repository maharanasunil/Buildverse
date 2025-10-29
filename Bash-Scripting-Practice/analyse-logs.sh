LOG_DIR="/d/Buildverse/Bash-Scripting-Practice/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "==========================================="
echo "        LOG ANALYSIS REPORT"
echo "==========================================="

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1) # Syntax for command substitution
echo $LOG_FILES

echo -e "\nSearching ERROR log in application.log"
grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of ERROR logs found in application.log"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"
echo -e "\nNumber of FATAL logs found in application.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL logs found in system.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$SYS_LOG_FILE" 
echo -e "\nNumber of CRITICAL logs found in system.log"
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE" 

echo -e "\nSearching CRITICAL log in system.log"
grep "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE" 

echo -e "\n==========================================="
echo "          END OF REPORT"
echo "==========================================="