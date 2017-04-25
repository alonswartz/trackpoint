# Trackpoint: step by step

## Target audience

- hard to cover every use-case
- limited to hand-wired, teensy, tmk, mousekeys
- still useful for others

## FAQ

### Q: What should I use for the trackpoint stem/stick?

labret cheek piercing (16G)

- cheap
- strong
- thin diameter
- different lengths
- flat bottom (gluing)
- screw on top ball

### Q: How do I identify the trackpoint pinout?

- luck

    - pinouts

- multimeter

    - largest tracer gnd
    - second largest vcc
    - reference to ptpm754 datasheet

```
CLK (INT0)    - PTPM754 pin 24
DATA (TXD/1)  - PTPM754 pin 2
RST           - PTPM754 pin 5
GND           - PTPM754 pin 8
VCC           - PTPM754 pin 22
```

- scope

```
CLK  - should have a frequency reading
DATA - should have a 5V reading
RST  - should have a 0V reading
```

## What you need

## Steps

### 1. Solder leads to trackpoint

- 5 leads
- tin pads
- helping hand to heat leads

### 2. Create the reset circuit (RC)

- veroboard (6x5 - the 5 is for rails)

- 4.7k resistors x2
- 100k resistor
- 2.2uF capacitor

### 3. Solder leads to reset circuit (RC)

- solder tp leads to rc
- solder rc leads for teensy

### 4. Testing on a breadboard

- usart firmware
- connect, flash, test

### 5. Make trackpoint stem hole in case

- 1.2mm hole
- pcb drill, thin rounded file

- locate position, scratch
- make hole
- test diameter

### 6. Make space for trackpoint in keyboard

- insulation tape (shorts, protection)
- rewiring rows/columns for clearance
- trim switch legs
- relocate d2 d5

### 7. Test trackpoint clearance and stem length, glue stem

- double side tape, test stems
- rinse repeat
- glue

### 8. Solder reset circuit (RC) to teensy

```
VCC  -> teensy VCC
GND  -> teensy GND
CLK  -> teensy D5
DATA -> teensy D2
```

### 9. Finish up

- verify position, close, screw on ball

### 10. Update tmk_keyboard firmware and flash

- usart update

## TMK firmware changes and tweaks

- usart support diff
- mousekeys reference
- concurrent tp movement and mousekeys
- polling interval delay (dropped key stokes)
- auto-enable mouse layer on tp movement

