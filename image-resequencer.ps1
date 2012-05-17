##
# Made this to rename timestamp-tagged files (ISO8601, so they alpha-sort properly) to a format recognized by all image sequence editors/movie makers.
# I have quite a few files, and building the sort list took 820MB of memory for me, so caveat emptor.
##
param([string] $directory = $(throw "Directory required."), [string] $prefix = "image")

Dir $directory | Sort -property Name | ForEach-Object -begin { $i=1 } -process { rename-item $_ -NewName "$prefix-$i.jpg"; $i++ }

