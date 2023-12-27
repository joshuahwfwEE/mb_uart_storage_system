this project contain a simple system with xilinx microblaze processor and xilinx axi_uartlite controller and run on xilinx FPGA VU19P, which is in the Synopsys HAPS-100-1F  
this design required daughtcard: hdmi_mgb2_v11 as the uart io interface and ddr4_ht3_8G as the external storage device.  

design purpose:  
this design can recieve data form axi_uartlite RX and converting the incoming characters into 34-bit command words, and then store the words to FIFO and then send to external memory,  
issuing those commands across the bus, and then recoding the 34-bit command results back for transmission across the serial port through microblaze processor  

if adding something ip which can accessing this memory device, it can be accessed through any other interface  
for example:  
a synopsys ip that can be used for accessing the memory and be control by their own runtime env, they can choose the perfer env to develope their application.  

pros & cons:
1. it can be used for development the application in customize env, does not necessary to be bond with xilinx toolchain
2. microblaze and uart contoller used for receiving, converting, storing, decoding transmiting, for the large design, microblaze could not work fine.

hence next version, I will update a axi_master for receive and transmit the uart data directly instead of taking too much effort in the microblaze.    

how to use:  
you can open vivado 2022.2  
open tcl command line  
source create_proj_1.tcl  
you will get a whole design without running the synthesis and implement yet
you can directly run generate the bitstream in the GUI or,  
source build_bitstrem.tcl  
you will get the bit file in the proj1.runs  
source check_proj_1_timing.tcl  
it will automatve to check the design met timing requirement or nor.
