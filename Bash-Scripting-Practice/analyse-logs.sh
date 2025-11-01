LOG_DIR="/d/Buildverse/Bash-Scripting-Practice/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

REPORT_FILE="/d/Buildverse/Bash-Scripting-Practice/logs/log_analysis_report.txt"

echo "===========================================" >> "$REPORT_FILE"
echo "        LOG ANALYSIS REPORT" >> "$REPORT_FILE"
echo "===========================================" >> "$REPORT_FILE"

echo -e "\nList of log files updated in last 24 hours" >> "$REPORT_FILE"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1) # Syntax for command substitution
echo $LOG_FILES >> "$REPORT_FILE"


for LOG_FILE in $LOG_FILES; do
    echo -e "\n" >> "$REPORT_FILE"
    echo "===========================================" >> "$REPORT_FILE"
    echo "$LOG_FILE" >> "$REPORT_FILE"
    echo "===========================================" >> "$REPORT_FILE"
    for PATTERN in ${ERROR_PATTERNS[@]}; do 
    # [@] =>> Array subscript - meaning each element remains in separate entity
    # ${ERROR_PATTERNS[*]} =>> How to iterate through array elements. Meaning expand all elements into one big string
    # ${ERROR_PATTERNS[@]} =>> Expands each element as a separate word

        echo -e "\nSearching $PATTERN log in $LOG_FILE file" >> "$REPORT_FILE"
        grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE" #$LOG_DIR/$APP_LOG_FILE ->> We dont need to pass this as the for loop witll pick up each file name

        echo -e "\nNumber of $PATTERN logs found in $LOG_FILE file" >> "$REPORT_FILE"
        # grep -c "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

        # If we have error count more then 4 then we get alert!
        ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
        echo $ERROR_COUNT >> "$REPORT_FILE"

        if [ "$ERROR_COUNT" -gt 4 ]; then
            echo -e "\n !! Action Required: Too many $PATTERN issues in log file $LOG_FILE !!"
        fi
    done
done

echo -e "\n===========================================" >> "$REPORT_FILE"
echo "          END OF REPORT" >> "$REPORT_FILE"
echo "===========================================" >> "$REPORT_FILE"

echo -e "\nLog Analysis completed and report saved in: $REPORT_FILE"