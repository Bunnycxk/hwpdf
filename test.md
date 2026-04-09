# 这是一级标题

这一份文档用于测试从 **Markdown → HTML → 浏览器打印 → PDF** 的效果。

我希望它满足下面几个要求：

- 样式尽量接近 VS Code 的 Markdown 预览
- 行内代码例如 `vector<int>` 要有浅色背景
- 代码块应该自动换行，而不是超出页面
- `$$ ... $$` 包裹的公式块必须居中
- 表格不要太松散，但要清楚易读

## 普通段落

下面是一段较长的文字，用来观察 PDF 中的正文排版效果。对于大多数作业场景来说，简洁、规整、可打印，比“花里胡哨”更重要。这个模板的目标不是做成海报风，而是做成**稳定、干净、接近编辑器预览**的风格。

## 行内公式与块公式

行内公式示例：设二次函数为 $f(x)=ax^2+bx+c$，则其顶点横坐标为 $x=-\frac{b}{2a}$。

块公式示例：

$$
\operatorname*{arg\,min}_{\theta}
\sum_{i=1}^{n}
\left(y_i - f_\theta(x_i)\right)^2
$$

再来一个矩阵公式：

$$
C_{ij}=\sum_{k=1}^{n} A_{ik}B_{kj}
$$

## 代码块

下面这个代码块特意写了一行很长很长的内容，用来测试自动换行是否生效。

```cpp
#include <iostream>
#include <vector>
#include <string>

int main() {
    std::string very_long_message = "This is a very very very very very very very very very very very very long line that should wrap automatically in the generated PDF instead of overflowing out of the page boundary.";
    std::vector<int> nums = {1, 2, 3, 4, 5, 6, 7, 8};

    for (auto x : nums) {
        std::cout << "value = " << x << ", message = " << very_long_message << std::endl;
    }
    return 0;
}
```

再来一个 shell 代码块：

```bash
chromium  --headless  --no-pdf-header-footer  --print-to-pdf=test.pdf  file://$(realpath test.html)
```

## 引用

> 这是一个引用块。  
> 适合放定义、说明或者作业里的补充文字。

## 表格

| 方法 | 时间(ms) | 备注 |
|---|---:|---|
| Naive | 16.893 | 基础实现 |
| Tiled | 9.298 | 分块优化后更快 |
| Double Naive | 51.415 | 双精度更慢 |
| Double Tiled | 45.032 | 有优化，但提升有限 |

## 二级标题测试

### 三级标题测试

这一段只是用来确认标题层级在打印后是否清楚。

1. 第一项
2. 第二项
3. 第三项

---

最后一段：如果这份测试文档看起来正常，通常你后续的作业只需要继续沿用这套命令和这份 CSS，然后按需微调即可。
