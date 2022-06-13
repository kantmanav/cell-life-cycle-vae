docker run -it \
--gpus "device=2" \
-p 90:8888 \
-v $PWD:/cell-life-cycle-vae \
-v /deepcell_data/users/manav:/data \
-v /home/mkant/data-registry/data/training:/training \
$USER/cell-life-cycle-vae:0.12.0
