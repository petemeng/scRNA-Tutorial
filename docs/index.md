# 单细胞 RNA-seq 最佳实践系列

这套站点来自人类肝硬化单细胞图谱（GSE136103, Ramachandran et al., Nature 2019）的完整分析教程，涵盖 58,735 个细胞从原始数据到 12 种高级分析的全流程。

## 这版网页包含什么

- 共 13 篇正文页面，覆盖从 GEO 下载到轨迹分析、细胞通讯、转录因子调控等高级主题。
- 当前正文中嵌入了 0 张真实结果图，全部来自 Scanpy + decoupler + LIANA 等工具的实际运行产物。
- 页面源码和部署配置与 GitHub Pages 对齐，可直接 fork 或继续扩写。

## 开始阅读

<div class="grid cards" markdown>

- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（一）：肝硬化图谱——从 GEO 下载到 58,735 个细胞的第一次相遇](series/01.md)
  单细胞 RNA seq（scRNA seq）已经从"新技术"变成了生命科学研究的基础设施。2019 年至今，PubMed 上每年新增的单细胞相关论文已超过万篇。但如果你第一次面对一个真实的 scRNA seq 数据集，从 GEO...
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（二）：质量控制——如何从 81,448 个液滴中找到 58,735 个真正的细胞](series/02.md)
  上一篇我们从 GEO 下载了 GSE136103 数据，合并后得到 81,448 个"细胞"。注意这里的引号——这 8 万多个液滴中，有相当一部分并不是真正的、高质量的单个细胞。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（三）：归一化、降维与聚类——从一堆数字到"看见"细胞群体](series/03.md)
  上一篇 QC 之后，我们手里有 58,735 个高质量细胞。但此时数据还是一张 58,735 × 25,354 的巨大稀疏矩阵——你看不出任何结构。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（四）：Harmony 批次矫正——让 20 个文库"说同一种语言"](series/04.md)
  上一篇我们对 58,735 个细胞做了归一化、PCA 降维和 Leiden 聚类，得到了 25 个 cluster。但如果你仔细看 UMAP 上按 sample 着色的图，可能会发现一个问题： 有些 cluster...
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（五）：细胞注释——给 58,735 个细胞"取名字"](series/05.md)
  前四篇我们完成了"技术层面"的数据处理：QC、归一化、降维、聚类、批次矫正。得到了 20 个 Leiden cluster——但这些 cluster 只是无名的数字编号（0, 1, 2, ...）。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（六）：差异表达分析——寻找疾病改变了哪些基因](series/06.md)
  前五篇我们做了一件事： 认识你的数据 。QC 去掉了坏细胞，归一化统一了量纲，整合消除了批次效应，注释给了每个细胞身份标签。我们现在有 58,735 个细胞、12 种大类、26 种细注释亚群。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（七）：功能富集分析——从基因列表到生物学故事](series/07.md)
  上一篇我们用 Wilcoxon 和 DESeq2 找到了几百到上千个差异表达基因。但一张写满基因名的表格不是生物学洞察—— 审稿人想看的是通路，不是基因列表 。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（八）：细胞通讯分析——谁在和谁"说话"？](series/08.md)
  前面几篇我们一直在回答一个问题： 每种细胞在疾病中"自己"发生了什么变化？ 差异表达告诉我们基因层面的变化，功能富集告诉我们通路层面的变化。但这些分析都是"细胞类型内部"的视角。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（九）：转录因子调控网络——谁在"指挥"基因表达？](series/09.md)
  上一篇我们分析了细胞 之间 的对话——谁在和谁说话。这一篇，我们把视角转向细胞 内部 ：在每种细胞类型中，是 哪些转录因子（Transcription Factor, TF）在"指挥"基因表达程序？
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（十）：细胞组成分析——疾病改变了哪些细胞的比例？](series/10.md)
  前面的章节中，我们完成了差异表达、富集分析、通讯分析和转录因子网络——这些都在问" 同一种细胞在疾病中表达了什么不同的基因？ "
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（十一）：轨迹与拟时序分析——追踪细胞的"前世今生"](series/11.md)
  前面的章节中，我们一直在"静态"地观察细胞——数它们有多少个、看它们表达了什么基因、分析它们之间的通讯。但细胞是动态的：单核细胞会分化成巨噬细胞、naive T 细胞会被激活变成 effector T 细胞。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（十二）：共表达与基因集评分——用基因"套装"衡量细胞功能](series/12.md)
  前面 11 篇我们一直在"单基因"层面分析数据：差异表达看的是每个基因、TF 分析看的是每个转录因子、轨迹分析看的是沿拟时序每个基因的变化趋势。
- [:material-book-open-page-variant: 单细胞 RNA-seq 最佳实践系列（十三）：高级可视化与数据汇总——从分析到出版级图表](series/13.md)
  过去 12 篇，我们从 GEO 下载原始数据开始，经历了 QC、归一化、降维、聚类、批次矫正、细胞注释、差异表达、功能富集、细胞通讯、转录因子调控、细胞组成、轨迹分析、共表达模块——一步步把 58,735...

</div>

## 使用方式

- 左侧导航按章节阅读。
- 顶部搜索可直接检索工具名、参数名和图表位置。
- 如果你想复用这套站点骨架，bundle 中已经包含 `mkdocs.yml` 和 GitHub Pages workflow。

## 结果图索引

结果图汇总见 [图表总览](figures.md)。