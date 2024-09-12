CUDA_VISIBLE_DEVICES=2 python main.py --config-name=base prompt.prompt="a tiger" init.prompt="a tiger"

CUDA_VISIBLE_DEVICES=2 python main.py --config-name=base prompt.prompt="a dragon" init.prompt="a dragon"

CUDA_VISIBLE_DEVICES=2 python main.py --config-name=base prompt.prompt="a banana" init.prompt="a banana"

modelscope download --model AI-ModelScope/stable-diffusion-v1-5

# wget https://raw.githubusercontent.com/DagnyT/hardnet/master/pretrained/train_liberty_with_aug/checkpoint_liberty_with_aug.pth

# 需要指定 init.prompt https://github.com/gsgen3d/gsgen/issues/34

# 不然会有以下问题： 
# Same here. tried several prompts, such as corgi, panda, and man in a suit. All occurred severe Janus problem
# --- update ---
# the previous poor results were because when executing this command:
# python main.py --config-name=base prompt.prompt="<prompt>"
# the prompt for point-E was set to "a human face" as defined in base.yaml.
# Instead, after specifying init.prompt="<point-e prompt>", I got good results without Janus problem.
# BTW, it seems that the default configuration (conf/base.yaml) does not enable full functions, particularly the compactness-based densification and pruning, which are major contributions of the paper. Why are they not enabled? Wouldn't this lead to sub-optimal results?