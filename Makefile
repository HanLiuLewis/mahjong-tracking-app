.PHONY: start stop restart status logs clean help

# Default target - start the app
all: start

# Start the application
start:
	@echo "Starting Mahjong Tracker..."
	@python3 app.py > /tmp/mahjong_app.log 2>&1 & echo $$! > /tmp/mahjong_app.pid
	@sleep 2
	@if netstat -tuln | grep -q 5000; then \
		echo "✓ App started successfully on port 5000"; \
		echo "  Access at: http://54.227.29.19:5000"; \
		echo "  View logs: make logs"; \
	else \
		echo "✗ Failed to start app. Check logs: cat /tmp/mahjong_app.log"; \
	fi

# Stop the application
stop:
	@echo "Stopping Mahjong Tracker..."
	@pkill -f "python3 app.py" || echo "App was not running"
	@rm -f /tmp/mahjong_app.pid
	@sleep 1
	@if ! netstat -tuln | grep -q 5000; then \
		echo "✓ App stopped successfully"; \
	else \
		echo "⚠ App may still be running, trying force kill..."; \
		pkill -9 -f "python3 app.py"; \
	fi

# Restart the application
restart: stop start

# Check application status
status:
	@if netstat -tuln | grep -q 5000; then \
		echo "✓ App is running on port 5000"; \
		ps aux | grep "python3 app.py" | grep -v grep; \
	else \
		echo "✗ App is not running"; \
	fi

# View application logs
logs:
	@tail -f /tmp/mahjong_app.log

# Clean up database (WARNING: deletes all data!)
clean:
	@echo "⚠️  WARNING: This will delete all game data!"
	@read -p "Are you sure? (y/N) " -n 1 -r; \
	echo; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		rm -f mahjong.db; \
		echo "✓ Database deleted"; \
	else \
		echo "Cancelled"; \
	fi

# Show help
help:
	@echo "Mahjong Tracker - Available Commands:"
	@echo ""
	@echo "  make          - Start the application (default)"
	@echo "  make start    - Start the application"
	@echo "  make stop     - Stop the application"
	@echo "  make restart  - Restart the application"
	@echo "  make status   - Check if application is running"
	@echo "  make logs     - View application logs (Ctrl+C to exit)"
	@echo "  make clean    - Delete database (removes all data!)"
	@echo "  make help     - Show this help message"
	@echo ""
	@echo "Access your app at: http://54.227.29.19:5000"

