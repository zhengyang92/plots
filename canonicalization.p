#
# Perform initial configuration:
#   We want to use histograms and to use those funny patterns used in all
#   black-and-white papers (this is done with the style fill command below).
#
#set terminal postscript enhanced "Times-Roman" 18 fontfile "utmr8a.pfb"
set terminal pdf monochrome enhanced size 8,6 font "times new roman,14" lw 1

set style line 2 lc rgb 'black' lt 1 lw 1
set output "canonicalization.pdf"
set datafile separator ","
set boxwidth
#set bars fullwidth
#set style data histograms
#set style data yerrorlines
set style data histogram
set style histogram cluster gap 1
# to show errorbar, uncomment the next line
#set style histogram errorbars gap 2 lw 1
set style fill pattern border -1
#set style fill pattern 5 border -1
set key reverse left Left font "Monaco,20" height 0.5
set border lw 2
set key box lw 1
set key box width 0 

set grid ls 4 #linestyle 4
set tics scale 0

set xtics format ""
set xtic rotate by -10 scale 0
#set grid ytics
#mset grid xtics

#
# Label the axis
#
set xlabel "Benchmarks" font "times new roman,20"
set ylabel "Execution Time (s)" font "times new roman,20"

#
# Set the range of the y axis
#
#set yrange [0:550]
#set xrange [0:1000]

#
# Plot the average of the three data points
#   xticlabels: Tells the plot where to find the x-axis labels
#
   set xtics noenhanced font "times new roman,14"
# with errorbar
plot "<(sed -n '32,41p' data/llvm+instcombine-canonicalization.csv)" using 3:xtic(1) title "llvm +instcombine -canonicalizer (base)" ls 2, \
     "<(sed -n '32,41p' data/llvm-instcombine+canonicalization.csv)" using 3:xtic(1) title "llvm -instcombine +canonicalizer" ls 2, \
     "<(sed -n '32,41p' data/llvm-instcombine-canonicalization.csv)" using 3:xtic(1) title "llvm -instcombine -canonicalizer" ls 2, \
     "<(sed -n '32,41p' data/souper+instcombine-canonicalization.csv)" using 3:xtic(1) title "souper +instcombine -canonicalizer" ls 2, \
     "<(sed -n '32,41p' data/souper-instcombine+canonicalization.csv)" using 3:xtic(1) title "souper -instcombine +canonicalizer" ls 2, \
