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


for LOG_FILE in $LOG_FILES; do
    echo -e "\n"
    echo "==========================================="
    echo "$LOG_FILE"
    echo "==========================================="
    for PATTERN in ${ERROR_PATTERNS[@]}; do 
    # [@] => Array subscript - meaning each element remains in separate entity
    # ${ERROR_PATTERNS[*]} => How to iterate through array elements. Meaning expand all elements into one big string
    # ${ERROR_PATTERNS[@]} => Expands each element as a separate word

        echo -e "\nSearching $PATTERN log in $LOG_FILE file"
        grep "$PATTERN" "$LOG_FILE" #$LOG_DIR/$APP_LOG_FILE -> We dont need to pass this as the for loop witll pick up each file name

        echo -e "\nNumber of $PATTERN logs found in $LOG_FILE file"
        grep -c "$PATTERN" "$LOG_FILE"

    done
done

echo -e "\n==========================================="
echo "          END OF REPORT"
echo "==========================================="