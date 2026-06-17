# MathType Crack v2.0

配置版 MathType 破解脚本，首次配置后可在多台电脑通用。

## 使用方法

### 首次在新电脑使用

1. 双击 `setup.bat`
2. 输入 MathType 安装路径（根据提示填写）
3. 配置保存完成

### 之后每次过期

直接双击 `crack.bat`

## 文件说明

| 文件 | 说明 |
|------|------|
| `setup.bat` | 首次配置脚本 |
| `setup.ps1` | 配置脚本源码 |
| `crack.bat` | 主程序入口 |
| `crack.ps1` | 主程序源码 |
| `config.ps1` | 配置文件（setup后自动生成） |

## 配置说明

首次运行 `setup.bat` 时会询问：

| 选项 | 说明 | 默认值 |
|------|------|--------|
| Mathtype路径 | MathType.exe 的完整路径 | C:\Program Files\MathType\MathType.exe |

其他参数已预设为常用值，通常无需修改。

## 适用场景

- 多台电脑使用
- MathType 安装路径不固定
- 便携使用

## 版本区别

- **v1.0**: 简单版，路径硬编码
- **v2.0**: 配置版，首次运行需设置一次，之后通用
