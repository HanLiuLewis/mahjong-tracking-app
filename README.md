# 🀄 Mahjong Tracker

A mobile-friendly web application for tracking Mahjong game scores and calculating points based on standard scoring rules.

## Features

- **Add Games**: Record game results with 4 players and their scores
- **Automatic Point Calculation**: Calculates points based on rank and score differential
- **Game History**: View all past games with detailed results
- **Total Points Calculation**: Calculate total points across selected games
- **Player Management**: Add and remove players from your roster
- **Mobile-Optimized UI**: Beautiful, responsive design perfect for mobile devices

## Scoring Rules

The app uses the following scoring formula:
- **1st place**: +15 base points
- **2nd place**: +5 base points
- **3rd place**: -5 base points
- **4th place**: -15 base points
- **Score adjustment**: (score - 25000) / 1000

Final points = rank points + score adjustment

## Installation

### Prerequisites
- Python 3.x
- Flask
- SQLite3

### Setup

1. Clone the repository:
```bash
git clone https://github.com/HanLiuLewis/mahjong-tracking-app.git
cd mahjong-tracking-app
```

2. Install dependencies:
```bash
pip3 install flask
```

3. Run the application:
```bash
python3 app.py
```

Or use the Makefile:
```bash
make start
```

## Makefile Commands

- `make` or `make start` - Start the application
- `make stop` - Stop the application
- `make restart` - Restart the application
- `make status` - Check if application is running
- `make logs` - View application logs
- `make clean` - Delete database (removes all data!)
- `make help` - Show help message

## Usage

1. **Manage Players**: Add or remove players from the roster
2. **Add a Game**: Select 4 players from the dropdown and enter their scores
3. **View History**: See all past games and calculate total points
4. **Calculate Totals**: Select multiple games to see cumulative points

## Default Players

The app comes with 4 default players:
- 群主
- Han
- Henry
- YHW

You can add or remove players as needed from the "Manage Players" page.

## Technology Stack

- **Backend**: Python Flask
- **Database**: SQLite3
- **Frontend**: HTML, CSS, JavaScript (Vanilla)
- **Design**: Mobile-first responsive design with gradient themes

## Project Structure

```
mahjong_tracker/
├── app.py                 # Main Flask application
├── Makefile              # Application management commands
├── templates/
│   ├── base.html         # Base template with shared styles
│   ├── index.html        # Home page
│   ├── add_game.html     # Add game form
│   ├── history.html      # Game history and totals
│   └── manage_players.html  # Player management
└── README.md             # This file
```

## Contributing

Feel free to submit issues and enhancement requests!

## License

MIT License
