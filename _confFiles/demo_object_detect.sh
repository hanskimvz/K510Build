cd /app/ai/exe
#YOLO
#./object_detect ../kmodel/kmodel_release/object_detect/yolov5s_320/yolov5s_320_sigmoid_bf16_with_preprocess_output_nhwc.kmodel 320 240 320 0.5 0.45 ./video_object_detect_320.conf  1 0 None
./object_detect_demo ../kmodel/kmodel_compile/object_detect_demo/od_bf16.kmodel 0  &
cd /
