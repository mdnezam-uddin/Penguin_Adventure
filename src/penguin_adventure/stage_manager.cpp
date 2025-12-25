//  Penguin Adventure - Stage Manager Implementation
//  Copyright (C) 2025
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.

#include "penguin_adventure/stage_manager.hpp"

#include <algorithm>
#include "util/log.hpp"

StageManager::StageManager() :
  m_current_stage(Stage::STAGE_1),
  m_total_coins(0),
  m_total_enemies(0)
{
  log_info << "StageManager initialized - Starting at Stage 1" << std::endl;
}

StageManager::~StageManager()
{
}

void
StageManager::update_progress(int coins_collected, int enemies_killed)
{
  m_total_coins += coins_collected;
  m_total_enemies += enemies_killed;
  
  log_info << "Stage Progress Updated - Coins: " << m_total_coins 
           << " Enemies: " << m_total_enemies << std::endl;
  
  // Check if can auto-advance
  if (can_advance_to_next_stage())
  {
    log_info << "Requirements met for next stage!" << std::endl;
  }
}

bool
StageManager::can_advance_to_next_stage() const
{
  switch (m_current_stage)
  {
    case Stage::STAGE_1:
      return (m_total_coins >= STAGE_2_COINS_REQUIRED && 
              m_total_enemies >= STAGE_2_ENEMIES_REQUIRED);
              
    case Stage::STAGE_2:
      return (m_total_coins >= STAGE_3_COINS_REQUIRED && 
              m_total_enemies >= STAGE_3_ENEMIES_REQUIRED);
              
    case Stage::STAGE_3:
      return false; // Already at max stage
      
    default:
      return false;
  }
}

void
StageManager::advance_stage()
{
  if (!can_advance_to_next_stage())
  {
    log_warning << "Cannot advance - requirements not met" << std::endl;
    return;
  }
  
  switch (m_current_stage)
  {
    case Stage::STAGE_1:
      m_current_stage = Stage::STAGE_2;
      log_info << "Advanced to Stage 2!" << std::endl;
      break;
      
    case Stage::STAGE_2:
      m_current_stage = Stage::STAGE_3;
      log_info << "Advanced to Stage 3!" << std::endl;
      break;
      
    case Stage::STAGE_3:
      log_info << "Already at maximum stage" << std::endl;
      break;
  }
}

int
StageManager::get_stage_number() const
{
  switch (m_current_stage)
  {
    case Stage::STAGE_1: return 1;
    case Stage::STAGE_2: return 2;
    case Stage::STAGE_3: return 3;
    default: return 1;
  }
}

std::string
StageManager::get_stage_name() const
{
  switch (m_current_stage)
  {
    case Stage::STAGE_1: return "Beginner Stage";
    case Stage::STAGE_2: return "Intermediate Stage";
    case Stage::STAGE_3: return "Advanced Stage";
    default: return "Unknown Stage";
  }
}

int
StageManager::get_coins_for_next_stage() const
{
  switch (m_current_stage)
  {
    case Stage::STAGE_1:
      return std::max(0, STAGE_2_COINS_REQUIRED - m_total_coins);
      
    case Stage::STAGE_2:
      return std::max(0, STAGE_3_COINS_REQUIRED - m_total_coins);
      
    case Stage::STAGE_3:
      return 0; // No next stage
      
    default:
      return 0;
  }
}

int
StageManager::get_enemies_for_next_stage() const
{
  switch (m_current_stage)
  {
    case Stage::STAGE_1:
      return std::max(0, STAGE_2_ENEMIES_REQUIRED - m_total_enemies);
      
    case Stage::STAGE_2:
      return std::max(0, STAGE_3_ENEMIES_REQUIRED - m_total_enemies);
      
    case Stage::STAGE_3:
      return 0; // No next stage
      
    default:
      return 0;
  }
}

void
StageManager::reset()
{
  m_current_stage = Stage::STAGE_1;
  m_total_coins = 0;
  m_total_enemies = 0;
  log_info << "StageManager reset to Stage 1" << std::endl;
}

float
StageManager::get_stage_progress() const
{
  int coins_needed = 0;
  int enemies_needed = 0;
  
  switch (m_current_stage)
  {
    case Stage::STAGE_1:
      coins_needed = STAGE_2_COINS_REQUIRED;
      enemies_needed = STAGE_2_ENEMIES_REQUIRED;
      break;
      
    case Stage::STAGE_2:
      coins_needed = STAGE_3_COINS_REQUIRED - STAGE_2_COINS_REQUIRED;
      enemies_needed = STAGE_3_ENEMIES_REQUIRED - STAGE_2_ENEMIES_REQUIRED;
      break;
      
    case Stage::STAGE_3:
      return 100.0f; // Complete
  }
  
  float coin_progress = std::min(100.0f, (m_total_coins * 100.0f) / coins_needed);
  float enemy_progress = std::min(100.0f, (m_total_enemies * 100.0f) / enemies_needed);
  
  // Return average of both metrics
  return (coin_progress + enemy_progress) / 2.0f;
}
