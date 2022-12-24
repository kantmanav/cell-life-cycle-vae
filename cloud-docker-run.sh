sudo docker run -it \
--gpus "device=0" \
-p 93:8888 \
-v $PWD:/cell-life-cycle-vae \
-v ~/data:/data \
$USER/cell-life-cycle-vae:0.12.2
