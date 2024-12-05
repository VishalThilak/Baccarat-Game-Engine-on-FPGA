# Baccarat Game Engine on FPGA

## Overview

This project implements a digital Baccarat game engine using Verilog and deploys it on the DE1-SoC FPGA board. It combines a datapath and a finite state machine (FSM) to simulate the card game Baccarat. The system features random card generation, hand scoring, and game state management, offering a practical introduction to FPGA design and state machine-controlled circuits.

## Core Functionality

### Seven-Segment Display Driver
- Displays card values on a seven-segment display.
- Handles binary-to-segment decoding for card values, including special characters for face cards.

### Baccarat Gameplay
1. **Card Dealing:** Randomly generates cards for the player and dealer using a high-speed counter and user-triggered sampling.
2. **Hand Scoring:** Computes scores for each hand based on Baccarat rules, taking the modulo 10 of the sum of card values.
3. **Game States:** Implements state transitions to manage card dealing, score updates, and determining the game outcome.

### State Machine and Datapath
- **State Machine:** Controls the flow of the game, asserting control signals to the datapath for specific actions.
- **Datapath:** Manages card storage, scoring, and display of results.

## Features
1. **Random Card Generation:** Simulates card dealing using a high-speed counter.
2. **Scoring Logic:** Computes hand scores for the player and dealer.
3. **Game Logic:** Implements the rules of Baccarat, including conditions for additional card draws.
4. **Visual Feedback:** Displays cards and scores on seven-segment displays and LEDs.

## Getting Started

### Prerequisites
- Quartus Prime for synthesis and FPGA programming.
- ModelSim for simulation and debugging.
- DE1-SoC FPGA board for hardware deployment.

### How to Run
1. **Clone the Repository:** Ensure all necessary Verilog files are available.
2. **Simulate the Design:** Use ModelSim to test modules and validate functionality.
3. **Synthesize and Deploy:** Compile and program the FPGA using Quartus Prime.
4. **Test on FPGA:** Interact using hardware buttons and observe results on LEDs and displays.

## Author
Vishal Thilak
