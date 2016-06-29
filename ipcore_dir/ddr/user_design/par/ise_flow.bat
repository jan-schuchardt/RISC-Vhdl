call rem_files.bat



echo Synthesis Tool: XST

mkdir "../synth/__projnav" > ise_flow_results.txt
mkdir "../synth/xst" >> ise_flow_results.txt
mkdir "../synth/xst/work" >> ise_flow_results.txt

xst -ifn ise_run.txt -ofn mem_interface_top.syr -intstyle ise >> ise_flow_results.txt
ngdbuild -intstyle ise -dd ../synth/_ngo -uc ddr.ucf -p xc3s700afg484-4 ddr.ngc ddr.ngd >> ise_flow_results.txt

map -intstyle ise -detail -cm speed -pr off -c 100 -o ddr_map.ncd ddr.ngd ddr.pcf >> ise_flow_results.txt
par -w -intstyle ise -ol std -t 1 ddr_map.ncd ddr.ncd ddr.pcf >> ise_flow_results.txt
trce -e 100 ddr.ncd ddr.pcf >> ise_flow_results.txt
bitgen -intstyle ise -f mem_interface_top.ut ddr.ncd >> ise_flow_results.txt

echo done!
