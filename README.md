# Compact 10-Bit Stochastic Number Generator (SNG)

## Optimized for Low Correlation and Dynamic Power Gating 
Stochastic Computing (SC) is a powerful paradigm for hardware efficient arithmetic, but its accuracy is heavily dependent on the quality of the bitstreams. This project implements an optimized 10-bit SNG that resolves two major bottlenecks: high inter-stream correlation and excessive switching power in Linear Feedback Shift Registers (LFSRs).

## Engineering Impact

By moving from a standard 8-bit baseline to a shared 10-bit architecture with integrated clock gating, this design achieved a 73% reduction in dynamic power and a significant improvement in computational accuracy.

| Metric | Baseline 8-Bit | Optimized 10-Bit | Improvement |
| :--- | :--- | :--- | :--- |
| Total Power | 1.542 W | 0.457 W | -70.3% |
| SCC Correlation | 0.26 | 0.10 | -61.5% |
| Random States | 255 | 1,023 | +300% |
| Critical Delay | 3.521 ns | 3.521 ns | Stable |

---

## Technical Features

1. High-Entropy PRPG (10-Bit LFSR)
To improve the randomness of the stochastic bitstreams, the design utilizes a 10-bit LFSR. This increases the pseudo-random sequence length to 1,023 states, ensuring better value distribution and lower repetition compared to conventional 8-bit designs.

2. Active Correlation Management
Bitstream independence is critical for stochastic multiplication accuracy. This architecture applies permutation and negation techniques to the LFSR outputs. The system includes a total_scc controller that monitors the bias (d sx_sy) and dynamically switches between positive and negative correlation modules to maintain precision.

3. D-FF Based Clock Gating
To minimize dynamic power, a flip-flop-based clock gating hierarchy was implemented. This logic disables the clock signal to the LFSR and comparators when the system is idle, eliminating unnecessary switching activity without compromising the timing margin.

## Project Structure 
The repository is organized to show the design evolution from a functional baseline to an optimized hardware implementation:
  
  -> 01_Base_Design: The original 10-bit functional foundation without power optimization.
  
  -> 02_Optimized_Design: The final hardware-ready version with clock gating and correlation logic.

  -> hdl: Verilog source files (LFSR core, SCC switching logic, Gated Clock).

  -> tb: System-level testbenches for functional verification.

  -> assets: Xilinx Vivado synthesis reports, power analysis, and timing waveforms.

## Applications

Neural Networks: Energy-efficient hardware accelerators for feature extraction.

Image Processing: Low-complexity probabilistic filtering.

Low-Power VLSI: Battery-constrained IoT and edge computing systems.
