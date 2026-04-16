# 🧬 scRNA-seq 实践教程：从零到发表

> **一个数据集，十三章教程，完整的单细胞RNA测序分析流程。**

基于 **GSE136103 肝硬化数据集**（Ramachandran et al., *Nature*, 2019），使用 Python/Scanpy 生态，从原始数据到出版级可视化，手把手走完 scRNA-seq 分析全流程。

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Python 3.10](https://img.shields.io/badge/Python-3.10-blue.svg)](https://www.python.org/)
[![Scanpy](https://img.shields.io/badge/Scanpy-≥1.10-green.svg)](https://scanpy.readthedocs.io/)

---

## ✨ 为什么选这个教程

| 特色 | 说明 |
|------|------|
| 🔗 **一个数据集贯穿始终** | 不跳数据集，从QC到最终可视化全程追踪同一批细胞 |
| 🇨🇳 **中文原创** | 非翻译，专为中文生信社区编写 |
| ⚖️ **方法选择指南** | 每章附方法对比表 + "为什么选这个方法"的详细讨论 |
| ⚠️ **踩坑预警** | 标注实际操作中的常见错误和陷阱 |
| 📊 **完整代码** | 每章对应一个可运行的 Jupyter Notebook |
| 📖 **与原文比较** | 对照原始论文，分析"我们的结果 vs 作者的结果" |

---

## 📚 教程目录

| 章节 | 主题 | 核心内容 | Notebook |
|------|------|----------|----------|
| 01 | **技术原理** | scRNA-seq 生物学原理与技术平台 | [📓](notebooks/01_技术原理.ipynb) |
| 02 | **数据与QC** | 环境搭建、数据获取、质控过滤 | [📓](notebooks/02_数据与QC.ipynb) |
| 03 | **降维聚类** | 归一化→HVG→PCA→UMAP→Leiden聚类 | [📓](notebooks/03_降维聚类.ipynb) |
| 04 | **Harmony矫正** | 批次效应识别与Harmony整合 | [📓](notebooks/04_Harmony矫正.ipynb) |
| 05 | **细胞注释** | 手动Marker + CellTypist + 亚群细分 | [📓](notebooks/05_细胞注释.ipynb) |
| 06 | **差异表达** | Wilcoxon + Pseudobulk DESeq2 | [📓](notebooks/06_差异表达.ipynb) |
| 07 | **功能富集** | ORA + GSEA + decoupler通路评分 | [📓](notebooks/07_功能富集.ipynb) |
| 08 | **细胞通讯** | LIANA多方法共识通讯分析 | [📓](notebooks/08_细胞通讯.ipynb) |
| 09 | **TF网络** | decoupler + CollecTRI 转录因子活性推断 | [📓](notebooks/09_TF网络.ipynb) |
| 10 | **细胞组成** | 组成变化统计与组成性偏差讨论 | [📓](notebooks/10_细胞组成.ipynb) |
| 11 | **轨迹分析** | PAGA + DPT + CytoTRACE2 拟时序分析 | [📓](notebooks/11_轨迹分析.ipynb) |
| 12 | **共表达** | 共表达模块发现与基因集评分 | [📓](notebooks/12_共表达.ipynb) |
| 13 | **可视化** | 出版级图表制作 | [📓](notebooks/13_可视化.ipynb) |

---

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/petemeng/scRNA-Tutorial.git
cd scRNA-Tutorial
```

### 2. 创建环境

```bash
# 使用 conda/mamba
conda env create -f environment.yml
conda activate scrna-tutorial

# 或使用 mamba（更快）
mamba env create -f environment.yml
mamba activate scrna-tutorial
```

### 3. 下载数据

```bash
bash scripts/download_data.sh
```

### 4. 开始学习

```bash
jupyter lab notebooks/
```

从 `01_技术原理.ipynb` 开始，按顺序学习即可。

---

## 📁 项目结构

```
scRNA-Tutorial/
├── README.md                 # 本文件
├── environment.yml           # conda 环境配置
├── .gitignore
├── notebooks/                # 📓 主要教程（Jupyter Notebooks）
│   ├── 01_技术原理.ipynb
│   ├── 02_数据与QC.ipynb
│   ├── ...
│   └── 13_可视化.ipynb
├── scripts/                  # 辅助脚本
│   └── download_data.sh      # 数据下载
├── data/                     # 原始数据（不上传至 git）
│   └── raw/
└── results/                  # 分析中间文件（不上传至 git）
```

---

## 🧪 数据集信息

| 项目 | 信息 |
|------|------|
| **GEO 编号** | [GSE136103](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE136103) |
| **原始论文** | Ramachandran et al., *Resolving the fibrotic niche of human liver cirrhosis at single-cell level*, Nature, 2019 |
| **样本** | 5 例人肝组织（3 Healthy + 2 Cirrhotic） |
| **细胞数** | ~10万细胞（QC后约5.8万） |
| **平台** | 10x Chromium (v2 chemistry, 3' gene expression) |
| **物种** | 人（Homo sapiens, GRCh38） |

---

## 🔬 方法选择指南（每章内置）

每一章包含一个**方法选择指南**卡片，提供：

- ✅ 我们选择的方法及理由
- 📊 替代方法的对比表格
- 🤔 何时应该考虑其他方法
- ⚠️ 常见误区与踩坑提示

覆盖的关键方法选择：

| 分析步骤 | 对比的方法 |
|----------|-----------|
| 归一化 | LogNormalize vs SCTransform vs scran |
| 聚类 | Leiden vs Louvain vs K-means |
| 批次整合 | Harmony vs scVI vs Scanorama vs BBKNN vs CCA |
| 细胞注释 | 手动Marker vs CellTypist vs SingleR vs Azimuth |
| 差异表达 | Wilcoxon vs DESeq2(pseudobulk) vs MAST vs edgeR |
| 富集分析 | ORA vs GSEA vs decoupler ULM |
| 细胞通讯 | CellPhoneDB vs CellChat vs NicheNet vs LIANA |
| TF推断 | decoupler vs pySCENIC vs SCENIC+ |
| 组成分析 | MWU vs scCODA vs MiloR vs propeller |
| 轨迹分析 | PAGA vs DPT vs Monocle 3 vs scVelo vs Palantir |

---

## 📖 配套阅读

本教程在**微信公众号**上同步发布（含精美排版和图片），搜索关注获取图文版：

> 🔍 公众号名称：**[待填写]**

---

## 🤝 贡献指南

欢迎通过以下方式参与改进：

- 🐛 **Bug 报告**：发现代码错误？请提交 [Issue](https://github.com/petemeng/scRNA-Tutorial/issues)
- 💡 **建议**：有更好的方法或补充内容？欢迎 Issue 讨论
- 🔧 **PR**：直接提交代码/内容改进
- 🌍 **翻译**：帮助将教程翻译为英文

---

## 📄 许可证

本教程采用 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可证。

- ✅ 可以自由分享和改编
- ✅ 需要注明出处
- ❌ 不可商业使用
- 🔄 改编作品需使用相同许可证

---

## ⭐ 致谢

- [Scanpy](https://scanpy.readthedocs.io/) — 核心分析框架
- [sc-best-practices](https://www.sc-best-practices.org/) — 方法论参考
- Ramachandran et al. (2019) — 原始数据与生物学洞察
- 所有提交 Issue 和 PR 的贡献者

---

<p align="center">
  如果这个教程对你有帮助，请给一个 ⭐ Star！
</p>
