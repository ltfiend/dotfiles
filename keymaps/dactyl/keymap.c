/* A standard layout for the Dactyl Manuform 5x6 Keyboard */ 

// Layout editor colors
// - mouse - 5500ff
// - raise - 6fa60d
// - TMUX - FF0000

#include QMK_KEYBOARD_H

#define _QWERTY 0
#define _RAISE 1
#define _LAYER2 2
#define _MLAYER 3
#define _NUMLAY 4
#define _TMUXLAY 5
#define _LEFTONLY 6
#define _RGHTONLY 7
#define _NEOVIM 8

#define RAISE MO(_RAISE)
#define LAYER2 MO(_LAYER2)
#define MLAYMO MO(_MLAYER)
#define NUMLAY MO(_NUMLAY)
#define MLAYTT TT(_MLAYER)
#define MLAYER MO(_MLAYER)
#define QWERTO TO(_QWERTY)
#define TMUXLAY MO(_TMUXLAY)
#define MTALT MT(MOD_LALT, KC_SCLN)
#define SNGLEFT TG(_LEFTONLY)
#define SNGRGHT TG(_RGHTONLY)
#define NEOVIM LT(_NEOVIM, KC_SCLN)

LEADER_EXTERNS();
#define LEADER_PER_KEY_TIMING
#define LEADER_TIMEOUT 750

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
    SSH192,
    DIGGOOG,
    DIGCF,
    FZFCOMP,
    TERM256,
    TERM,
    VISUAL,
    BTAB,
    BBTAB,
    BPAGE,
    BBPAGE,
    TMUXU,
    TMUXD,
    TMUXL,
    TMUXR,
    TMUXZ,
    TMUXNEW,
    TMUXLOG,
    TMUXMNU,
    TMUXSPL,
    TMUXVSP,
    TMUXMVU,
    TMUXMVD,
    TMUXLST,
    TMUXTIT,
    TMUXCMD,
    TMUXRL,
    TMUXRR,
    TMUXRU,
    TMUXRD,
    TMUX0,
    TMUX1,
    TMUX2,
    TMUX3,
    TMUX4,
    TMUX5,
    TMUX6,
    TMUX7,
    TMUX8,
    TMUX9,
    TMUXNXT,
    TMUXPRV,
    CBLOCK,
    SPOILER,
    LOGCOM,
    NVIMR,
    NVIML,
    NVIMU,
    NVIMD,
    NVIMRR,
    NVIMRL,
    NVIMRD,
    NVIMRU,
    NVIMZ,
    NVIMUZ,
    VIMJOUR,
    VIMKEYM,
    VIMQUIT,
    VIMSAVE,
    NVIMSPL,
    DAPBACK,
    DAPFORW,
    VIMFOLD,
    DAPTERM,
    DAPBPNT,
    NVIMPT,
    NVIMNT,
    NVIMVSP
};

enum {
  TD_SC_C,
  TD_SQDQ,
  TD_LBRC,
  TD_RBRC,
  TD_SCTP,
  TD_9_0,
  TD_VI_Z,
};

// Removed, to used to hold shift and bkspacing.   Causes issues in screen
// Key Overrides - new # KEY_OVERRIDE_ENABLE = yes
// const key_override_t delete_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_BSPACE, KC_DELETE);

