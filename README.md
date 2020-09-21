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

##### Note: My STM32F407VGT6 contains an in-built debugger, you might need a debugger/programmer for your board

## What's the IDE?

Mainly eclipse based IDEs, for simplicity I'll be using STM32CubeIDE

### So let's start...

#### 1) Make a project in STM32CubeIDE

-> Enter your workspace and go to File > New > STM32 Project.

-> Select your controller, I'll be going for Board > STM32F4 Discovery Kit

-> Give project name, Targeted Language > C, Targeted Binary Type > Executable, Targeted Project Type > Empty

Now, a project is made with basic initializations

#### 2) Make Drivers folder

-> Download your STM32 drivers from ST's website, it'll come in a zip package, extract it.

-> Now add a Source Folder to your project: Right Click on your Project > New > Source Folder named as "Drivers".
   
   I repeat!!!!, a new SOURCE FOLDER not a simple folder. 

#### 3) Insert the pre-downloaded drivers to your project

-> Go inside the extracted downloaded folder > Drivers > STM32F4xx_HAL_Drivers (Here F4 is for Cortex M4, for other processors this name changes the same way)
   This folder contains your all ST drivers.
   
-> Now, simply copy this whole STM32F4xx_HAL_Drivers folder to your project's Drivers folder. Refresh your project and drivers will appear there.
   You can delete all htm and chm files but dont delete anything inside INC and SRC folders.
   
-> Create a folder CMSIS inside Drivers folder in your Project
   -> Inside it, create 2 folders named Device and Include
   -> Now go to Downloaded drivers folder > CMSIS > Device > ST > STM32F4xx(see as per ur board) > Include and
      copy these files "stm32f407xx.h"(controller specific file), "stm32f4xx.h"(F4 specific file), "system_stm32f4xx.h"(system F4 specific file)
	  and paste to ur project > Drivers > CMSIS > Device folder.
   -> From downloaded, inside CMSIS > Include copy all the files and paste to your CMSIS > Include
      The file "core_cm4.h" stands for Cortex M4 so I can delete some files of cm0 0plus, 1,2,3,7 etc.
   
   Now the driver insertion is complete, let's insert some supporting files.
   
#### 4) Adding some supporting files to the project

-> Go to your Project Folder > Drivers > STM32F4xx_HAL_Drivers > Inc > cut the file stm32f4xx_hal_conf_template.h
   and paste it in project folder > Inc > and rename as stm32f4xx_hal_conf.h