# MathType Crack

MathType 注册表限制解除工具。

## 功能

- 自动关闭 MathType 进程
- 删除注册表限制项（Options6.9）
- 打开注册表编辑器供确认
- 自动重启 MathType

## 版本

| 版本 | 说明 |
|------|------|
| [v1.0](1.0/) | 简单版，路径硬编码 |
| [v2.0](2.0/) | 配置版，首次配置后通用 |

## 快速开始

### v1.0（单电脑使用）

```bash
cd 1.0
# 修改 mathtype-crack.ps1 中的路径
双击 mathtype-crack.bat
```

### v2.0（多电脑使用）

```bash
cd 2.0
双击 setup.bat    # 首次配置
双击 crack.bat    # 之后每次过期运行
```

## 工作原理

MathType 通过注册表键 `HKEY_CURRENT_USER\Software\Install Options\Options6.9` 记录试用期限制。删除该键即可重置试用期。

## 免责声明

本工具仅用于学习交流，请支持正版软件。
