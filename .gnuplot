# Default colors for gnuplot
#
# Configured to use simlar styles from grafana

set macros

FONT            = 'font "Helvetica"'
FONT_COLOR      = '"#D8D9DA"'
TEXT_COLOR      = 'textcolor rgb '.FONT_COLOR
BKGRND       = 'background rgb "#1f1d1d"'

USE_PNG_TERM    = "set terminal png size 1024.768 ".FONT.BKGRND
USE_SVG_TERM    = "set terminal svg size 1024,768 dynamic ".FONT.BKGRND
USE_CANVAS_TERM = "set terminal canvas size 1024.768 standalone ".FONT.BKGRND


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
set style line 80 linetype 1 linecolor rgb "#545454"
set border 11 back linestyle 80

# Grid styles
set style line 81 linetype 1 linecolor rgb "#545454" linewidth 0.5
set grid xtics
set grid ytics
set grid back ls 81

# Use lines type by default
set style data lines

# Default lines styles
set linetype 1 linecolor rgb "#6ED0E0" linewidth 2
set linetype 2 linecolor rgb "#7EB26D" linewidth 2
set linetype 3 linecolor rgb "#EAB839" linewidth 2
set linetype 4 linecolor rgb "#E24D42" linewidth 2
