#include QMK_KEYBOARD_H

#define _QWERTY 0
#define _LAYER2 1
#define _RAISE 2
#define _MLAYER 3
#define _TMUXLAY 4
#define _NEOVIM 5
#define _NUMLAY 6

#define LAYER2 MO(_LAYER2)
#define RAISE MO(_RAISE)
#define MLAYER MO(_MLAYER)
#define TMUXLAY MO(_TMUXLAY)
#define NEOVIM MO(_NEOVIM)
#define NUMLAY MO(_NUMLAY)

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
    VIMJOUR,
    VIMKEYM,
    NVIMSF3,
    NVIMSF4,
    NVIMSF5,
    NVIMSF6,
    NVIMSF7,
    NVIMSF8,
    VIMQUIT,
    VIMSAVE,
    NVIMSPL,
    DAPBACK,
    DAPFORW,
    VIMFOLD,
    DAPTERM,
    DAPBPNT,
    DAPCONT,
    NVIMPT,
    NVIMNT,
    NVIMVSP,
    DAPUI_T,
    SHIFINS
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_QWERTY] = LAYOUT_5x6(
        KC_ESC , KC_1  , KC_2  , KC_3  , KC_4  , KC_5  ,                         KC_6  , KC_7  , KC_8  , KC_9  , KC_0  ,KC_BSPC,
        KC_TAB , KC_Q  , KC_W  , KC_E  , KC_R  , KC_T  ,                         KC_Y  , KC_U  , KC_I  , KC_O  , KC_P  ,KC_MINS,
        KC_LSFT, KC_A  , KC_S  , KC_D  , KC_F  , KC_G  ,                         KC_H  , KC_J  , KC_K  , KC_L  ,KC_SCLN,KC_QUOT,
        KC_LCTL, KC_Z  , KC_X  , KC_C  , KC_V  , KC_B  ,                         KC_N  , KC_M  ,KC_COMM,KC_DOT ,KC_SLSH,KC_BSLS,
                         KC_LBRC,KC_RBRC,                                                       KC_PLUS, KC_EQL,
                                         TMUXLAY,RAISE,                        KC_SPC, KC_ENT,
                                         _______,KC_LGUI,                      NEOVIM,MLAYER,
                                         _______,KC_LALT,                      _______, LAYER2
    ),
    [_RAISE] = LAYOUT_5x6(
        KC_TILD,S(KC_1),S(KC_2),S(KC_3),S(KC_4),S(KC_5),                        S(KC_6),S(KC_7),S(KC_8),S(KC_9),S(KC_0),KC_DEL,
        KC_GRV ,KC_6   ,KC_7   ,KC_8   ,_______,KC_LBRC,                     KC_RBRC,KC_PGDN,KC_PGUP,KC_INS ,KC_SCRL,KC_MUTE,
        _______,KC_LEFT,KC_UP  ,KC_DOWN,KC_RGHT,KC_LPRN,                        KC_LEFT,KC_DOWN,KC_UP  ,KC_RGHT,_______,KC_VOLU,
        _______,KC_DEL ,_______,_______,KC_SPC ,KC_LCBR,                        KC_RCBR,_______,_______,_______,KC_TILD,KC_VOLD,
                                                MS_WHLU,_______,            KC_EQL ,_______,
                                                KC_DEL ,_______,            KC_SPC ,KC_ENT ,
                                                UG_TOGG,_______,            _______,KC_ESC,
                                                _______,_______,            MS_BTN3,SHIFINS
    ),
    [_LAYER2] = LAYOUT_5x6(
       _______,KC_F11 ,KC_F12 ,_______,DIGCF  , LOGCOM,                        _______,_______,_______,_______,_______,KC_DEL ,
       FZFCOMP,MS_BTN1,MS_UP,MS_BTN2,SSH192 ,SSH192 ,                        BPAGE  ,KC_PGDN,KC_PGUP,BBPAGE ,_______,_______,
       _______,MS_LEFT,MS_DOWN,MS_RGHT,DIGGOOG,SSHPDEV,                        BBTAB  ,KC_HOME,KC_END ,BTAB   ,_______,_______,
       DM_REC1,DM_RSTP,DM_PLY1,_______,TERM256,TERM   ,                        DM_REC2,DM_RSTP,DM_PLY2,_______,_______,_______,
                                               _______,_______,            _______,_______,
                                               KC_DEL ,SHIFINS,            _______,_______,
                                               KC_ESC ,MS_WHLU,            _______,_______,
                                               _______,MS_WHLD,            _______,_______
    ),
    [_MLAYER] = LAYOUT_5x6(
       _______, KC_F1 , KC_F2 , KC_F3 , KC_F4 , KC_F5 ,                        KC_F6  , KC_F7 , KC_F8 , KC_F9 ,KC_F10 ,KC_DEL ,
       _______,MS_BTN1,MS_UP  ,MS_BTN2,_______,MS_WHLU,                        BPAGE  ,KC_PGDN,KC_PGUP,BBPAGE ,_______,_______,
       _______,MS_LEFT,MS_DOWN,MS_RGHT,_______,MS_WHLD,                        BBTAB  ,KC_HOME,KC_END ,BTAB   ,_______,_______,
       _______,KC_F11 ,KC_F12 ,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
                                               _______,_______,            MS_WHLU,MS_WHLD,
                                               MS_BTN2,MS_BTN1,            MS_BTN1,MS_BTN4,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,_______
    ),
    [_TMUXLAY] = LAYOUT_5x6(
       TMUX0  ,TMUX1  ,TMUX2  ,TMUX3  ,TMUX4  ,TMUX5  ,                        TMUXRL ,TMUXRD ,TMUXRU ,TMUXRR ,_______,_______,
       _______,TMUX6  ,TMUX7  ,TMUX8  ,TMUX9  ,_______,                        TMUXLOG,_______,_______,_______,_______,_______,
       _______,TMUXTIT,TMUXSPL,_______,TMUXZ  ,_______,                        TMUXL  ,TMUXD  ,TMUXU  ,TMUXR  ,_______,TMUXMNU,
       _______,TMUXZ  ,_______,TMUXNEW,_______,TMUXLOG,                        TMUXZ  ,_______,TMUXPRV,TMUXNXT,_______,TMUXVSP,
                                               TMUXMVU,TMUXMVD,            _______,_______,
                                               _______,_______,            TMUXMNU,TMUXLST,
                                               _______,_______,            TMUXCMD,_______,
                                               _______,_______,            _______,_______
    ),
    [_NEOVIM] = LAYOUT_5x6(
       _______,VIMJOUR,VIMKEYM,NVIMSF3,NVIMSF4,NVIMSF5,                        NVIMRL ,NVIMRD ,NVIMRU ,NVIMRR ,_______,_______,
       _______,_______,_______,_______,_______,_______,                        _______,_______,_______,_______,_______,_______,
       _______,_______,NVIMSPL,DAPBACK,DAPFORW,_______,                        NVIML  ,NVIMD  ,NVIMU  ,NVIMR  ,_______,_______,
       _______,VIMFOLD,DAPTERM,_______,NVIMVSP,DAPBPNT,                        _______,_______,NVIMPT ,NVIMNT ,_______,NVIMVSP,
                                               DAPBACK,DAPFORW,            _______,_______,
                                               DAPUI_T,DAPCONT,            _______,_______,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,_______
    )
};

