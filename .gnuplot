# Default colors for gnuplot
#
# Configured to use simlar styles from grafana

set macros

FONT            = 'font "Helvetica"'
FONT_COLOR      = '"#D8D9DA"'
TEXT_COLOR      = 'textcolor rgb '.FONT_COLOR
BKGRND_COLOR    = '"#1f1d1d"'
BKGRND          = 'background rgb '.BKGRND_COLOR
LINE_COLOR      = 'linecolor rgb "#545454"'

USE_PNG_TERM    = "set terminal png size 1024.768 ".FONT.BKGRND
USE_SVG_TERM    = "set terminal svg size 1024,768 dynamic ".FONT.BKGRND
USE_CANVAS_TERM = "set terminal canvas size 1024.768 standalone ".FONT.BKGRND

WITH_POINTS     = 'pointtype 7 pointsize .5'
THICK           = 'linewidth 2'


# Titles
set title   @TEXT_COLOR

# Tic and label styles
set xlabel  @TEXT_COLOR
set xtic    @TEXT_COLOR
set x2label @TEXT_COLOR
set x2tic   @TEXT_COLOR
set ylabel  @TEXT_COLOR
set ytic    @TEXT_COLOR
set y2label @TEXT_COLOR
set y2tic   @TEXT_COLOR

# Legend (Key) Styles
set key left bottom outside horizontal nobox @TEXT_COLOR

# Border styles
set style line 80 linetype 1 @LINE_COLOR
set border 11 back linestyle 80

# Grid styles
set style line 81 linetype 1 @LINE_COLOR linewidth 0.5
set grid xtics
set grid ytics
set grid back ls 81

# Use lines type by default
set style data lines

# Default lines styles
set style line 1 linetype 1 linewidth 2
set style line 1 default



# Colors

GREEN         = '"#7EB26D"'
YELLOW        = '"#EAB839"'
TEAL          = '"#6ED0E0"'
ORANGE        = '"#EF843C"'
RED           = '"#E24D42"'
BLUE          = '"#1F78C1"'
PURPLE        = '"#BA43A9"'
VIOLET        = '"#705DA0"'

PALE_GREEN    = '"#508642"'
PALE_YELLOW   = '"#CCA300"'
PALE_TEAL     = '"#447EBC"'
PALE_ORANGE   = '"#C15C17"'
PALE_RED      = '"#890F02"'
PALE_BLUE     = '"#0A437C"'
PALE_PURPLE   = '"#6D1F62"'
PALE_VIOLET   = '"#584477"'

VIVID_GREEN   = '"#629E51"'
VIVID_YELLOW  = '"#E5AC0E"'
VIVID_TEAL    = '"#64B0C8"'
VIVID_ORANGE  = '"#E0752D"'
VIVID_RED     = '"#BF1B00"'
VIVID_BLUE    = '"#0A50A1"'
VIVID_PURPLE  = '"#962D82"'
VIVID_VIOLET  = '"#614D93"'

LIGHT_GREEN   = '"#9AC48A"'
LIGHT_YELLOW  = '"#F2C96D"'
LIGHT_TEAL    = '"#65C5DB"'
LIGHT_ORANGE  = '"#F9934E"'
LIGHT_RED     = '"#EA6460"'
LIGHT_BLUE    = '"#5195CE"'
LIGHT_PURPLE  = '"#D683CE"'
LIGHT_VIOLET  = '"#806EB7"'

DARK_GREEN    = '"#3F6833"'
DARK_YELLOW   = '"#967302"'
DARK_TEAL     = '"#2F575E"'
DARK_ORANGE   = '"#99440A"'
DARK_RED      = '"#58140C"'
DARK_BLUE     = '"#052B51"'
DARK_PURPLE   = '"#511749"'
DARK_VIOLET   = '"#3F2B5B"'

BRIGHT_GREEN  = '"#E0F9D7"'
BRIGHT_YELLOW = '"#FCEACA"'
BRIGHT_TEAL   = '"#CFFAFF"'
BRIGHT_ORANGE = '"#F9E2D2"'
BRIGHT_RED    = '"#FCE2DE"'
BRIGHT_BLUE   = '"#BADFF4"'
BRIGHT_PURPLE = '"#F9D9F9"'
BRIGHT_VIOLET = '"#DEDAF7"'
