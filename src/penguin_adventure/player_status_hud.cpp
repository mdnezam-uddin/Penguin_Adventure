//  Penguin Adventure
//  Copyright (C) 2018 Ingo Ruhnke <grumbel@gmail.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include "penguin_adventure/player_status_hud.hpp"

#include <iostream>

#include "gui/menu_manager.hpp"
#include "object/display_effect.hpp"
#include "sprite/sprite_manager.hpp"
#include "penguin_adventure/debug.hpp"
#include "penguin_adventure/game_object.hpp"
#include "penguin_adventure/level.hpp"
#include "penguin_adventure/player_status.hpp"
#include "penguin_adventure/resources.hpp"
#include "penguin_adventure/title_screen.hpp"
#include "penguin_adventure/screen_manager.hpp"
#include "penguin_adventure/game_session.hpp"
#include "penguin_adventure/sector.hpp"
#include "penguin_adventure/stage_manager.hpp"
#include "video/drawing_context.hpp"
#include "video/surface.hpp"
#include "editor/editor.hpp"
#include "worldmap/worldmap_sector.hpp"

static constexpr int DISPLAYED_COINS_UNSET = -1;
static constexpr float ITEM_POCKET_TIME = 6.f;

PlayerStatusHUD::PlayerStatusHUD(PlayerStatus& player_status) :
  m_player_status(player_status),
  m_item_pocket_fade(),
  displayed_coins(DISPLAYED_COINS_UNSET),
  displayed_coins_frame(0),
  coin_surface(Surface::from_file("images/engine/hud/coins-0.png")),
  m_bonus_sprites(),
  m_item_pocket_border(Surface::from_file("images/engine/hud/item_pocket.png"))
{
  m_player_status.set_hud_hint(this);
  // aesthetic choice: hint to players their item pocket
  m_item_pocket_fade.start(ITEM_POCKET_TIME);
  m_bonus_sprites[BONUS_FIRE]  = SpriteManager::current()->create("images/powerups/fireflower/fireflower.sprite");
  m_bonus_sprites[BONUS_ICE]   = SpriteManager::current()->create("images/powerups/iceflower/iceflower.sprite");
  m_bonus_sprites[BONUS_AIR]   = SpriteManager::current()->create("images/powerups/airflower/airflower.sprite");
  m_bonus_sprites[BONUS_EARTH] = SpriteManager::current()->create("images/powerups/earthflower/earthflower.sprite");
}

void
PlayerStatusHUD::on_item_pocket_change([[maybe_unused]] Player* player)
{
  m_item_pocket_fade.start(ITEM_POCKET_TIME);
}

void
PlayerStatusHUD::reset()
{
  displayed_coins = DISPLAYED_COINS_UNSET;
}

void
PlayerStatusHUD::update(float dt_sec)
{
  m_item_pocket_fade.check();
}

