#!/bin/bash
# Mahjong Tracker Management Script

APP_DIR="/home/ec2-user/mahjong_tracker"
LOG_FILE="/tmp/mahjong_app.log"

case "$1" in
    start)
        echo "Starting Mahjong Tracker..."
        cd $APP_DIR && python3 app.py > $LOG_FILE 2>&1 &
        sleep 2
        if netstat -tuln | grep -q 5000; then
            echo "✓ App started successfully on port 5000"
            echo "View logs: tail -f $LOG_FILE"
        else
            echo "✗ Failed to start app. Check logs: cat $LOG_FILE"
        fi
        ;;
    stop)
        echo "Stopping Mahjong Tracker..."
        pkill -f "python3 app.py"
        sleep 1
        if ! netstat -tuln | grep -q 5000; then
            echo "✓ App stopped successfully"
        else
            echo "✗ App may still be running"
        fi
        ;;
    restart)
        echo "Restarting Mahjong Tracker..."
        $0 stop
        sleep 1
        $0 start
        ;;
    status)
        if netstat -tuln | grep -q 5000; then
            echo "✓ App is running on port 5000"
            ps aux | grep "python3 app.py" | grep -v grep
        else
            echo "✗ App is not running"
        fi
        ;;
    logs)
        tail -f $LOG_FILE
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status|logs}"
        echo ""
        echo "Commands:"
        echo "  start   - Start the app"
        echo "  stop    - Stop the app"
        echo "  restart - Restart the app"
        echo "  status  - Check if app is running"
        echo "  logs    - View app logs (Ctrl+C to exit)"
        exit 1
        ;;
esac

exit 0

