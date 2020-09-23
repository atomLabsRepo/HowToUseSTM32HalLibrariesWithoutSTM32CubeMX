# How to use STM32 Hal Libraries without STM32CubeMX

## A tutorial by Atom Labs

In this tutorial, we will learn how to use STM32 HAL Libraries without auto-generating code from CubeMX software.

## How will we do it?
We will directly copy the drivers from STM website and make our project.

## What project will we make??
We will use USART drivers and write a simple UART application in which it connects to Arduino
via UART and prints data in Arduino Serial Monitor.
## What's the hardware involved?
* Any STM32 board of your choice (mine is STM32F407VGT6 - Discovery Kit)
* Arduino board (mine is Arduino Uno)/USB-TTL converter
* Uploading cables for both boards
* Some jumper wires

##### Note: My STM32F407VGT6 contains an in-built debugger, you might need a debugger/programmer for your board.

## What's the IDE?
Mainly eclipse based IDEs, for simplicity I'll be using STM32CubeIDE

## Any pre-requisites?
Yes, knowledge of basic C, some embedded, setting up an eclipse IDE and controllers ofcourse.

## How hard is it?
Umm, that's pretty simple. I know you are seeing a long one, but still it is intresting......

### So let's start...

#### 1) Make a project in STM32CubeIDE

* Enter your workspace and go to File > New > STM32 Project.
* Select your controller, I'll be going for Board > STM32F4 Discovery Kit
* Give project name, Targeted Language > C, Targeted Binary Type > Executable, Targeted Project Type > Empty.

**Now, a project is made with basic initializations**

#### 2) Make Drivers folder

* Download your STM32 drivers from ST's website, it'll come in a zip package, extract it.
* Now add a Source Folder to your project: Right Click on your Project > New > Source Folder named as "Drivers".

**I repeat!!!!, a new SOURCE FOLDER not a simple folder.**

#### 3) Insert the pre-downloaded drivers to your project

* Go inside the extracted downloaded folder > Drivers > STM32F4xx_HAL_Drivers (Here F4 is for Cortex M4, for other processors this name changes the same way). This folder contains your all ST drivers.
* Now, simply copy this whole STM32F4xx_HAL_Drivers folder to your project's Drivers folder. Refresh your project and drivers will appear in your STM32CubeIDE workspace.
   You can delete all htm and chm files but dont delete anything inside INC and SRC folders.
* Create a folder CMSIS inside Drivers folder in your Project
* Inside it, create 2 folders named Device and Include
 * Now go to Downloaded drivers folder > CMSIS > Device > ST > STM32F4xx(see as per ur board) > Include and copy these files **stm32f407xx.h**(controller specific file), **stm32f4xx.**(F4 specific file), **system_stm32f4xx.h**(system F4 specific file) and paste to ur project > Drivers > CMSIS > Device folder.
* From downloaded, inside CMSIS > Include copy all the files and 
paste to your CMSIS > Include
      The file **core_cm4.h** stands for Cortex M4 so I can delete some files of cmO, Oplus, 1,2,3,7 etc.

Now the driver insertion is complete, let's insert some supporting files.
   
#### 4) Adding some supporting files to the project

* Go to your Project Folder > Drivers > STM32F4xx_HAL_Drivers > Inc > cut the file **stm32f4xx_hal_conf_template.h** and paste it in project folder > Inc > and rename as **stm32f4xx_hal_conf.h**, also create **main.h** and **it.h** in same Inc folder.
* Also find a **system_stm32f4xx.c** file in your downloaded drivers and copy it in Project Folder > Src
   Create a **it.c** (for interrupt handling) and **msp.c** (for micrcontroller specific programming).
   
#### 5) Let's have some configurations

* Go to Project Folder > Drivers > CMSIS > Device > stm32f4xx.h, we need to set our board by uncommenting the particular device.
   Search this line **Uncomment the line below according to the target STM32 device used in your application** and find your target and uncomment it, mine is **#define STM32F407xx**, Select Yes if it says it is a Read only file.
* Right click on your Project > Properties > C/C++ Build > Settings > Tool Settings > MCU GCC Compiler > Preprocessor > Click on Add and paste **USE_HAL_DRIVER**.
   This enables the HAL library to use.
* With above step all the available drivers have been enabled, lets optimise it by disabling those not in use.
                         Go to Project Folder > Inc > stm32f4xx_hal_conf.h, comment all the drivers not in use.
For that just leave these defines                                                                          
   - **HAL_MODULE_ENABLED** -> for HAL library functions,
   - **HAL_GPIO_MODULE_ENABLED** -> Gpios driver,
   - **HAL_RCC_MODULE_ENABLED** -> enabling clock functions,
   - **HAL_UART_MODULE_ENABLED** -> Uart driver,
   - **HAL_CORTEX_MODULE_ENABLED** -> for some NVIC functionalities,
   - **HAL_DMA_MODULE_ENABLED** -> for DMA modules,
   - **HAL_FLASH_MODULE_ENABLED** -> for Flash functions in RCC module
   Rest all can be commented, this is just to optimise our project and can also be done via Compiler flags like we did for using this **USE_HAL_DRIVER**.
   
#### 6) Let's make this initial project build

* In IDE, right click on project name > Properties > C/C++ Build > Settings > Tool Settings > MCU GCC Compiler > Include Paths
    Click on Add and paste these one by one.
	- ${workspace_loc:/${ProjName}/Drivers/CMSIS/Device}
    - ${workspace_loc:/${ProjName}/Drivers/CMSIS/Include}
    - ${workspace_loc:/${ProjName}/Drivers/STM32F4xx_HAL_Driver/Inc}
	Apply and close.
	
* **Note**:
    - **workspace_loc** -> Local Workspace, 
    - **ProjName** -> Current working project, 
  don't get confused with these tag names.

* Go to Project Folder > Drivers > STM32F4xx_HAL_Driver > Src > Select all the template.c files and exclude them from build.
* Go to main.c, remove the FPU warning #if.
* Build the project, there should be no errors or warnings.

#### 7) Now let's have some code

* I'll make it short this time, copy the contents of these files from the project repository of ***main.c, main.h, it.c, it.h, msp.c***
  your respective files.
  
  Don't worry, I've mentioned the comments in code to make it worth readable.
  
* Now, build the whole project and program the board.

* Flash the Arduino board with the file ***ArduinoUartRx.ino*** in the repository.

* Connect the wires as mentioned the code.

* Open Serial Monitor in Arduino IDE, and select Baud Rate as 115200.

* Reset both the boards, you will see your desired input string in Arduino Serial Monitor.


Yeap, a big thanks for making this long, don't worry for any problems you face with your controllers just DM me on Insta @atom_labs