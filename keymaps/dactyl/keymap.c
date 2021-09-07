/* A standard layout for the Dactyl Manuform 5x6 Keyboard */ 

#include QMK_KEYBOARD_H

#define _QWERTY 0
#define _RAISE 1
#define _LAYER2 2

#define RAISE MO(_RAISE)
#define LAYER2 MO(_LAYER2)

LEADER_EXTERNS();
#define LEADER_PER_KEY_TIMING
#define LEADER_TIMEOUT 450

bool did_leader_succeed;

/* need to install a speaker and enable this in rules.mk */
#ifdef AUDIO_ENABLE
float leader_start[][2] = SONG(ONE_UP_SOUND );
float leader_succeed[][2] = SONG(ALL_STAR);
float leader_fail[][2] = SONG(RICK_ROLL);
#endif 

enum custom_keycodes {
    SCREENA = SAFE_RANGE,
    SSHPDEV,
    DIGGOOG,
    TERM256,
    TERM,
};

enum {
  TD_SC_C,
  TD_SQDQ,
};

// MACROS
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
    case SCREENA:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTRL("A"));
        } else {
            // when keycode is released
        }
        break;
    case SSHPDEV:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("ssh pdevries@");
        } else {
            // when keycode is released
        }
        break;
    case DIGGOOG:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("dig @8.8.8.8 ");
        } else {
            // when keycode is released
        }
        break;
    case TERM256:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("export TERM=xterm-256color");
        } else {
            // when keycode is released
        }
        break;
    case TERM:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("export TERM=xterm");
        } else {
            // when keycode is released
        }
        break;
    }
    return true;
};

// LEADER KEY
void matrix_scan_user(void) {
  LEADER_DICTIONARY() {
    did_leader_succeed = leading = false;
    SEQ_ONE_KEY(KC_R) {
      register_code(KC_LCTL);
      register_code(KC_F5);
      unregister_code(KC_F5);
      unregister_code(KC_LCTL);
      did_leader_succeed = true;
    } else
      //////////// CHROME ////////////////
      // Chrome - open last closed tab
    SEQ_ONE_KEY(KC_T) {
      SEND_STRING(SS_LCTL(SS_LSFT("t")));
      did_leader_succeed = true;
    } else
    SEQ_TWO_KEYS(KC_C, KC_T) {
      SEND_STRING(SS_LCTL(SS_LSFT("t")));
      did_leader_succeed = true;
    } else
      // Chrome - goto address bar
    SEQ_ONE_KEY(KC_A) {
      SEND_STRING(SS_LALT("d"));
      did_leader_succeed = true;
    } else
    SEQ_TWO_KEYS(KC_C, KC_A) {
      SEND_STRING(SS_LALT("d"));
      did_leader_succeed = true;
    } else
      //////////// VI //////////////
      /* VI - send :w */
    SEQ_ONE_KEY(KC_W) {
      SEND_STRING(SS_TAP(X_ESC) SS_TAP(X_ESC) ":w" SS_TAP(X_ENT));
      did_leader_succeed = true;
    } else
    SEQ_TWO_KEYS(KC_V, KC_W) {
      SEND_STRING(SS_TAP(X_ESC) SS_TAP(X_ESC) ":w" SS_TAP(X_ENT));
      did_leader_succeed = true;
    } else
      /* VI - send :wq */
    SEQ_ONE_KEY(KC_Q) {
      SEND_STRING(SS_TAP(X_ESC) SS_TAP(X_ESC) ":wq" SS_TAP(X_ENT));
      did_leader_succeed = true;
    } else
    SEQ_TWO_KEYS(KC_V, KC_Q) {
      SEND_STRING(SS_TAP(X_ESC) SS_TAP(X_ESC) ":wq" SS_TAP(X_ENT));
      did_leader_succeed = true;
    } else
      /* VI - send :q! */
    SEQ_ONE_KEY(KC_X) {
      SEND_STRING(SS_TAP(X_ESC) SS_TAP(X_ESC) ":q!" SS_TAP(X_ENT));
      did_leader_succeed = true;
    } else
    SEQ_TWO_KEYS(KC_V, KC_X) {
      SEND_STRING(SS_TAP(X_ESC) SS_TAP(X_ESC) ":q!" SS_TAP(X_ENT));
      did_leader_succeed = true;
    } else
      //////////// SCREEN //////////////
      /* screen - open window list */
    SEQ_TWO_KEYS(KC_S, KC_L) {
      SEND_STRING(SS_LCTL("a") "\"");
      did_leader_succeed = true;
    }
      /* screen - last screen */
    SEQ_TWO_KEYS(KC_S, KC_S) {
      SEND_STRING(SS_LCTL("a") SS_LCTL("a"));
      did_leader_succeed = true;
    }
    SEQ_TWO_KEYS(KC_S, KC_A) {
      SEND_STRING(SS_LCTL("a") SS_LCTL("a"));
      did_leader_succeed = true;
    }
    //////////// i3  //////////////
    /* i3 - close window */
    SEQ_TWO_KEYS(KC_I, KC_Q) {
      SEND_STRING(SS_LGUI(SS_LSFT("q")) "\"");
      did_leader_succeed = true;
    }
    SEQ_TWO_KEYS(KC_I, KC_COMM) {
      SEND_STRING(SS_LGUI(SS_LALT(SS_LSFT("<"))) "\"");
      did_leader_succeed = true;
    }
    SEQ_TWO_KEYS(KC_I, KC_DOT) {
      SEND_STRING(SS_LGUI(SS_LALT(SS_LSFT(">"))) "\"");
      did_leader_succeed = true;
    }
    leader_end();
  }
}