// This globally defines all key overrides to be used
// const key_override_t **key_overrides = (const key_override_t *[]){
//     &delete_key_override,
//         NULL // Null terminate the array of overrides!
//         };

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
    case SSH192:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("ssh 192.168.90.");
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
    case DIGCF:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("dig @1.1.1.1 ");
        } else {
            // when keycode is released
        }
        break;
    case FZFCOMP:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(" **");
            register_code(KC_TAB);
            unregister_code(KC_TAB);
        } else {
            // when keycode is released
        }
        break;
    case TERM256:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("export TERM=xterm-256color\n");
        } else {
            // when keycode is released
        }
        break;
    case TERM:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("export TERM=xterm\n");
        } else {
            // when keycode is released
        }
        break;
    case VISUAL:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("visual\n");
        } else {
            // when keycode is released
        }
        break;
    case BTAB:
        if (record->event.pressed) {
            // when keycode is pressed
            register_code(KC_LCTL);
            register_code(KC_TAB);
            unregister_code(KC_LCTL);
            unregister_code(KC_TAB);
        } else {
            // when keycode is released
        }
        break;
    case BBTAB:
        if (record->event.pressed) {
            // when keycode is pressed
            register_code(KC_LCTL);
            register_code(KC_LSFT);
            register_code(KC_TAB);
            unregister_code(KC_LCTL);
            unregister_code(KC_LSFT);
            unregister_code(KC_TAB);
        } else {
            // when keycode is released
        }
        break;
    case BPAGE:
        if (record->event.pressed) {
            // when keycode is pressed
            register_code(KC_LALT);
            register_code(KC_LEFT);
            unregister_code(KC_LALT);
            unregister_code(KC_LEFT);
        } else {
            // when keycode is released
        }
        break;
    case BBPAGE:
        if (record->event.pressed) {
            // when keycode is pressed
            register_code(KC_LALT);
            register_code(KC_RGHT);
            unregister_code(KC_LALT);
            unregister_code(KC_RGHT);
        } else {
            // when keycode is released
        }
        break;
    case TMUXL:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
        } else {
            // when keycode is released
        }
        break;
    case TMUXR:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_RGHT);
            unregister_code(KC_RGHT);
        } else {
            // when keycode is released
        }
        break;
    case TMUXU:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_UP);
            unregister_code(KC_UP);
        } else {
            // when keycode is released
        }
        break;
    case TMUXD:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_DOWN);
            unregister_code(KC_DOWN);
        } else {
            // when keycode is released
        }
        break;
    case TMUXZ:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("z");
        } else {
            // when keycode is released
        }
        break;
    case TMUXMNU:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("\"");
        } else {
            // when keycode is released
        }
        break;
    case TMUXLOG:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("[");
        } else {
            // when keycode is released
        }
        break;
    case TMUXSPL:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("S");
        } else {
            // when keycode is released
        }
        break;
    case TMUXVSP:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("|");
        } else {
            // when keycode is released
        }
        break;
    case TMUXMVU:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING(SS_LSFT("["));
        } else {
            // when keycode is released
        }
        break;
    case TMUXMVD:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING(SS_LSFT("]"));
        } else {
            // when keycode is released
        }
        break;
    case TMUXLST:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING(SS_LCTL("a"));
        } else {
            // when keycode is released
        }
        break;
    case TMUXTIT:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("A");
        } else {
            // when keycode is released
        }
        break;
    case TMUXCMD:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING(":");
        } else {
            // when keycode is released
        }
        break;
    case TMUX0:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("0");
        } else {
            // when keycode is released
        }
        break;
    case TMUX1:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("1");
        } else {
            // when keycode is released
        }
        break;
    case TMUX2:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("2");
        } else {
            // when keycode is released
        }
        break;
    case TMUX3:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("3");
        } else {
            // when keycode is released
        }
        break;
    case TMUX4:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("4");
        } else {
            // when keycode is released
        }
        break;
    case TMUX5:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("5");
        } else {
            // when keycode is released
        }
        break;
    case TMUX6:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("6");
        } else {
            // when keycode is released
        }
        break;
    case TMUX7:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("7");
        } else {
            // when keycode is released
        }
        break;
    case TMUX8:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("8");
        } else {
            // when keycode is released
        }
        break;
    case TMUX9:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("9");
        } else {
            // when keycode is released
        }
        break;
    case TMUXNXT:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("n");
        } else {
            // when keycode is released
        }
        break;
    case TMUXPRV:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("p");
        } else {
            // when keycode is released
        }
        break;
    case TMUXNEW:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING("c");
        } else {
            // when keycode is released
        }
        break;
    case TMUXRL:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_LALT);
            register_code(KC_LEFT);
            unregister_code(KC_LALT);
            unregister_code(KC_LEFT);
        } else {
            // when keycode is released
        }
        break;
    case TMUXRR:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_LALT);
            register_code(KC_RGHT);
            unregister_code(KC_LALT);
            unregister_code(KC_RGHT);
        } else {
            // when keycode is released
        }
        break;
    case TMUXRU:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_LALT);
            register_code(KC_UP);
            unregister_code(KC_LALT);
            unregister_code(KC_UP);
        } else {
            // when keycode is released
        }
        break;
    case TMUXRD:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("a"));
            register_code(KC_LALT);
            register_code(KC_DOWN);
            unregister_code(KC_LALT);
            unregister_code(KC_DOWN);
        } else {
            // when keycode is released
        }
        break;
    case CBLOCK:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(("``` ```"));
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
        } else {
            // when keycode is released
        }
        break;
    case SPOILER:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(("|| ||"));
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
            register_code(KC_LEFT);
            unregister_code(KC_LEFT);
        } else {
            // when keycode is released
        }
        break;
    case LOGCOM:
        if (record->event.pressed) {
            // when keycode is pressed
            register_code(KC_UP);
            unregister_code(KC_UP);
            SEND_STRING(("\' >> ~/.commands"));
            register_code(KC_ESC);
            unregister_code(KC_ESC);
            register_code(KC_ESC);
            unregister_code(KC_ESC);
            register_code(KC_ESC);
            unregister_code(KC_ESC);
            // register_code(S(KC_I));
            // unregister_code(S(KC_I));
            SEND_STRING(("I"));
            SEND_STRING(("echo \'"));
            register_code(KC_ENT);
            unregister_code(KC_ENT);
        } else {
            // when keycode is released
        }
        break;
    case NVIML:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("h"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMR:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("l"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMU:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("k"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMD:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("j"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMRL:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("w"));
            SEND_STRING("<");
        } else {
            // when keycode is released
        }
        break;
    case NVIMRR:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("w"));
            SEND_STRING(">");
        } else {
            // when keycode is released
        }
        break;
    case NVIMRU:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("w"));
            SEND_STRING("+");
        } else {
            // when keycode is released
        }
        break;
    case NVIMRD:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("w"));
            SEND_STRING("-");
        } else {
            // when keycode is released
        }
        break;
    case NVIMZ:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("w"));
            SEND_STRING("|");
            SEND_STRING(SS_LCTL("w"));
            SEND_STRING("_");
        } else {
            // when keycode is released
        }
        break;
    case NVIMUZ:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("w"));
            SEND_STRING("=");
        } else {
            // when keycode is released
        }
        break;
    case NVIMSPL:
        if (record->event.pressed) {
            register_code(KC_ESC);
            unregister_code(KC_ESC);
            SEND_STRING(SS_LCTL("ws"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMVSP:
        if (record->event.pressed) {
            register_code(KC_ESC);
            unregister_code(KC_ESC);
            SEND_STRING(SS_LCTL("wv"));
        } else {
            // when keycode is released
        }
        break;
    case VIMJOUR:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F1);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case VIMKEYM:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F2);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case DAPBPNT:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(";dt\n");
        } else {
            // when keycode is released
        }
        break;
    case DAPBACK:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(";db\n");
        } else {
            // when keycode is released
        }
        break;
    case DAPFORW:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(";dc\n");
        } else {
            // when keycode is released
        }
        break;
    case DAPTERM:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(";dx\n");
        } else {
            // when keycode is released
        }
        break;
    case NVIMPT:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(SS_LALT(","));
        } else {
            // when keycode is released
        }
        break;
    case NVIMNT:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(SS_LALT("."));
        } else {
            // when keycode is released
        }
        break;
    case VIMFOLD:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING("zi");
        } else {
            // when keycode is released
        }
        break;
    case VIMQUIT:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(":q\n");
        } else {
            // when keycode is released
        }
        break;
    case VIMSAVE:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(":wq\n");
        } else {
            // when keycode is released
        }
        break;
