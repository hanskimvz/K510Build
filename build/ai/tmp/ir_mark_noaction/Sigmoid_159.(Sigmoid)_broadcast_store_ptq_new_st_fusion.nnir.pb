	nncase ir1.7.1:¾
š
Concat_157(Concat)
!Conv_158(Conv)_load_data_deq_loadConv_158(Conv)_load_dataConv_158(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_158(Conv)_load_weights/weights_constant
(Conv_158(Conv)_load_weights/load_weightsConv_158(Conv)_load_weightsConv_158(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_158(Conv)/psumConv_158(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_158(Conv)/actConv_158(Conv)_load_actConv_158(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
™
"Conv_158(Conv)_load_data_deq_const!Conv_158(Conv)_load_data_deq_load!Conv_158(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_158(Conv)_load_weights/weights_constant/ptq_deq(Conv_158(Conv)_load_weights/load_weights(Conv_158(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_158(Conv)Sigmoid_159.(Sigmoid)/broadcastSigmoid_159.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_159.(Sigmoid)/broadcast
;Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_158(Conv)_load_data
Conv_158(Conv)_load_weights
Conv_158(Conv)/psum
Conv_158(Conv)_load_actConv_158(Conv)Conv_158(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_157(Concat)


€



ZH
,Conv_158(Conv)_load_weights/weights_constant

€
€

Z-
Conv_158(Conv)/act



€
Z=
"Conv_158(Conv)_load_data_deq_const



€
ZO
4Conv_158(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_158(Conv)_load_data


€



j7
Conv_158(Conv)_load_weights

€
€

j.
Conv_158(Conv)/psum


€



j2
Conv_158(Conv)_load_act



€
j<
!Conv_158(Conv)_load_data_deq_load



€
jC
(Conv_158(Conv)_load_weights/load_weights



€
jV
;Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_159.(Sigmoid)/broadcast


€



jM
2Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_158(Conv)


€



