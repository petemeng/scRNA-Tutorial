#!/bin/bash
# ============================================================
# 数据下载脚本 - GSE136103 (肝硬化单细胞RNA-seq)
# ============================================================
# 原始文献: Ramachandran et al., Nature, 2019
# 数据来源: GEO (https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE136103)
# ============================================================

set -e

DATA_DIR="data/raw"
RESULTS_DIR="results"

mkdir -p "$DATA_DIR"
mkdir -p "$RESULTS_DIR"

echo "=========================================="
echo " GSE136103 数据下载"
echo "=========================================="

# 5 个样本的 GEO 编号
SAMPLES=(
    "GSM4041145"  # Healthy 1
    "GSM4041146"  # Healthy 2
    "GSM4041147"  # Healthy 3
    "GSM4041148"  # Cirrhotic 1
    "GSM4041149"  # Cirrhotic 2
)

SAMPLE_NAMES=(
    "healthy_1"
    "healthy_2"
    "healthy_3"
    "cirrhotic_1"
    "cirrhotic_2"
)

echo ""
echo "方法 1: 使用 GEO 下载 (推荐)"
echo "---"
echo "请前往以下链接手动下载每个样本的 filtered_feature_bc_matrix:"
echo ""
for i in "${!SAMPLES[@]}"; do
    echo "  ${SAMPLE_NAMES[$i]}: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=${SAMPLES[$i]}"
done
echo ""
echo "下载后将每个样本的 barcodes.tsv.gz, features.tsv.gz, matrix.mtx.gz"
echo "放入 ${DATA_DIR}/<sample_name>/ 目录下。"
echo ""

echo "方法 2: 使用 wget 自动下载 (如果有直接链接)"
echo "---"
echo "注意: GEO 的下载链接可能需要登录或手动获取。"
echo "以下命令尝试从 GEO supplementary files 下载:"
echo ""

# 尝试下载 tar 包
GEO_TAR_URL="https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE136103&format=file"
echo "下载整个数据集 tar 包:"
echo "  wget -O ${DATA_DIR}/GSE136103_RAW.tar '${GEO_TAR_URL}'"
echo ""
echo "解压:"
echo "  tar -xf ${DATA_DIR}/GSE136103_RAW.tar -C ${DATA_DIR}/"
echo ""

echo "方法 3: 快速开始 (跳过原始数据)"
echo "---"
echo "如果你只想快速体验分析流程，可以从第三章开始——"
echo "我们提供了 QC 后的中间文件:"
echo "  results/01_after_qc.h5ad  (Ch02 输出 → Ch03 输入)"
echo ""
echo "中间文件下载（如果我们有提供的话）:"
echo "  git lfs pull  # 如果使用 Git LFS 存储"
echo ""

echo "=========================================="
echo " 目录结构说明"
echo "=========================================="
echo ""
echo "scRNA-Tutorial/"
echo "├── data/"
echo "│   └── raw/              # 原始 10x Genomics 输出"
echo "│       ├── healthy_1/"
echo "│       ├── healthy_2/"
echo "│       ├── healthy_3/"
echo "│       ├── cirrhotic_1/"
echo "│       └── cirrhotic_2/"
echo "├── results/              # 分析中间文件（各章之间传递）"
echo "│   ├── 01_after_qc.h5ad"
echo "│   ├── 02_after_dimred.h5ad"
echo "│   ├── 03_after_harmony.h5ad"
echo "│   └── ..."
echo "├── notebooks/            # Jupyter notebooks（主要教程）"
echo "├── figures/              # 生成的图片"
echo "└── environment.yml       # conda 环境配置"
echo ""
echo "=========================================="
echo " Done!"
echo "=========================================="
