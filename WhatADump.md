# What a Dump

### Challenge
**Do you know where your environment variables are?**

There is link to download a file. When you unzip this file you will see a file with a .DMP extension. This is a memory dump file. You can use a tool like windbg to examine and debug this memory dump.

The contents of this file also contain all of the environment variables loaded into the process that this dump was taken on.

The Command window in windbg lets you input commands, such as !peb which provides a formatted view of the information in the process environment block. This information contains the environment variables, and one of them looks a lot like a flag:

![What A Dump](/images/WhatADump.png)