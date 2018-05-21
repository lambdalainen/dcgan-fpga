DCGAN implementation on Nexys 4 with Artix-7 FPGA (XC7A100T-CSG324)

---

# Simulation Guide

To simulate the first transposed convolutional layer:

1. First, clone the repository: `git clone git@github.com:lambdalainen/dcgan-fpga.git`
2. Switch to the commit that completes the simulation of the first layer: `git checkout 253231882df6cb7ccf4c6933179ac1d4784241b5`
3. Open the project with Vivado
4. Edit s25fl128s.v, on line 250, change the .mem file to "weight_1_fpga.mem"
5. Click "Run Simulation -> Run Behavioral Simulation"
6. That's it!

Explaination of waveforms:

The input is 1x100 contained in input_1_uint8.mem. A single kernel is of size 100x4x4, and weight_1_fpga.mem contains 512 such kernels, therefore in total there should be 512 output planes (channels). In this testbench, we calculate only the first 2 output planes from the first 2 kernels. This is done by reading each kernel (100x4x4) from the Quad-SPI Flash (s25fl128s.v), followed by calculating the transposed convolution. This process can be seen in the following waveform, in which 2 reads of the kernels take up most of the clock cycles.

![Transposed convolution testbench waveform 0](https://github.com/lambdalainen/dcgan-fpga/raw/master/screenshots/testbench0.png "Transposed convolution testbench waveform 0")

Once `tc_done_tick` is asserted, the testbench proceeds to read the first 32 values of the output.

![Transposed convolution testbench waveform 1](https://github.com/lambdalainen/dcgan-fpga/raw/master/screenshots/testbench1.png "Transposed convolution testbench waveform 1")
