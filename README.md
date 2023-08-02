# GitEasyPush: Simplify Your Git Workflow

## Table of Contents
1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
    1. [Prerequisites](#prerequisites)
    2. [Installation](#installation)
3. [Usage](#usage)
    1. [Usage with the -e Option](#usage-with-the-e-option)
    2. [Push all changes](#usage-with-all)
4. [Making GitEasyPush Globally Accessible](#making-giteasypush-globally-accessible)
5. [Contribution](#contribution)


## Introduction <a name="introduction"></a>
**GitEasyPush** is a streamlined command-line tool created for developers who often work with Git repositories. It automates the process of staging, committing, and pushing a specific file(s), thus simplifying your Git workflow.

## Getting Started <a name="getting-started"></a>

### Prerequisites <a name="prerequisites"></a>
Before using **GitEasyPush**, make sure Git is installed on your system. Confirm your installation by typing `git --version` in your terminal/command line. If Git is installed, it should display the version details. If not, please download and install Git from [here](https://git-scm.com/downloads).

### Installation <a name="installation"></a>
Clone the **GitEasyPush** repository to your local machine with the following command:

```
git clone https://github.com/moufidayoub11/giteasypush.git
```

## Usage <a name="usage"></a>
To use **GitEasyPush**, run the script following one of the examples:

```
./giteasypush.sh 'commit message' filename1 [filename2] ...
```

Remember to replace `filename1 [filename2]` and `'commit message'` with your desired commit message and an actual filename(s), respectively.

### Usage with the -e Option <a name="usage-with-the-e-option"></a>

You can now use the `-e` option to stage and commit only modified files automatically. If you provide the `-e` option, you should not specify additional filenames. Here are some examples of how to use the `-e` option:

```bash
# Stage only modified files and commit with a message
./giteasypush.sh -e 'commit message'
```
Please note that using the -e option will stage only modified files.

### Push all changes (including new and modified files) <a name="usage-with-all"></a>

If you want to Push all changes (including new files), you can use the script without the -e option:

```bash
./giteasypush.sh 'commit message'
./giteasypush.sh 'commit message' .
```

## Making GitEasyPush Globally Accessible <a name="making-giteasypush-globally-accessible"></a>

For convenience, you may want to add the script to your system PATH. This allows you to run the script from any location.

#### Unix-like operating systems (Linux, macOS):

1. Make the script executable:

```
chmod +x giteasypush.sh
```

2. Copy the script into a directory within your system PATH, such as `/usr/local/bin` and rename it so you can remember the command name (e.g. gep):

```
sudo cp giteasypush.sh /usr/local/bin/gep
```

Now, you can run the script from anywhere with any of the following commands:

```
gep 'commit message' (To select all files)
gep 'commit message' . (To select all files)
gep 'commit message' filename1 [filename2] ...
```

#### Windows:

For Windows users, you can add the script to your system PATH using the following steps:

1. Copy the `giteasypush.sh` file to a directory of your choice (e.g., `C:\scripts`).

2. Rename it so you can remember the command name (e.g. gep)

3. Press the Windows key, search for "Environment Variables," and select "Edit the system environment variables."

4. In the System Properties window, go to the "Advanced" tab and click "Environment Variables."

5. In the Environment Variables window, under "System variables," find the `Path` variable. Select it and click "Edit."

6. In the Edit Environment Variable window, click "New" and then "Browse." Navigate to the directory where you copied `giteasypush.sh` (in this example, `C:\scripts`), select it and click "OK."

7. Click "OK" on all open windows to close them.

You should now be able to run `gep` from the Command Prompt or PowerShell. Note that on Windows, you may need to install a Unix-like command line utility, such as Git Bash or WSL, to run Bash scripts.

## Contribution <a name="contribution"></a>

Contributions to **GitEasyPush** are welcome! If you find any issues or have suggestions, please open a new issue on the [GitHub repository](https://github.com/moufidayoub11/giteasypush/issues).

We appreciate your support! Happy coding! 🚀
