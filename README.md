# GitEasyPush: Simplify Your Git Workflow

## Table of Contents
1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
    1. [Prerequisites](#prerequisites)
    2. [Installation](#installation)
3. [Usage](#usage)
4. [Making GitEasyPush Globally Accessible](#making-giteasypush-globally-accessible)

## Introduction <a name="introduction"></a>
**GitEasyPush** is a streamlined command-line tool created for developers who often work with Git repositories. It automates the process of staging, committing, and pushing a specific file, thus simplifying your Git workflow.

## Getting Started <a name="getting-started"></a>

### Prerequisites <a name="prerequisites"></a>
Before using **GitEasyPush**, make sure Git is installed on your system. Confirm your installation by typing `git --version` in your terminal/command line. If Git is installed, it should display the version details. If not, please download and install Git from [here](https://git-scm.com/downloads).

### Installation <a name="installation"></a>
Clone the **GitEasyPush** repository to your local machine with the following command:

```
git clone https://github.com/moufidayoub11/giteasypush.git
```

## Usage <a name="usage"></a>
To use **GitEasyPush**, run the script with two parameters: the filename and the commit message. 

Here's the format:
```
./giteasypush.sh filename 'Your distinct commit message'
```

Remember to replace `filename` and `'Your distinct commit message'` with your actual filename and desired commit message, respectively.

## Making GitEasyPush Globally Accessible <a name="making-giteasypush-globally-accessible"></a>

For convenience, you may want to add the script to your system PATH. This allows you to run the script from any location.

#### Unix-like operating systems (Linux, macOS):

1. Make the script executable:

```
chmod +x giteasypush.sh
```

2. Move the script into a directory within your system PATH, such as `/usr/local/bin` and rename it so you can remember the command name (e.g. gep):

```
mv giteasypush.sh /usr/local/bin/gep
```

Now, you can run the script from anywhere with this simple command:

```
gep yourfile 'Your commit message'
```

#### Windows:

For Windows users, you can add the script to your system PATH using the following steps:

1. Copy the `giteasypush.sh` file to a directory of your choice (e.g., `C:\scripts`).

2. Press the Windows key, search for "Environment Variables," and select "Edit the system environment variables."

3. In the System Properties window, go to the "Advanced" tab and click "Environment Variables."

4. In the Environment Variables window, under "System variables," find the `Path` variable. Select it and click "Edit."

5. In the Edit Environment Variable window, click "New" and then "Browse." Navigate to the directory where you copied `giteasypush.sh` (in this example, `C:\scripts`), select it and click "OK."

6. Click "OK" on all open windows to close them.

You should now be able to run `giteasypush.sh` from the Command Prompt or PowerShell. Note that on Windows, you may need to install a Unix-like command line utility, such as Git Bash or WSL, to run Bash scripts.
