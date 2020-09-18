# How to use STM32 Hal Libraries without STM32CubeMX

## A tutorial by Atomax Labs

In this tutorial, we will learn how to use STM32 HAL Libraries without auto-generating
code from CubeMX software.

## How will we do it?

We will directly copy the drivers from STM website and make our project.

## What project will we make??

We will use USART drivers and write a simple UART application in which it connects to Arduino
via UART and prints data in Arduino Serial Monitor

## What's the hardware involved?

1) Any STM32 board of your choice (mine is STM32F407VGT6 - Discovery Kit)
2) Arduino board (mine is Arduino Uno)
3) Uploading cables for both boards
4) Some jumper wires

### Note: My STM32F407VGT6 contains an in-built debugger, you might need a debugger/programmer for your board

## What's the IDE?

Mainly eclipse based IDEs, for simplicity I'll be using STM32CubeIDE

### So let's start...