// MACROS
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
    case SCREENA:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING(SS_LCTL("A"));
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
            SEND_STRING("ssh 192.168.1.");
        } else {
            // when keycode is released
        }
        break;
    case DIGGOOG:
        if (record->event.pressed) {
            // when keycode is pressed
            SEND_STRING("dig @192.168.1.3 ");
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
            tap_code(KC_UP);
            SEND_STRING(("\' >> ~/.commands"));
            tap_code(KC_ESC);
            tap_code(KC_ESC);
            tap_code(KC_ESC);
            SEND_STRING(("I"));
            SEND_STRING(("echo \'"));
            tap_code(KC_ENT);
        } else {
            // when keycode is released
        }
        break;
    case NVIML:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("\\nh"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMR:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("\\nl"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMU:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("\\nk"));
        } else {
            // when keycode is released
        }
        break;
    case NVIMD:
        if (record->event.pressed) {
            SEND_STRING(SS_LCTL("\\nj"));
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
    case NVIMSF3:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F3);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case NVIMSF4:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F4);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case NVIMSF5:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F5);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case NVIMSF6:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F6);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case NVIMSF7:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F7);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case NVIMSF8:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F8);
            unregister_code(KC_LSFT);
        } else {
            // when keycode is released
        }
        break;
    case DAPUI_T:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            register_code(KC_LSFT);
            tap_code(KC_F9);
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
    case DAPCONT:
        if (record->event.pressed) {
            tap_code(KC_ESC);
            SEND_STRING(":DapContinue\n");
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
    case SHIFINS:
        if (record->event.pressed) {
            register_code(KC_LSFT);
            register_code(KC_INS);
            unregister_code(KC_LSFT);
            unregister_code(KC_INS);
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

