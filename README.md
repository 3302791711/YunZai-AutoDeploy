# 适用于 Windows 11 的机器人双框架一键部署脚本

[![当前版本](https://img.shields.io/badge/version-v1.0-blue)](https://github.com/你的用户名/你的仓库名/releases/tag/v1.0) <!-- 请将链接替换为你的实际仓库发布链接 -->
[![兼容系统](https://img.shields.io/badge/System-Windows%2011-informational)](https://www.microsoft.com/windows/windows-11)
[![许可证](https://img.shields.io/badge/License-MIT-green)](LICENSE) <!-- 如果你使用 MIT 协议，保留这个，否则请修改 -->

---

**中文** | [English](./README.en.md) <!-- 如果你打算提供英文版，可以保留这个链接 -->

本项目旨在简化 [YunZai-Bot](https://github.com/Le-niao/Yunzai-Bot) 和 [Koishi](https://koishi.chat/) 这两个流行的机器人框架在 Windows 11 环境下的部署流程。通过提供一键安装、配置（基础）和启动脚本，用户可以快速搭建并运行包含这两个框架以及必要依赖（如 OneBot 协议实现、Redis 数据库）的机器人环境。

**注意：本项目脚本目前仅在 Windows 11 系统下测试通过，不保证在其他 Windows 版本或操作系统上的兼容性。**

## ✨ 功能特性

*   **一键安装 (`install-win11.bat`)**:
    *   自动下载并安装 YunZai-Bot 框架所需的基础环境。
    *   自动下载并安装 Koishi 框架所需的基础环境。
    *   自动下载并配置基础的 OneBot 协议实现插件（如 go-cqhttp 或 Lagrange.One 作为示例，具体视脚本实现而定）。
    *   自动下载并安装 Redis 数据库。
    *   安装 Git、Node.js 等基础依赖（如果脚本包含此功能）。
*   **一键配置 (`configure-win11.bat`)**:
    *   可快速的安装YunZai插件
    *   可快速的安装Koishi插件
    *   一键打开所有配置页面，方便管理
    *   如果此脚本暂时功能较少，敬请期待
*   **一键启动 (`start-win11.bat`)**:
    *   自动化第一步：启动 OneBot 客户端。
    *   自动化第二步：启动 Koishi 实例。
    *   自动化第三步：启动 Redis 数据库服务。
    *   自动化第四步：启动 YunZai-Bot 实例。

## 🎯 目标用户

*   希望在 Windows 11 环境下快速体验或部署 YunZai-Bot 和 Koishi 的用户。
*   不熟悉手动部署流程，或希望简化部署步骤的用户。

## 🚀 环境要求 (Prerequisites)

<details>
<summary>点击查看详细环境要求</summary>

<!-- 注意 summary 结束和下面内容开始之间有一个空行 -->

在运行任何脚本之前，请确保你的 Windows 11 系统满足以下条件：

*   **操作系统**: Windows 11 (x64)
*   **网络连接**: 脚本执行过程中需要稳定的网络连接以下载所需文件。
*   **Git**: 需要预先安装 Git，用于克隆 YunZai-Bot 和 Koishi 的仓库。([下载地址](https://git-scm.com/download/win))
*   **Node.js**: 需要预先安装 Node.js (推荐 LTS 版本)，这是 YunZai-Bot 和 Koishi 的运行环境。([下载地址](https://nodejs.org/))
*   **管理员权限**: 建议使用管理员权限运行 `.bat` 脚本，特别是安装 Redis 或修改系统环境时可能需要。

<!-- 注意上面内容结束和下面 </details> 之间最好也有空行 -->
</details>

## 🛠️ 安装与使用

<details>
<summary>点击查看详细安装与使用步骤</summary>

<!-- 注意 summary 结束和下面内容开始之间有一个空行 -->

1.  **获取项目文件**:
    *   **通过 Git 克隆 (推荐)**:
        ```bash
        git clone https://github.com/3302791711/YunZai-AutoDeploy.git
        cd 你的仓库名
        ```
        *(请将 `你的仓库名` 替换为你实际克隆下来的目录名，或者直接进入 `YunZai-AutoDeploy` 目录)*
    *   **直接下载 ZIP**:
        *   访问本仓库页面，点击 "Code" -> "Download ZIP"。
        *   下载后解压到你想要的位置。

2.  **执行安装脚本**:
    *   在文件管理器中，找到 `Win11-install.bat` 文件。 
    *   **右键点击 -> 以管理员身份运行** (推荐)。
    *   脚本将开始执行安装流程，请根据命令行窗口中的提示进行操作（如有）。此过程可能需要较长时间，请耐心等待。

3.  **执行配置脚本 (如果需要)**:
    *   安装完成后，根据需要运行 `Win11-configure.bat`。*(确保与实际文件名一致)*
    *   同样建议 **右键点击 -> 以管理员身份运行**。
    *   根据脚本提示完成必要的配置步骤。*(请在此处补充你的配置脚本的具体作用和提示)*

4.  **执行启动脚本**:
    *   运行 `Win11-start.bat` 来启动所有服务。*(确保与实际文件名一致)*
    *   建议 **右键点击 -> 以管理员身份运行**，以确保所有服务都能正常启动。
    *   脚本会打开多个命令行窗口，分别对应 Redis、YunZai-Bot、Koishi（以及可能的 OneBot 客户端）。请**保持这些窗口开启**，关闭窗口将导致对应服务停止。

<!-- 注意上面内容结束和下面 </details> 之间最好也有空行 -->
</details>

## ⚙️ 手动配置说明

<details>
<summary>点击查看需要手动配置的项</summary>

<!-- 注意 summary 结束和下面内容开始之间有一个空行 -->

本脚本旨在简化 *安装* 和 *启动* 过程，但以下重要配置仍需用户在脚本运行后**手动完成**：

*   **QQ 机器人账号配置**:
    *   你需要配置 OneBot 实现来登录你的机器人 QQ 账号。这通常涉及编辑其配置文件并进行QQ登录等操作。
*   **YunZai-Bot 配置**:
    *   设置机器人主人 QQ 号等请参考YunZai官方：https://github.com/TimeRainStarSky/Yunzai
*   **Koishi 配置**:
    *   访问 Koishi 的 Web UI（通常地址为 `http://localhost:端口号`，端口号在 Koishi 启动时会显示）进行插件安装、适配器配置（连接到 OneBot）、功能设置等。
*   **端口检查**: 如果你的电脑上已安装了 Redis 或其他可能占用默认端口（如 Redis 的 6379，Koishi 的 5140 等）的服务，可能会发生冲突。你需要手动修改相关服务的配置文件来更换端口。

<!-- 注意上面内容结束和下面 </details> 之间最好也有空行 -->
</details>

## 📁 预期目录结构 (示例)

<details>
<summary>点击查看预期目录结构示例</summary>

<!-- 注意 summary 结束和下面内容开始之间有一个空行 -->

运行安装脚本后，项目目录下可能生成类似以下的结构 (具体路径可能因脚本实现而异)：

| 文件/目录             | 说明                                       |
| :-------------------- | :----------------------------------------- |
| `Win11-install.bat`   | 📄 一键安装脚本 (适用于 Windows 11)         |
| `Win11-configure.bat` | 📄 一键配置脚本 (适用于 Windows 11)         |
| `Win11-start.bat`     | 📄 一键启动脚本 (适用于 Windows 11)         |
| `YunZai-Bot/`         | 📁 YunZai-Bot 框架的主目录                 |
| `Koishi/`             | 📁 Koishi 框架的主目录                     |
| `Redis/`              | 📁 Redis 数据库的相关文件或安装目录        |
| `Tencent_*.exe`       | 📦 QQ 安装程序 (版本号可能不同)             |

*说明：`YunZai-Bot/`, `Koishi/`, `Redis/` ，`QQ 安装程序`目录通常由安装脚本自动创建。*

</details>
