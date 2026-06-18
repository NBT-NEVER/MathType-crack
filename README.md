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

## 弹窗提示更新1.0
在联网环境下打开MathType  6.9，会弹窗提示更新，关掉后程序进入精简模式（未注册模式）

打开windows安全中心→高级设置→出站规则→新建出站规则→规则类型（选“程序”），
下一步→此程序路径中,填上mathtype.exe的保存路径，下一步→阻止连接，
下一步→配置文件:“域，专用，公用”都选上，
下一步→名称，随意取个名就行→完成


## 弹窗提示更新2.0
在hosts文件（Win：C:\Windows\System32\drivers\etc\hosts）中添加127.0.0.1 version.dessci.com，屏蔽更新域名。
如果开有魔法，可能还需要在魔法中添加绕行规则。


## 免责声明

本工具仅用于学习交流，请支持正版软件。
