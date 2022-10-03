	nncase ir1.7.1:¾
š
Concat_226(Concat)
!Conv_236(Conv)_load_data_deq_loadConv_236(Conv)_load_dataConv_236(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_236(Conv)_load_weights/weights_constant
(Conv_236(Conv)_load_weights/load_weightsConv_236(Conv)_load_weightsConv_236(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_236(Conv)/psumConv_236(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_236(Conv)/actConv_236(Conv)_load_actConv_236(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
™
"Conv_236(Conv)_load_data_deq_const!Conv_236(Conv)_load_data_deq_load!Conv_236(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_236(Conv)_load_weights/weights_constant/ptq_deq(Conv_236(Conv)_load_weights/load_weights(Conv_236(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_236(Conv)Sigmoid_237.(Sigmoid)/broadcastSigmoid_237.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_237.(Sigmoid)/broadcast
;Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_236(Conv)_load_data
Conv_236(Conv)_load_weights
Conv_236(Conv)/psum
Conv_236(Conv)_load_actConv_236(Conv)Conv_236(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_226(Concat)


€



ZH
,Conv_236(Conv)_load_weights/weights_constant

€
€

Z-
Conv_236(Conv)/act



€
Z=
"Conv_236(Conv)_load_data_deq_const



€
ZO
4Conv_236(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_236(Conv)_load_data


€



j7
Conv_236(Conv)_load_weights

€
€

j.
Conv_236(Conv)/psum


€



j2
Conv_236(Conv)_load_act



€
j<
!Conv_236(Conv)_load_data_deq_load



€
jC
(Conv_236(Conv)_load_weights/load_weights



€
jV
;Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_237.(Sigmoid)/broadcast


€



jM
2Sigmoid_237.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_236(Conv)


€



