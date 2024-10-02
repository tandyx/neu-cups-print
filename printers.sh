#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Run as root for system-wide config"
#     exit
fi

lpinfo -m >/dev/null 2>&1 || {
    echo >&2 "CUPS is required, but not installed. Aborting."
    exit 1
}

DRIVER="everywhere"

echo "Configuring printers"
lpadmin -p "8.5x11BW" -D "Northeastern PaperCut 8.5x11 BW" -E -m $DRIVER -v "ipp://rpc.pc-printer-discovery.nunet.neu.edu:9163/printers/PaperCut+-+8.5x11+BW_Authenticated"

lpadmin -p "8.5x11Color" -D "Northeastern PaperCut 8.5x11 Color" -E -m $DRIVER -v "ipp://rpc.pc-printer-discovery.nunet.neu.edu:9163/printers/PaperCut+-+8.5x11+Color_Authenticated"

lpadmin -p "11x17BW" -D "Northeastern PaperCut 11x17 BW" -E -m $DRIVER -v "ipp://rpc.pc-printer-discovery.nunet.neu.edu:9163/printers/PaperCut+-+11x17+BW+Tabloid_Authenticated"

lpadmin -p "11x17Color" -D "Northeastern PaperCut 11x17 Color" -E -m $DRIVER -v "ipp://rpc.pc-printer-discovery.nunet.neu.edu:9163/printers/PaperCut+-+11x17+Color+Tabloid_Authenticated"

echo "8.5x11 and 11x17 in both BW and Color variants have been added."

echo "There is a Knowledge Base article with additional information if this scipt is not working: KB0013756 as of 8/22/2019"