// Template
//     case LOGCOM:
//         if (record->event.pressed) {
// 
//         } else {
//             // when keycode is released
//         }
//         break;
  }
    return true;
};

// LEADER KEY
void matrix_scan_user(void) {
  LEADER_DICTIONARY() {
    did_leader_succeed = leading = false;
    /// General Purpose
    SEQ_ONE_KEY(KC_L) {
        SEND_STRING("ls -l");
    } else
    SEQ_TWO_KEYS(KC_L, KC_L) {
        SEND_STRING("ls -lhart");
    } else
      //////////// CHROME ////////////////
      // Chrome - open last closed tab
    SEQ_ONE_KEY(KC_R) {
      register_code(KC_LCTL);
      register_code(KC_F5);
      unregister_code(KC_F5);
      unregister_code(KC_LCTL);
      did_leader_succeed = true;
    } else
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

// Tap Dance Screen Function
void screen_taps(qk_tap_dance_state_t *state, void *user_data) {
    switch (state->count) {
        case 1:
            SEND_STRING(SS_LCTL("a"));
            break;
        case 2:
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING(SS_LCTL("a"));
            break;
        case 3:
            SEND_STRING(SS_LCTL("a"));
            SEND_STRING(SS_LSFT("\""));
            break;
    }
}

// Tap Dance
qk_tap_dance_action_t tap_dance_actions[] = {
  // Tap once for Escape, twice for Caps Lock
  [TD_SC_C] = ACTION_TAP_DANCE_DOUBLE(KC_SCLN, KC_COLN),
  [TD_SQDQ] = ACTION_TAP_DANCE_DOUBLE(KC_QUOT, KC_DQUO),
  [TD_LBRC] = ACTION_TAP_DANCE_DOUBLE(KC_LCBR, KC_LBRC),
  [TD_RBRC] = ACTION_TAP_DANCE_DOUBLE(KC_RCBR, KC_RBRC),
  [TD_SCTP] = ACTION_TAP_DANCE_FN(screen_taps),
  [TD_9_0] = ACTION_TAP_DANCE_DOUBLE(KC_9, KC_0),
  [TD_VI_Z] = ACTION_TAP_DANCE_DOUBLE(NVIMZ, NVIMUZ),
};
      
// Saving for the future when I have a speaker
// void leader_start(void) {
// #ifdef AUDIO_ENABLE
//     PLAY_SONG(leader_start);
// #endif
// }
// 
// void leader_end(void) {
//   if (did_leader_succeed) {
// #ifdef AUDIO_ENABLE
//     PLAY_SONG(leader_succeed);
// #endif
//   } else {
// #ifdef AUDIO_ENABLE
//     PLAY_SONG(leader_fail);
// #endif
//   }
// }

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [_QWERTY] = LAYOUT_5x6(
     KC_ESC , KC_1  , KC_2  , KC_3  , KC_4  , KC_5  ,                         KC_6  , KC_7  , KC_8  , KC_9  , KC_0  ,KC_BSPC,
     KC_TAB , KC_Q  , KC_W  , KC_E  , KC_R  , KC_T  ,                         KC_Y  , KC_U  , KC_I  , KC_O  , KC_P  ,KC_MINS,
     KC_LSFT, KC_A  , KC_S  , KC_D  , KC_F  , KC_G  ,                         KC_H  , KC_J  , KC_K  , KC_L  ,TD(TD_SC_C),TD(TD_SQDQ),
     KC_LCTL, KC_Z  , KC_X  , KC_C  , KC_V  , KC_B  ,                         KC_N  , KC_M  ,KC_COMM,KC_DOT ,KC_SLSH,KC_BSLASH,
                                      KC_LBRC,KC_RBRC,                    KC_PLUS, KC_EQL,
                                      TMUXLAY,RAISE,                    KC_SPC, KC_ENT,
                                      RAISE,KC_LGUI,                      NEOVIM, MLAYER,
                                      KC_LALT, TD(TD_SCTP),                   KC_LEAD, LAYER2
  ),
  [_RAISE] = LAYOUT_5x6(
       KC_TILD,S(KC_1),S(KC_2),S(KC_3),S(KC_4),S(KC_5),                        S(KC_6),S(KC_7),S(KC_8),S(KC_9),S(KC_0),KC_DEL,
       KC_GRV ,KC_6   ,KC_7   ,KC_8   ,TD(TD_9_0),KC_LBRC,                     KC_RBRC,KC_PGDN,KC_PGUP,KC_INS ,KC_SLCK,KC_MUTE,
       _______,KC_LEFT,KC_UP  ,KC_DOWN,KC_RGHT,KC_LPRN,                        KC_LEFT,KC_DOWN,KC_UP  ,KC_RGHT,_______,KC_VOLU,
       _______,KC_DEL ,SPOILER, CBLOCK,KC_SPC ,KC_LCBR,                        KC_RCBR,_______,_______,_______,KC_TILD,KC_VOLD,
                                               KC_WH_U,KC_WH_D,            KC_EQL ,_______,
                                               KC_DEL ,_______,            TD(TD_LBRC),TD(TD_RBRC),
                                               _______,_______,            _______,KC_ESC,
                                               SNGLEFT,_______,            KC_BTN3,_______
  ),
  [_NEOVIM] = LAYOUT_5x6(
       _______,VIMJOUR,VIMKEYM,_______,_______,_______,                        NVIMRL ,NVIMRD ,NVIMRU ,NVIMRR ,_______,_______,
       _______,VIMQUIT,VIMSAVE,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
       _______,_______,NVIMSPL,DAPBACK,DAPFORW,_______,                        NVIML  ,NVIMD  ,NVIMU  ,NVIMR  ,_______,_______,
       _______,VIMFOLD,DAPTERM,_______,NVIMVSP,DAPBPNT,                    TD(TD_VI_Z),_______,NVIMPT ,NVIMNT ,_______,NVIMVSP,
                                               DAPBACK,DAPFORW,            _______,_______,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,_______
  ),
  [_MLAYER] = LAYOUT_5x6(
       _______, KC_F1 , KC_F2 , KC_F3 , KC_F4 , KC_F5 ,                        KC_F6  , KC_F7 , KC_F8 , KC_F9 ,KC_F10 ,KC_DEL ,
       _______,KC_BTN1,KC_MS_U,KC_BTN2,XXXXXXX,KC_WH_U,                        BPAGE  ,KC_PGDN,KC_PGUP,BBPAGE ,_______,_______,
       _______,KC_MS_L,KC_MS_D,KC_MS_R,XXXXXXX,KC_WH_D,                        BBTAB  ,KC_HOME,KC_END ,BTAB   ,_______,_______,
       _______,KC_F11 ,KC_F12 ,_______,XXXXXXX,_______,                        _______,_______,_______,_______,_______,_______,
                                               _______,_______,            KC_WH_U,KC_WH_D,
                                               KC_BTN2,KC_BTN1,            KC_BTN1,KC_BTN4,
                                               _______,QWERTO ,            _______,_______,
                                               _______,_______,            _______,SNGRGHT
  ),
  [_TMUXLAY] = LAYOUT_5x6(
       TMUX0  ,TMUX1  ,TMUX2  ,TMUX3  ,TMUX4  ,TMUX5  ,                        TMUXRL ,TMUXRD ,TMUXRU ,TMUXRR ,_______,_______,
       _______,TMUX6  ,TMUX7  ,TMUX8  ,TMUX9  ,_______,                        TMUXLOG,XXXXXXX,XXXXXXX,XXXXXXX,_______,_______,
       _______,TMUXTIT,TMUXSPL,_______,TMUXZ  ,_______,                        TMUXL  ,TMUXD  ,TMUXU  ,TMUXR  ,_______,TMUXMNU,
       _______,TMUXZ  ,_______,TMUXNEW,_______,TMUXLOG,                        TMUXZ  ,_______,TMUXPRV,TMUXNXT,_______,TMUXVSP,
                                               TMUXMVU,TMUXMVD,            _______,_______,
                                               _______,_______,            TMUXMNU,TMUXLST,
                                               _______,_______,            TMUXCMD,_______,
                                               _______,_______,            _______,_______
  ),
  [_LAYER2] = LAYOUT_5x6(
       _______,KC_F11 ,KC_F12 ,_______,DIGCF  , LOGCOM,                        _______,_______,_______,_______,_______,KC_DEL ,
       FZFCOMP,KC_BTN1,KC_MS_U,KC_BTN2,SSH192 ,SSH192 ,                        BPAGE  ,KC_PGDN,KC_PGUP,BBPAGE ,_______,_______,
       _______,KC_MS_L,KC_MS_D,KC_MS_R,DIGGOOG,SSHPDEV,                        BBTAB  ,KC_HOME,KC_END ,BTAB   ,_______,_______,
       DM_REC1,DM_RSTP,DM_PLY1,_______,TERM256,TERM   ,                        DM_REC2,DM_RSTP,DM_PLY2,_______,_______,_______,
                                               _______,_______,            _______,_______,
                                               KC_DEL ,_______,            _______,_______,
                                               KC_ESC ,KC_WH_U,            _______,_______,
                                               _______,KC_WH_D,            _______,_______
  ),
  [_NUMLAY] = LAYOUT_5x6(
        _______,KC_1   ,KC_2   ,KC_3   ,_______,KC_PLUS,                        KC_MINS,KC_EQL ,KC_0   ,KC_DOT ,_______,_______,
        _______,KC_4   ,KC_5   ,KC_6   ,_______,KC_LCBR,                        KC_RCBR,KC_1   ,KC_2   ,KC_3   ,_______,_______,
        _______,KC_7   ,KC_8   ,KC_9   ,_______,KC_LPRN,                        KC_RPRN,KC_4   ,KC_5   ,KC_6   ,_______,_______,
        _______,_______,KC_0   ,KC_DOT ,_______,KC_LBRC,                        KC_RBRC,KC_7   ,KC_8   ,KC_9   ,_______,_______,
                                                _______,_______,            _______,_______,
                                                _______,_______,            _______,_______,
                                                _______,_______,            _______,_______,
                                                _______,_______,            _______,_______
  ),
  [_LEFTONLY] = LAYOUT_5x6(
       KC_ESC ,KC_1   ,KC_2   ,KC_3   ,KC_4   ,KC_5   ,                        QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,
       KC_TAB , KC_Q  , KC_W  , KC_E  , KC_R  , KC_T  ,                        QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,
       KC_LSFT, KC_A  , KC_S  , KC_D  , KC_F  , KC_G  ,                        QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,
       KC_LCTL, KC_Z  , KC_X  , KC_C  , KC_V  , KC_B  ,                        QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,
                                             KC_LBRC,KC_RBRC,              QWERTO ,QWERTO ,
                                             TMUXLAY,RAISE  ,              QWERTO ,QWERTO ,
                                             RAISE  ,KC_LGUI,              QWERTO ,QWERTO ,
                                             KC_ENT ,KC_SPC ,              QWERTO ,QWERTO 
  ),
  [_RGHTONLY] = LAYOUT_5x6(
       QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,                        KC_6  , KC_7  , KC_8  , KC_9  , KC_0  ,KC_BSPC,
       QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,                        KC_Y  , KC_U  , KC_I  , KC_O  , KC_P  ,KC_MINS,
       QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,                        KC_H  , KC_J  , KC_K  , KC_L  ,TD(TD_SC_C),TD(TD_SQDQ),
       QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,QWERTO ,                        KC_N  , KC_M  ,KC_COMM,KC_DOT ,KC_SLSH,KC_BSLASH,
                                               QWERTO ,QWERTO ,            KC_PLUS, KC_EQL ,
                                               QWERTO ,QWERTO ,            KC_SPC , KC_ENT ,
                                               QWERTO ,QWERTO ,            KC_SCLN, MLAYER ,
                                               QWERTO ,QWERTO ,            KC_LEAD, LAYER2
  ),
};

// Plans for single handed keyboard modes:
// 
// single left, when using the mouse, playing a FPS, cad work, etc.
// Reqs:
// from right: space, enter, vi leader, 6-9, backspace, browser mod?, brackets, 
// New: enter single left operation, revert to standard operation
// Keep:
// 
// single right, when standing up and needing to quick enter something
// Reqs:
// from left: mod, i3 mod, tmux mod, 1-5, brackets, shift, esc, tab?, ctrl, 
// New: enter single right operation, revert to standard operation, 
// Keep: letters, numbers, 
//
//
//
//   [_TMPLAT] = LAYOUT_5x6(
//        _______,_______,_______,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
//        _______,_______,_______,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
//        _______,_______,_______,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
//        _______,_______,_______,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
//                                                _______,_______,            _______,_______,
//                                                _______,_______,            _______,_______,
//                                                _______,_______,            _______,_______,
//                                                _______,_______,            _______,_______
//   ),

/* 

// Thumb clusters, match to the comments in the keymaps
//
//         +----+
// +----+  |    |                                          +-----+
// |    |  | 2  | +----+                                   |     | +----+
// | 1  |  |    | |    |                           +-----+ | 7   | |    |
// |    |  +----+ | 4  |                           |     | |     | | 8  |
// +----+         |    | +----+             +----+ |  9  | +-----+ |    k|
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
