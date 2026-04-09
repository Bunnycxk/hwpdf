# hwpdf

一个简单的将 Markdown 作业转化为 pdf 报告的小工具。

## 背景

平常写作业习惯使用 Markdown 编写，但提交的时候往往需要 PDF 格式的报告。之前的工作流是将 Markdown 复制到在线的 Markdown 编辑器 Stackedit.io，利用它渲染并使用浏览器的打印功能保存为 PDF。（直接导出需要赞助）但是这个方法有几个问题，例如代码过长时会被截断、VS Code 的 Markdown 渲染和 Stackedit.io 的渲染效果不一致，手动复制也比较麻烦。

后面尝试使用 VS code 的 Markdown PDF 插件，虽然可以直接从 VS Code 导出 PDF，但渲染效果也不太理想，感觉很丑而且也会出现代码被截断的问题。

再然后发现有 pandoc 这个工具，可以将 Markdown 转换为多种格式，包括 PDF。但是直接使用 pandoc 转换时，效果感觉和 VS Code 的 Markdown PDF 插件差不多，感觉也不太好看。

## 解决方案
pandoc可以把 Markdown 转换为 html，而且可以通过 css 更灵活的控制样式。于是可以进行曲线救国，先将 Markdown 转换为 html，然后再利用浏览器的打印功能将 html 转换为 PDF。这样就可以利用 css 来控制样式，解决了之前渲染效果不理想的问题。

唯一的缺点是浏览器打印还需要手动操作，未来应该可以通过一些自动化工具来实现自动打印，或者直接使用一些库来将 html 转换为 PDF。

## Quick Start

```
# 安装 pandoc
sudo apt install pandoc
# 安装 hwpdf
./install.sh
# 使用 hwpdf 将 Markdown 转换为 HTML
hwpdf test.md
```

默认会生成一个 test.html 文件，可以直接用浏览器打开，然后使用浏览器的打印功能保存为 PDF，打开时需要联网，因为 Latex 的数学公式需要通过在线工具进行渲染。