// Tap Dance
qk_tap_dance_action_t tap_dance_actions[] = {
  // Tap once for Escape, twice for Caps Lock
  [TD_SC_C] = ACTION_TAP_DANCE_DOUBLE(KC_SCLN, KC_COLN),
  [TD_SQDQ] = ACTION_TAP_DANCE_DOUBLE(KC_QUOT, KC_DQUO),
};
      

void leader_start(void) {
#ifdef AUDIO_ENABLE
    PLAY_SONG(leader_start);
#endif
}

void leader_end(void) {
  if (did_leader_succeed) {
#ifdef AUDIO_ENABLE
    PLAY_SONG(leader_succeed);
#endif
  } else {
#ifdef AUDIO_ENABLE
    PLAY_SONG(leader_fail);
#endif
  }
}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [_QWERTY] = LAYOUT_5x6(
     KC_ESC , KC_1  , KC_2  , KC_3  , KC_4  , KC_5  ,                         KC_6  , KC_7  , KC_8  , KC_9  , KC_0  ,KC_BSPC,
     KC_TAB , KC_Q  , KC_W  , KC_E  , KC_R  , KC_T  ,                         KC_Y  , KC_U  , KC_I  , KC_O  , KC_P  ,KC_MINS,
     KC_LSFT, KC_A  , KC_S  , KC_D  , KC_F  , KC_G  ,                         KC_H  , KC_J  , KC_K  , KC_L  ,TD(TD_SC_C),TD(TD_SQDQ),
     KC_LCTL, KC_Z  , KC_X  , KC_C  , KC_V  , KC_B  ,                         KC_N  , KC_M  ,KC_COMM,KC_DOT ,KC_SLSH,KC_BSLASH,
                                      KC_LBRC,KC_RBRC,                    KC_PLUS, KC_EQL,
                                      KC_LSFT,KC_SPC,                      KC_SPC, KC_ENT,
                                      RAISE,KC_LGUI,                      KC_SCLN, LAYER2,
                                      KC_LALT, SCREENA,                    KC_LEAD, KC_LGUI
  ),

  [_RAISE] = LAYOUT_5x6(
       KC_TILD , KC_F1 , KC_F2 , KC_F3 , KC_F4 , KC_F5 ,                        KC_F6  , KC_F7 , KC_F8 , KC_F9 ,KC_F10 ,KC_F11 ,
       _______,_______,_______,_______,_______,KC_LBRC,                        KC_RBRC,KC_PGDN,KC_PGUP,KC_INS ,KC_SLCK,KC_MUTE,
       _______,KC_LEFT,KC_UP  ,KC_DOWN,KC_RGHT,KC_LPRN,                        KC_LEFT,KC_DOWN,KC_UP,KC_RGHT,_______,KC_VOLU,
       _______,_______,_______,_______,_______,_______,                        DM_REC1,DM_RSTP,DM_PLY1,_______,_______,KC_VOLD,
                                               _______,_______,            KC_EQL ,_______,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,KC_ESC,
                                               _______,_______,            KC_BTN3,_______
  ),

  [_LAYER2] = LAYOUT_5x6(
       _______,_______,_______,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
       _______,_______,_______,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
       _______,_______,_______,_______,DIGGOOG,SSHPDEV,                        _______,_______,_______,_______,_______,_______,
       _______,_______,_______,_______,TERM256,TERM   ,                        DM_REC2,DM_RSTP,DM_PLY2,_______,_______,_______,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,_______,
                                               KC_ESC ,_______,            _______,_______,
                                               _______,_______,            _______,_______
  ),
};

/* 

// Thumb clusters, match to the comments in the keymaps
//
//         +----+
// +----+  |    |                                          +-----+
// |    |  | 2  | +----+                                   |     | +----+
// | 1  |  |    | |    |                           +-----+ | 7   | |    |
// |    |  +----+ | 4  |                           |     | |     | | 8  |
// +----+         |    | +----+             +----+ |  9  | +-----+ |    |
//                +----+ |    |             |    | |     |         +----+
//            +----+     | 6  |             | 11 | +-----+
//            |    |     |    |             |    |        +----+
//            | 3  |     +----+             +----+        | 10 |
//            +----++-----+                        +----+ |    |
//                  |     |                        |    | +----+
//                  | 5   |                        |12  |
//                  +-----+                        +----+
//
      // 1         2                               7          8
      CTRL_OR_RAISE, KC_LGUI,                      KC_BSPACE, KC_SPACE,
        // 3     4                            9        10
        KC_LALT, _______,                     _______, MOD_SUPER,
          // 5      6                       11    12
          _______, _______,                  KC_F1, _______


*/