void
PlayerStatusHUD::draw(DrawingContext& context)
{
  if (g_debug.hide_player_hud || Editor::is_active() ||
      (Sector::current() && Sector::current()->get_effect().has_active_borders()))
    return;

  if ((displayed_coins == DISPLAYED_COINS_UNSET) ||
      (std::abs(displayed_coins - m_player_status.coins) > 100)) {
    displayed_coins = m_player_status.coins;
    displayed_coins_frame = 0;
  }
  if (++displayed_coins_frame > 2) {
    displayed_coins_frame = 0;
    if (displayed_coins < m_player_status.coins) displayed_coins++;
    if (displayed_coins > m_player_status.coins) displayed_coins--;
  }
  displayed_coins = std::min(std::max(displayed_coins, 0), m_player_status.get_max_coins());

  float hudpos = BORDER_Y + 1.0f;
  const std::string coins_text = std::to_string(displayed_coins);

  context.push_transform();
  context.set_translation(Vector(0, 0));
  context.transform().scale = 1.f;
  if (coin_surface)
  {
    context.color().draw_surface(coin_surface,
                                Vector(context.get_width() - BORDER_X - static_cast<float>(coin_surface->get_width()) - Resources::fixed_font->get_text_width(coins_text),
                                       hudpos),
                                LAYER_HUD);
  }

  context.color().draw_text(Resources::fixed_font,
                            coins_text,
                            Vector(static_cast<float>(context.get_width()) - BORDER_X - Resources::fixed_font->get_text_width(coins_text),
                                  hudpos + 13.f),
                            ALIGN_LEFT,
                            LAYER_HUD,
                            PlayerStatusHUD::text_color);


  if (m_player_status.is_item_pocket_allowed())
  {
    for (int i = 0; i < InputManager::current()->get_num_users(); i++)
    {
      constexpr float POCKET_FADE_AT = .7f;
      constexpr float POCKET_FADE_MULT = 1.4f;
      float prog = m_item_pocket_fade.started() ? m_item_pocket_fade.get_progress() : 1.f;
      float fade = 1.f - std::fabs(POCKET_FADE_AT - prog) * POCKET_FADE_MULT;
      if (m_item_pocket_fade.started())
      {
        context.set_alpha(prog < POCKET_FADE_AT ? 1.f : fade);

      }
      else
        context.set_alpha(fade);

      // If in some menu (i.e. pause) or not in game (worldmap) then just show anyway
      if ((MenuManager::current() && MenuManager::current()->get_menu_stack_size() > 0) ||
          (GameSession::current() && !GameSession::current()->is_active()))
        context.set_alpha(1.f);

      float ypos = static_cast<float>(m_item_pocket_border->get_height() * i);
      Vector pos(BORDER_X, BORDER_Y + ypos);
      context.color().draw_surface(m_item_pocket_border, pos, LAYER_HUD);

      if (m_bonus_sprites.find(m_player_status.m_item_pockets[i]) != m_bonus_sprites.end())
      {
        pos += 20;

        Sprite* sprite = m_bonus_sprites[m_player_status.m_item_pockets[i]].get();
        if (sprite)
          sprite->draw(context.color(), pos, LAYER_HUD);
      }

      context.set_alpha(1.f);
    }
  }

  // Draw stage information
  draw_stage_info(context);

  context.pop_transform();
}

void
PlayerStatusHUD::draw_stage_info(DrawingContext& context)
{
  // Only show stage info in actual gameplay, not in menus or worldmap
  if (!GameSession::current() || !GameSession::current()->is_active())
    return;
    
  if (!StageManager::current())
    return;

  StageManager* stage_mgr = StageManager::current();
  
  // Position at top center of screen
  float x_pos = context.get_width() / 2.0f;
  float y_pos = BORDER_Y;
  
  // Draw stage number and name
  std::string stage_text = "STAGE " + std::to_string(stage_mgr->get_stage_number()) + 
                           " - " + stage_mgr->get_stage_name();
  
  // Draw with shadow for better visibility
  context.color().draw_text(Resources::big_font,
                            stage_text,
                            Vector(x_pos + 2, y_pos + 2),
                            ALIGN_CENTER,
                            LAYER_HUD,
                            Color(0, 0, 0, 0.7f)); // Shadow
  
  context.color().draw_text(Resources::big_font,
                            stage_text,
                            Vector(x_pos, y_pos),
                            ALIGN_CENTER,
                            LAYER_HUD,
                            Color(1.0f, 1.0f, 0.0f)); // Yellow text
  
  // Show progress to next stage if not at max
  if (stage_mgr->get_stage_number() < 3)
  {
    int coins_needed = stage_mgr->get_coins_for_next_stage();
    int enemies_needed = stage_mgr->get_enemies_for_next_stage();
    
    std::string progress_text = "Next Stage: " + 
                                std::to_string(coins_needed) + " coins, " +
                                std::to_string(enemies_needed) + " enemies";
    
    context.color().draw_text(Resources::small_font,
                              progress_text,
                              Vector(x_pos, y_pos + 30),
                              ALIGN_CENTER,
                              LAYER_HUD,
                              Color(0.8f, 0.8f, 1.0f));
  }
  else
  {
    // At max stage
    context.color().draw_text(Resources::small_font,
                              "FINAL STAGE!",
                              Vector(x_pos, y_pos + 30),
                              ALIGN_CENTER,
                              LAYER_HUD,
                              Color(1.0f, 0.5f, 0.0f));
  }
}

