# One-Click Script for Dual QQ Bot Frameworks (OneBot)

[![Current Version](https://img.shields.io/badge/version-v1.0-blue)](https://github.com/your-username/your-repo-name/releases/tag/v1.0) <!-- Please replace this link with your actual repository release link -->
[![Compatible System](https://img.shields.io/badge/System-Windows%2011-informational)](https://www.microsoft.com/windows/windows-11)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE) <!-- Keep this if you use the MIT license, otherwise modify -->

---

[中文](https://github.com/3302791711/YunZai-AutoDeploy) | **English** <!-- Link to the original Chinese version -->

This project aims to simplify the deployment process for the two popular bot frameworks, [YunZai-Bot](https://github.com/Le-niao/Yunzai-Bot) and [Koishi](https://koishi.chat/), in a Windows 11 environment. By providing one-click installation, basic configuration, and startup scripts, users can quickly set up and run a bot environment including these two frameworks and necessary dependencies (like an OneBot protocol implementation and Redis database).

**Note: These scripts have currently only been tested on Windows 11. Compatibility with other Windows versions is not guaranteed.**

## ✨ Features

*   **One-Click Install (`Win11-install.bat`)**:
    *   Automatically downloads and installs the base environment required for the YunZai-Bot framework.
    *   Automatically downloads and installs the base environment required for the Koishi framework.
    *   Automatically downloads and configures a basic OneBot protocol implementation plugin (e.g., go-cqhttp or Lagrange.One, depending on script implementation).
    *   Automatically downloads and installs the Redis database.
    *   Installs basic dependencies like Git and Node.js.
*   **One-Click Configure (`Win11-configure.bat`)**:
    *   Quickly install YunZai plugins.
    *   Quickly install Koishi plugins.
    *   One-click to open all relevant configuration pages for easy management.
    *   This script currently has limited features; more are planned.
*   **One-Click Start (`Win11-start.bat`)**:
    *   Automated Step 1: Starts the OneBot client.
    *   Automated Step 2: Starts the Koishi instance.
    *   Automated Step 3: Starts the Redis database service.
    *   Automated Step 4: Starts the YunZai-Bot instance.

## 🎯 Target Users

*   Users who want to quickly try out or deploy YunZai-Bot and Koishi on Windows 11.
*   Users unfamiliar with the manual deployment process or those looking to simplify the setup steps.

## 🚀 Prerequisites

<details>
<summary>Click to view detailed prerequisites</summary>

<!-- Note: Empty line between summary end and content start -->

Before running any script, please ensure your Windows 11 system meets the following conditions:

*   **System**: Windows 11 (x64)
*   **Network Connection**: A stable internet connection is required during script execution to download necessary files.
*   **Git**: Git needs to be pre-installed to clone the YunZai-Bot and Koishi repositories. ([Download Link](https://git-scm.com/download/win))
*   **Node.js**: Node.js (LTS version recommended) needs to be pre-installed, as it's the runtime environment for YunZai-Bot and Koishi. ([Download Link](https://nodejs.org/))
*   **Administrator Privileges**: It is recommended to run the `.bat` scripts with administrator privileges, especially when installing Redis or modifying system settings which might require them.

<!-- Note: Preferably an empty line between content end and </details> start -->
</details>

## 🛠️ Installation & Usage

<details>
<summary>Click to view detailed installation and usage steps</summary>

<!-- Note: Empty line between summary end and content start -->

1.  **Get the project files**:
    *   **Via Git Clone (Recommended)**:
        ```bash
        git clone https://github.com/3302791711/YunZai-AutoDeploy.git
        cd YunZai-AutoDeploy
        ```
        *(Replace `YunZai-AutoDeploy` with the actual directory name if you cloned it differently, or simply navigate into the `YunZai-AutoDeploy` directory)*
    *   **Download ZIP directly**:
        *   Visit this repository page, click "Code" -> "Download ZIP".
        *   Extract the downloaded file to your desired location.

2.  **Run the installation script**:
    *   In File Explorer, locate the `Win11-install.bat` file.
    *   **Right-click -> Run as administrator** (Recommended).
    *   The script will start the installation process. Follow any prompts in the command line window (if any). This process may take a significant amount of time, please be patient.

3.  **Run the configuration script (if needed)**:
    *   After installation, run `Win11-configure.bat` if necessary. *(Ensure the filename matches)*
    *   It's also recommended to **Right-click -> Run as administrator**.
    *   Follow the script prompts to complete necessary configuration steps. *(Describe the specific functions and prompts of your configuration script here.)*

4.  **Run the startup script**:
    *   Run `Win11-start.bat` to start all services. *(Ensure the filename matches)*
    *   It is recommended to **Right-click -> Run as administrator** to ensure all services can start correctly.
    *   The script will open multiple command prompt windows, corresponding to Redis, YunZai-Bot, Koishi (and possibly the OneBot client). Please **keep these windows open**, as closing a window will stop the corresponding service.

<!-- Note: Preferably an empty line between content end and </details> start -->
</details>

## ⚙️ Manual Configuration Notes

<details>
<summary>Click to view items requiring manual configuration</summary>

<!-- Note: Empty line between summary end and content start -->

This script aims to simplify the *installation* and *startup* process, but the following important configurations still need to be **done manually** by the user after the script runs:

*   **QQ Bot Account Configuration**:
    *   You need to configure the OneBot implementation to log in with your bot's QQ account. This usually involves editing its configuration file and performing the QQ login procedure.
*   **YunZai-Bot Configuration**:
    *   For setting the bot owner's QQ number, etc., please refer to the official YunZai documentation: https://github.com/TimeRainStarSky/Yunzai
*   **Koishi Configuration**:
    *   Access Koishi's Web UI (usually at `http://localhost:port`, the port number is displayed when Koishi starts) to install plugins, configure adapters (connecting to OneBot), set up features, etc.
*   **Port Check**: If Redis or other services that might use default ports (like Redis's 6379, Koishi's 5140, etc.) are already installed on your computer, conflicts may occur. You will need to manually edit the configuration files of the relevant services to change the ports.

<!-- Note: Preferably an empty line between content end and </details> start -->
</details>


## 📁 Expected Directory Structure (Example)

<details>
<summary>Click to view an example of the expected directory structure</summary>

<!-- Note: Empty line between summary end and content start -->

After running the installation script, a structure similar to the following might be generated in the project directory (specific paths may vary depending on the script implementation):

| File/Directory        | Description                                         |
| :-------------------- | :-------------------------------------------------- |
| `Win11-install.bat`   | 📄 One-click install script (for Windows 11)      |
| `Win11-configure.bat` | 📄 One-click configure script (for Windows 11)    |
| `Win11-start.bat`     | 📄 One-click start script (for Windows 11)        |
| `Napcat-Bot/`         | 📁 Main directory for the Napcat framework          |
| `Koishi/`             | 📁 Main directory for the Koishi framework          |
| `Redis/`              | 📁 Related files or installation dir for Redis DB |
| `YunZai-Bot/`         | 📁 Main directory for the YunZai framework          |
| `Tencent_*.exe`       | 📦 QQ Installer (version may vary)                |

*Note: The `Napcat-Bot/`, `Koishi/`, `Redis/`, `YunZai-Bot/` directories and the `Tencent_*.exe` file are typically created or placed by the installation script.*

</details>

## 💬 Join QQ Communication Group

Feel free to join our QQ communication group for help, sharing experiences, and discussing new ideas.

*   **RDK Resource Group (Partner Group):** [Click to Join](http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=-3_iFxsRkol9UUmX4ii8QOHSStAP4yE2&authKey=Tc1h8TGypj91sN7FuDFNWZmreJqn5FWgfkbSbt78dyfRL92coJZ3mFJ2Rualj3Lq&noverify=0&group_code=545229774)
*   **XiaoCeCe BOT Headquarters:** [Click to Join](http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=DBLs4pUq8msoDC0DiHwyP3hBw7NN7t-E&authKey=T1g3x7VInV9ZZEqdtWRR4mJbYRVwYRQP2jlQc3M3DPBDxyoC8u%2F2sq9fUqe8DKBj&noverify=0&group_code=1043930423)
<br>
<br>
We look forward to your participation!

---

## ⚖️ Disclaimer
>1. This project is open source. Use for any commercial purposes or illegal activities is strictly prohibited.
>2. Materials used are sourced from the internet and are for communication and learning purposes only. If there is any infringement, please contact us, and it will be removed immediately.
>3. Please do not upload the contents of this project to video platforms such as Bilibili, etc.

---
