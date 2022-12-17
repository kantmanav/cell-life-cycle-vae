docker run -it \
--gpus "device=2" \
-p 93:8888 \
-v $PWD:/cell-life-cycle-vae \
-v ~/data/users/manav/summer_2022:/data \
-v ~/tf_records:/tf_records \
$USER/cell-life-cycle-vae:0.12.2
