This contains steps to install fpga and run successfully Steps to follow:

    1.Install the zip provided i.e fpga.zip onto Desktop
    2.now open terminal and go to the fpga folder
    3.In here /Desktop/fpga type: chmod +x setup.sh --> This command is particularly useful for making scripts and programs executable. In this way, users can run them without typing their full path or using a dot slash (./) before their name.
    4.sudo bash setup.sh
    5.After running the above command, Go to: file Manager --> Other Locations --> Computer --> root . Copy the files Symbiflow and Pygmy-dev paste them in "/desktop/fpga"
    Now download arch.tar.gz using this below link and also place it in /desktop/fpga:

    6.https://iith-my.sharepoint.com/:u:/g/personal/gadepall_ee_iith_ac_in/Ebot5QHEYXBAo-7n4hnvJu0B8vMrTIdj_COHJC2cmDY1ww?e=bqDxHI

    7.Make sure that /desktop/fpga contains pygmy-dev, setup.sh and symbiflow and zip file arch.tar.gz
    8.Next: At Home:

    sudo apt update -y 

    sudo apt upgrade -y

    sudo apt install openssh-server sshpass build-essential libssl-dev libffi-dev python3-dev bison flex git tcl-dev tcl tcl-tclreadline libreadline-dev  autoconf libtool make automake texinfo pkg-config libusb-1.0-0 libusb-1.0-0-dev gcc-arm-none-eabi libnewlib-arm-none-eabi telnet python3 apt-utils libxslt-dev cmake curl python3-pip python3-venv -y

    pip3 install gdown lxml simplejson

    sudo apt install openssh-server sshpass

    sudo apt install build-essential libssl-dev libffi-dev python3-dev bison flex git tcl-dev tcl tcl-tclreadline libreadline-dev  autoconf libtool make automake texinfo pkg-config libusb-1.0-0 libusb-1.0-0-dev gcc-arm-none-eabi libnewlib-arm-none-eabi telnet python3 apt-utils libxslt-dev python3-lxml python3-simplejson cmake curl  python3-setuptools python3-pip

    cp arch.tar.gz /home/nikhil/Desktop/fpga/arch.tar.gz

    export INSTALL_DIR=/home/"Username"/Desktop/fpga/symbiflow

    tar -C $INSTALL_DIR  -xvf /home/nikhil/Desktop/fpga/arch.tar.gz

    export PATH="$INSTALL_DIR/quicklogic-arch-defs/bin:$INSTALL_DIR/quicklogic-arch-defs/bin/python3:$PATH"

    cd /home/nikhil/Desktop/fpga/pygmy-dev/tools/quicklogic-fasm

    nvim requirements.txt

       Replace contents with these lines:
          -e git+https://github.com/symbiflow/fasm.git#egg=fasm
          -e git+https://github.com/antmicro/quicklogic-fasm-utils.git#egg=fasm-utils

       
    python3 -m venv venv

    source venv/bin/activate


    pip3 install -r requirements.txt

    sudo python3 setup.py install

    cd /home/nikhil/Desktop/fpga/pygmy-dev/tools/quicklogic-yosys

    make config-gcc

    make -j4 install PREFIX=$INSTALL_DIR

    cd /home/nikhil/Desktop/fpga/pygmy-dev/tools/yosys-symbiflow-plugins

    export PATH=$INSTALL_DIR/bin:$PATH

    make -j4 install

    cd /home/nikhil/Desktop/fpga/pygmy-dev/tools/vtr-verilog-to-routing

    make -j4

    nvim ~/.bashrc

    #paste the following 3 lines at the end of the file
    export  INSTALL_DIR=/home/nikhil/Desktop/fpga/symbiflow
    export PATH="$INSTALL_DIR/quicklogic-arch-defs/bin:$INSTALL_DIR/quicklogic-arch-defs/bin/python3:$PATH"
    export PATH=/home/nikhil/Desktop/fpga/symbiflow/bin:$PATH
       
    source ~/.bashrc

    vpr -h

    yosys -h

    qlfasm -h

    ql_symbiflow -h

    cd $INSTALL_DIR/quicklogic-arch-defs/tests/counter_16bit

    ls

    ql_symbiflow -compile -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p chandalar.pcf -dump binary

    pip3 install gdown lxml simplejson

    ql_symbiflow -compile -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p chandalar.pcf -dump binary

    ls

    cd /home/nikhil/Desktop/fpga

    ls

    mkdir fpga-examples

    cd fpga-examples

    svn co https://github.com/gadepall/vaman/trunk/fpga/setup/codes/blink

    cd blink

    ls


    Command to compile code:
       
    ql_symbiflow -compile -src /home/nikhil/Desktop/fpga/fpga-examples/blink -d ql-eos-s3 -P PU64 -v helloworldfpga.v -t helloworldfpga -p quickfeather.pcf -dump binary


    ls

    nvim helloworldfpga.v --> This file contains the code
     
    nvim quickfeather.pcf --> This file contains pin configurations

    Make sure to compile the file after modifying .v or .pcf file 


    Command to upload code to vaman:
     
    #Make sure that vaman is in upload mode(i.e Green Light)

    # After Compiling the code make sure to copy the bin file and paste it in home and perform the upload command 

    sudo python3 /home/nikhil/TinyFPGA-Programmer-Application/tinyfpga-programmer-gui.py --port /dev/ttyACM0 --appfpga /home/nikhil/helloworldfpga.bin --mode fpga

