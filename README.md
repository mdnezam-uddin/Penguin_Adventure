# Penguin Adventure

A fun 2D platformer game featuring a penguin on an exciting adventure with a dynamic 3-stage progression system!

## About

Penguin Adventure is a classic-style jump'n'run game with challenging levels, various enemies, and power-ups. Guide your penguin through different worlds, collecting coins and defeating enemies along the way. The game features a unique 3-stage progression system that tracks your performance and advances you through stages based on your achievements!

## New Features - 3-Stage Progression System

The game now includes a dynamic stage system that tracks your progress throughout gameplay:

### Stages

- **Stage 1 - Beginner Stage**: Starting stage where you begin your adventure
- **Stage 2 - Intermediate Stage**: Unlocks after collecting 50 coins and defeating 10 enemies
- **Stage 3 - Advanced Stage**: Unlocks after collecting 150 coins and defeating 30 enemies

### Features

- Real-time stage display at the top of the screen
- Progress tracking showing requirements for next stage
- Cumulative coin and enemy counters across all levels
- Stage information updates automatically as you play

### Developer Shortcuts (Testing Mode)

When developer mode is enabled, you can quickly switch between stages:

- **F5**: Switch to Stage 1
- **F6**: Switch to Stage 2
- **F7**: Switch to Stage 3

Enable developer mode by running: `./build/penguin_adventure2 --developer` or press **Ctrl+F2** in-game.

For detailed information about the stage system, see [STAGE_SYSTEM.md](STAGE_SYSTEM.md).

## Features

- Classic 2D platformer gameplay
- **3-Stage Progression System** with real-time tracking
- Multiple levels with increasing difficulty
- Various enemies and obstacles
- Power-ups and collectibles
- Beautiful graphics and animations
- Engaging sound effects and music

## Prerequisites

Before building the game, ensure you have the following installed:

### macOS (using Homebrew)

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required dependencies
brew install cmake sdl2 sdl2_image openal-soft libogg libvorbis \
             physfs fmt glm freetype libraqm curl glew libpng
```

### Ubuntu/Debian

```bash
sudo apt-get update
sudo apt-get install cmake g++ libsdl2-dev libsdl2-image-dev \
                     libopenal-dev libogg-dev libvorbis-dev \
                     libphysfs-dev libfreetype6-dev libcurl4-openssl-dev \
                     libglew-dev libpng-dev
```

## Building the Game

### First Time Setup

1. **Clone the repository:**

```bash
git clone https://github.com/mdnezam-uddin/Penguin_Adventure.git
cd "Penguin_Adventure"
```

2. **Create build directory:**

```bash
mkdir -p build
cd build
```

3. **Configure with CMake:**

**For macOS:**

```bash
PKG_CONFIG_PATH="/opt/homebrew/Cellar/openal-soft/1.24.3/lib/pkgconfig:$PKG_CONFIG_PATH" cmake ..
```

**For Linux:**

```bash
cmake ..
```

4. **Build the game:**

```bash
make -j4
```

The executable will be created as `penguin_adventure2` in the build directory.

### Rebuilding After Changes

If you make changes to the source code:

```bash
cd build
PKG_CONFIG_PATH="/opt/homebrew/Cellar/openal-soft/1.24.3/lib/pkgconfig:$PKG_CONFIG_PATH" make -j4
```

## Running the Game

### Basic Run

From the project root directory:

```bash
./build/penguin_adventure2
```

Or from the build directory:

```bash
cd build
./penguin_adventure2
```

### Run with Developer Mode (for Stage Shortcuts)

```bash
./build/penguin_adventure2 --developer
```

### Other Useful Options

```bash
# Run in fullscreen mode
./build/penguin_adventure2 --fullscreen

# Run with FPS display
./build/penguin_adventure2 --show-fps

# Run in windowed mode with specific resolution
./build/penguin_adventure2 --window --geometry 1280x720

