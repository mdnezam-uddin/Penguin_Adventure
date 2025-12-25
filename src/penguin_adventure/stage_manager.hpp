//  Penguin Adventure - Stage Manager
//  Copyright (C) 2025
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.

#pragma once

#include <string>
#include "util/currenton.hpp"

/** Manages the 3-stage progression system based on collected points and killed enemies */
class StageManager final : public Currenton<StageManager>
{
public:
  enum class Stage {
    STAGE_1,  // Beginner stage
    STAGE_2,  // Intermediate stage  
    STAGE_3   // Advanced stage
  };

  // Stage progression thresholds
  static constexpr int STAGE_2_COINS_REQUIRED = 50;
  static constexpr int STAGE_2_ENEMIES_REQUIRED = 10;
  
  static constexpr int STAGE_3_COINS_REQUIRED = 150;
  static constexpr int STAGE_3_ENEMIES_REQUIRED = 30;

public:
  StageManager();
  ~StageManager();

  /** Update progress with collected coins and killed enemies */
  void update_progress(int coins_collected, int enemies_killed);
  
  /** Check if player can advance to next stage */
  bool can_advance_to_next_stage() const;
  
  /** Advance to the next stage */
  void advance_stage();
  
  /** Get current stage */
  Stage get_current_stage() const { return m_current_stage; }
  
  /** Get stage as integer (1, 2, or 3) */
  int get_stage_number() const;
  
  /** Get stage name as string */
  std::string get_stage_name() const;
  
  /** Get total coins collected across all stages */
  int get_total_coins() const { return m_total_coins; }
  
  /** Get total enemies killed across all stages */
  int get_total_enemies() const { return m_total_enemies; }
  
  /** Get coins needed for next stage (0 if at max stage) */
  int get_coins_for_next_stage() const;
  
  /** Get enemies needed for next stage (0 if at max stage) */
  int get_enemies_for_next_stage() const;
  
  /** Reset progress (start over) */
  void reset();
  
  /** Get completion percentage for current stage */
  float get_stage_progress() const;

private:
  Stage m_current_stage;
  int m_total_coins;
  int m_total_enemies;
};

#endif
