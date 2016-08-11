call rem_files.bat



echo Synthesis Tool: XST

mkdir "../synth/__projnav" > ise_flow_results.txt
mkdir "../synth/xst" >> ise_flow_results.txt
mkdir "../synth/xst/work" >> ise_flow_results.txt

xst -ifn ise_run.txt -ofn mem_interface_top.syr -intstyle ise >> ise_flow_results.txt
ngdbuild -intstyle ise -dd ../synth/_ngo -uc testrambreiter.ucf -p xc3s700afg484-4 testrambreiter.ngc testrambreiter.ngd >> ise_flow_results.txt

map -intstyle ise -detail -cm speed -pr off -c 100 -o testrambreiter_map.ncd testrambreiter.ngd testrambreiter.pcf >> ise_flow_results.txt
par -w -intstyle ise -ol std -t 1 testrambreiter_map.ncd testrambreiter.ncd testrambreiter.pcf >> ise_flow_results.txt
trce -e 100 testrambreiter.ncd testrambreiter.pcf >> ise_flow_results.txt
bitgen -intstyle ise -f mem_interface_top.ut testrambreiter.ncd >> ise_flow_results.txt

echo done!
