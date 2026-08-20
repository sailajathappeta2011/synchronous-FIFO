# Synchronous FIFO using Verilog

## Introduction

This project implements a Synchronous FIFO (First-In First-Out)
memory using Verilog HDL.

A FIFO is a memory structure in which the first data written into
the memory is the first data read from the memory.

In a synchronous FIFO, both read and write operations are controlled
by the same clock.

## Features

- 8-bit data width
- 8 memory locations
- Single clock
- Write operation
- Read operation
- Full flag
- Empty flag
- Reset operation

## Inputs

| Signal | Description |
|--------|-------------|
| clk    | Clock signal |
| rst    | Reset signal |
| wr_en  | Write enable |
| rd_en  | Read enable |
| din    | Input data |

## Outputs

| Signal | Description |
|--------|-------------|
| dout  | Output data |
| full  | FIFO full flag |
| empty | FIFO empty flag |

## FIFO Operation

### Write

When `wr_en = 1` and FIFO is not full, data is written into the FIFO.

### Read

When `rd_en = 1` and FIFO is not empty, data is read from the FIFO.

### Full

`full = 1` when the FIFO contains 8 entries.

### Empty

`empty = 1` when the FIFO contains no entries.

## Block Diagram

             +-------------------+
    DIN ---->|                   |
    WR_EN -->|                   |
             |   SYNCHRONOUS     |----> DOUT
    RD_EN -->|      FIFO         |
             |                   |----> FULL
    CLK ---->|                   |----> EMPTY
    RST ---->|                   |
             +-------------------+

## Example

Data written:

    10
    20
    30
    40

Data read:

    10
    20
    30
    40

The first data written is the first data read.

## Simulation Output

```text
Time=0   | WR=0 RD=0 DIN=00 DOUT=00 FULL=0 EMPTY=1
Time=20  | WR=1 RD=0 DIN=10 DOUT=00 FULL=0 EMPTY=0
Time=30  | WR=1 RD=0 DIN=20 DOUT=00 FULL=0 EMPTY=0
Time=40  | WR=1 RD=0 DIN=30 DOUT=00 FULL=0 EMPTY=0
Time=50  | WR=1 RD=0 DIN=40 DOUT=00 FULL=0 EMPTY=0
Time=70  | WR=0 RD=1 DIN=40 DOUT=10 FULL=0 EMPTY=0
Time=80  | WR=0 RD=1 DIN=40 DOUT=20 FULL=0 EMPTY=0
Time=90  | WR=0 RD=1 DIN=40 DOUT=30 FULL=0 EMPTY=0
Time=100 | WR=0 RD=1 DIN=40 DOUT=40 FULL=0 EMPTY=1