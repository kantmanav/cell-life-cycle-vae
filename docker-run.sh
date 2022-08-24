docker run -it \
--gpus "device=1" \
-p 91:8888 \
-v $PWD:/cell-life-cycle-vae \
-v /deepcell_data/users/manav/summer_2022:/data \
$USER/cell-life-cycle-vae:0.12.2