# Show all available options
./build/penguin_adventure2 --help
```

## Controls

### Gameplay

- **Arrow Keys**: Move left/right, look up/down
- **Space Bar**: Jump
- **Left Ctrl**: Fire/Run/Action
- **Left Shift**: Use item/Special ability
- **P / Pause**: Pause game
- **Esc**: Pause menu

### Developer Mode Shortcuts (when enabled)

- **F5**: Force switch to Stage 1
- **F6**: Force switch to Stage 2
- **F7**: Force switch to Stage 3
- **Ctrl+F2**: Toggle developer mode
- **F10**: Toggle FPS display
- **F11**: Toggle fullscreen
- **F12**: Take screenshot

## How to Play

1. **Start the Game**: Run the executable as described above
2. **Navigate Menu**: Use arrow keys to navigate and Enter to select
3. **Play Levels**: Complete levels by reaching the exit while collecting coins
4. **Track Progress**: Watch your stage progression at the top of the screen
5. **Advance Stages**: Collect coins and defeat enemies to unlock higher stages
6. **Power-ups**: Collect mushrooms and flowers for special abilities
7. **Avoid Enemies**: Jump on enemies or avoid them to survive

### Tips

- Collect as many coins as possible to progress through stages faster
- Defeat enemies to increase your stage progression
- Look for secret areas and hidden coins
- Use power-ups strategically
- The stage display shows your current requirements for the next stage

## Project Structure

```
penguin-adventure/
├── src/                    # Source code files
│   ├── penguin_adventure/  # Main game code
│   │   ├── stage_manager.hpp/cpp  # Stage system implementation
│   │   └── ...
│   ├── object/            # Game objects (player, enemies, etc.)
│   ├── audio/             # Audio system
│   └── ...
├── data/                  # Game assets
│   ├── images/            # Graphics and sprites
│   ├── sounds/            # Sound effects
│   ├── music/             # Background music
│   ├── levels/            # Level files
│   └── fonts/             # Game fonts
├── build/                 # Compiled binaries (created after building)
│   └── penguin_adventure2 # Game executable
├── external/              # External libraries
├── tools/                 # Development tools
├── CMakeLists.txt        # Build configuration
├── README.md             # This file
└── STAGE_SYSTEM.md       # Detailed stage system documentation
```

## Development

This project is being developed as part of the 7th Semester Practice in Software Development course.

### Recent Updates

✅ **3-Stage Progression System** - Dynamic gameplay progression based on performance  
✅ **Real-time HUD Display** - Stage information shown during gameplay  
✅ **Developer Shortcuts** - Quick stage switching for testing (F5/F6/F7)  
✅ **Statistics Integration** - Automatic progress tracking

## Troubleshooting

### OpenAL not found (macOS)

If you get OpenAL errors during build:

```bash
# Find OpenAL installation
find /opt/homebrew -name "*openal*.pc"

# Use the path in PKG_CONFIG_PATH
PKG_CONFIG_PATH="/opt/homebrew/Cellar/openal-soft/[VERSION]/lib/pkgconfig:$PKG_CONFIG_PATH" cmake ..
```

### Build directory cleanup

If you encounter build issues:

```bash
cd build
rm -rf *
cmake .. && make -j4
```

### Game won't start

- Ensure you're running from the correct directory (project root or build/)
- Check that data/ directory exists and contains game assets
- Verify all dependencies are installed

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is licensed under GPL v2. For full licensing information, please refer to the GPL v2 license terms.

## Credits

- Course instructors and peers for guidance and support
- Open source community for various libraries and tools
- See data/AUTHORS and data/ACKNOWLEDGEMENTS.txt for additional credits

## Repository

GitHub: https://github.com/mdnezam-uddin/Penguin_Adventure.git

## Contact

For questions or issues, please open an issue on GitHub or contact the development team.

---

**Enjoy your Penguin Adventure! 🐧**

_Progress through the stages and become the ultimate penguin champion!_
