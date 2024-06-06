#!/usr/bin/env bash
set -e          # 只要脚本发生错误就停止运行
set -u          # 如果遇到不存在的变量就报错并停止执行
set -x          # 运行指令结果的时候，输出对应的指令
set -o pipefail # 确保只要一个子命令失败，整个管道命令就失败

export CUDA_VISIBLE_DEVICES="$1"
echo 'Excute the script on GPU: ' "$1"

# output/MFFN_BS8_LR0.05_E50_H384_W384_OPMsgd_OPGMfinetune_SCf3_AMP_INFOacd+camo_norm_std
# output/MFFN_BS8_LR0.05_E50_H384_W384_OPMsgd_OPGMfinetune_SCf3_AMP_INFOno_norm_std_acd_camo
# output/MFFN_BS8_LR0.05_E50_H384_W384_OPMsgd_OPGMfinetune_SCf3_AMP_INFOnorm_std_optimization
# output/MFFN_custom_BS7_LR0.05_E50_H384_W384_OPMsgd_OPGMfinetune_SCf3_AMP_INFOcolor_attn (this is contrast/brightness)
echo 'For COD'
python test.py --config ./configs/MFFN/MFFN_R50.py \
    --model-name MFFN\
    --batch-size 22 \
    --load-from ./output/MFFN_BS8_LR0.05_E50_H384_W384_OPMsgd_OPGMfinetune_SCf3_AMP_INFOnorm_std_optimization/pth/state_final.pth \
    --save-path ./output/ForSharing/COD_Results_state_final_normstd

# echo 'For SOD'
# python test.py --config ./configs/MFFN/MFFN_R50_custom.py \
#     --model-name MFFN_custom \
#     --batch-size 22 \
#     --load-from ./output/MFFN_custom_BS7_LR0.05_E50_H384_W384_OPMsgd_OPGMfinetune_SCf3_AMP_INFOhuesaturation/pth/state_final.pth  \
#     --save-path ./output/ForSharing/SOD_Results_state_final_huesaturation
