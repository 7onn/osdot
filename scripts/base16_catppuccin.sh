#!/bin/sh

export BASE16_THEME=catppuccin

# Catppuccin Macchiato color scheme
color00="24/27/3a" # Base 00 - Black (base)
color01="ed/87/96" # Base 08 - Red
color02="a6/da/95" # Base 0B - Green
color03="ee/d4/9f" # Base 0A - Yellow
color04="8a/ad/f4" # Base 0D - Blue
color05="c6/a0/f6" # Base 0E - Magenta (mauve)
color06="8b/d5/ca" # Base 0C - Cyan (teal)
color07="ca/d3/f5" # Base 05 - White (text)
color08="49/4d/64" # Base 03 - Bright Black (surface1)
color09=$color01   # Base 08 - Bright Red
color10=$color02   # Base 0B - Bright Green
color11=$color03   # Base 0A - Bright Yellow
color12=$color04   # Base 0D - Bright Blue
color13=$color05   # Base 0E - Bright Magenta
color14=$color06   # Base 0C - Bright Cyan
color15="b7/bd/f8" # Base 07 - Bright White (lavender)
color16="f5/a9/7f" # Base 09 - Peach
color17="f0/c6/c6" # Base 0F - Flamingo
color18="1e/20/30" # Base 01 - Mantle
color19="36/3a/4f" # Base 02 - Surface0
color20="5b/60/78" # Base 04 - Surface2
color21="f4/db/d6" # Base 06 - Rosewater

color_foreground="ca/d3/f5" # Base 05 - Text
color_background="24/27/3a" # Base 00 - Base (background)

if [ -n "$TMUX" ]; then
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  put_template_custom Pg cad3f5 # foreground
  put_template_custom Ph 24273a # background
  put_template_custom Pi cad3f5 # bold color
  put_template_custom Pj 363a4f # selection color
  put_template_custom Pk cad3f5 # selected text color
  put_template_custom Pl cad3f5 # cursor
  put_template_custom Pm 24273a # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

