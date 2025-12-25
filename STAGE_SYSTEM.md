# Stage System Implementation

## Overview

The game has been converted into a 3-stage progression system based on collected coins and killed enemies.

## Stages

### Stage 1: Beginner Stage

- **Entry Requirements**: Starting stage
- **Progress to Next**: Collect 50 coins and kill 10 enemies

### Stage 2: Intermediate Stage

- **Entry Requirements**: 50+ coins and 10+ enemies killed
- **Progress to Next**: Collect 150 total coins and kill 30 total enemies

### Stage 3: Advanced Stage

- **Entry Requirements**: 150+ coins and 30+ enemies killed
- **Progress to Next**: Final stage!

## Features Implemented

1. **StageManager Class** (`src/penguin_adventure/stage_manager.hpp/cpp`)

   - Tracks total coins and enemies across gameplay
   - Manages stage progression logic
   - Calculates requirements for next stage

2. **HUD Display** (Modified `player_status_hud.hpp/cpp`)

   - Shows current stage name at top center of screen
   - Displays progress towards next stage
   - Shows requirements (coins and enemies needed)

3. **Real-time Tracking** (Modified `statistics.cpp`)

   - Automatically updates stage progress when:
     - Coins are collected
     - Enemies are killed
   - Integrated with existing statistics system

4. **Game Session Integration** (Modified `game_session.hpp/cpp`)
   - Stage manager created per game session
   - Accessible throughout the game
   - Persists across level restarts

## How It Works

1. **Starting the Game**:

   - Game begins at Stage 1 (Beginner Stage)
   - Stage info displayed at top of screen

2. **Collecting Progress**:

   - Every coin collected increments the counter
   - Every enemy killed increments the counter
   - Stage manager automatically checks if requirements are met

3. **Stage Advancement**:

   - When requirements are met, player can advance
   - New stage name and requirements are displayed
   - Progress continues to accumulate

4. **Visual Feedback**:
   - Current stage shown in yellow text
   - Progress requirements shown in blue text
   - "FINAL STAGE!" displayed when reaching Stage 3

## Files Modified/Created

### New Files:

- `src/penguin_adventure/stage_manager.hpp` - Stage manager class definition
- `src/penguin_adventure/stage_manager.cpp` - Stage manager implementation

### Modified Files:

- `src/penguin_adventure/player_status_hud.hpp` - Added stage display method
- `src/penguin_adventure/player_status_hud.cpp` - Implemented stage info drawing
- `src/penguin_adventure/game_session.hpp` - Added stage manager member
- `src/penguin_adventure/game_session.cpp` - Initialize stage manager
- `src/penguin_adventure/statistics.cpp` - Update stage progress on coin/enemy events

## Testing

To test the stage system:

1. Run the game
2. Look at the top center of the screen - you should see "STAGE 1 - Beginner Stage"
3. Below it shows requirements: "Next Stage: 50 coins, 10 enemies"
4. Collect coins and kill enemies
5. When you reach 50 coins and 10 enemies, you'll see "STAGE 2 - Intermediate Stage"
6. Continue to 150 coins and 30 enemies for Stage 3

### Stage Shortcuts (Developer/Testing Mode)

For quick testing and demonstration, keyboard shortcuts are available:

- **F5**: Force switch to Stage 1
- **F6**: Force switch to Stage 2
- **F7**: Force switch to Stage 3

**Requirements**: These shortcuts only work when:

- Developer mode is enabled in game settings, OR
- You are testing a level from the editor

**Usage**: Press the corresponding F-key during gameplay to immediately switch to that stage. This is useful for:

- Testing stage-specific features
- Demonstrating the stage system
- Quickly verifying stage transitions
- Debugging stage-related functionality

**Note**: The stage shortcuts do not affect your coin/enemy counters - they only change the displayed stage. Your actual progress tracking continues normally.

## Future Enhancements

Possible improvements:

- Add sound effects when advancing stages
- Add visual animations for stage transitions
- Save stage progress between sessions
- Add difficulty modifiers per stage (faster enemies, less powerups, etc.)
- Add stage-specific level layouts
- Add rewards/bonuses for advancing stages

## Notes

- Stage progress is currently per-session (resets when game restarts)
- The system tracks ALL coins and enemies across all levels played
- Requirements are cumulative (total coins/enemies, not per-level)
